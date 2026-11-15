# zstd/tests/smoke.star — stable across upstream zstd releases.
# Asserts the contract (version shape, a compress -> test -> decompress round
# trip on hermetic input, and rejection of non-zstd input), never banner prose.
#
# This package ships windows/amd64 only (upstream publishes no other binary), so
# the Windows spelling is the only live branch; the ternary keeps the script
# honest if a platform is ever added.

ZSTD = "zstd.exe" if ocx.target_platform.os == ocx.os.Windows else "zstd"

# ── Tier 1 + 2: liveness on the composed PATH + version SHAPE ───────────────
r_version = ocx.run(ZSTD, "-V")
expect.ok(r_version)
expect.matches(r_version.stdout, r"v\d+\.\d+\.\d+")

# ── Tier 3: round trip on a file this script writes ─────────────────────────
# The payload is repetitive (compressible) and carries a token that exists
# nowhere in the package, so a decompressor that emitted anything other than
# the original bytes cannot pass by accident.
PAYLOAD = "ocx-zstd-roundtrip-7f3a91\n" * 2000
ocx.write_file("in.txt", PAYLOAD)

r_c = ocx.run(ZSTD, "-q", "-f", "in.txt", "-o", "out.zst")
expect.ok(r_c)
expect.true(ocx.exists("out.zst"))

# Frame integrity check built into the CLI.
expect.ok(ocx.run(ZSTD, "-q", "-t", "out.zst"))

# Decompress to a NEW path (absent before this call) and compare to the input.
expect.false(ocx.exists("back.txt"))
r_d = ocx.run(ZSTD, "-q", "-d", "out.zst", "-o", "back.txt")
expect.ok(r_d)
expect.eq(ocx.read_file("back.txt"), PAYLOAD)

# ── Negative control: non-zstd input must be refused, not passed through ────
ocx.write_file("garbage.zst", "this is not a zstd frame\n")
r_bad = ocx.run(ZSTD, "-q", "-d", "-c", "garbage.zst")
expect.ne(r_bad.exit_code, 0)
