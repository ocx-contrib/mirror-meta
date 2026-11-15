# NOTICE

This repository packages and redistributes upstream software published by
[Meta](https://github.com/meta/zstd) (formerly `facebook/zstd`). The Apache-2.0
license in [`LICENSE`](LICENSE) covers the OCX pipeline files authored here. It
does **not** cover any upstream-derived asset — each package's redistributed
bytes carry their own license, recorded below.

Each package's logo in this repository is traced from the **upstream project's
own mark** (`doc/images/zstd_logo86.png`), solely to identify the software being
mirrored. No endorsement or affiliation is implied, and no trademark right is
claimed.

| Package | GHCR path | Upstream SPDX |
|---|---|---|
| `zstd` | `ghcr.io/ocx-contrib/meta/zstd` | `BSD-3-Clause OR GPL-2.0-only` (BSD-3-Clause exercised) |

---

## `zstd`

Upstream: <https://github.com/meta/zstd>
Published to `ghcr.io/ocx-contrib/meta/zstd`.

| Component | SPDX | Holder |
|---|---|---|
| Zstandard (`zstd.exe`) | **BSD-3-Clause OR GPL-2.0-only** | Copyright (c) Meta Platforms, Inc. and affiliates |

GitHub's license API answers `NOASSERTION` for this repository because it ships
two license files. They were read by hand: `LICENSE` is the BSD 3-Clause license
("BSD License / For Zstandard software", Copyright (c) Meta Platforms, Inc. and
affiliates), and `COPYING` is the GNU GPL version 2. The upstream README states
the project is dual-licensed under both, at the recipient's choice.

**This mirror redistributes under the BSD-3-Clause option.** BSD-3-Clause is
permissive: redistribution in binary form requires reproducing the copyright
notice, the conditions and the disclaimer, and forbids using the names Facebook
or Meta, or its contributors, to endorse derived products. The package bundle is
the unmodified upstream Windows zip contents; this notice carries the BSD-3-Clause
text's required attribution, and nothing here implies endorsement by Meta. Since
the BSD option is the one exercised, no GPL source-conveyance duty is incurred;
the tagged source for every mirrored version is nonetheless published upstream at
<https://github.com/meta/zstd/releases> (`zstd-<version>.tar.gz`).

Only the Windows binaries upstream publishes are redistributed; nothing is built
by this mirror.
