# mirror-meta

OCX mirror for [Zstandard](https://github.com/meta/zstd) (`zstd`), published by
Meta. One repository, one spec directory per package.

| Package | Spec | Publishes to | Announced as | Upstream SPDX |
|---|---|---|---|---|
| [zstd](https://github.com/meta/zstd) | [`zstd/mirror.yml`](zstd/mirror.yml) | `ghcr.io/ocx-contrib/meta/zstd` | [`ocx.sh/meta/zstd`](https://index.ocx.sh/meta/zstd) | `BSD-3-Clause OR GPL-2.0-only` (BSD exercised) |

Each upstream release is discovered, re-bundled, smoke-tested per
`(version, platform)` and only then pushed with cascade tags, after which the
result is announced into the OCX index.

**Windows only.** Upstream publishes prebuilt binaries for Windows
(`zstd-v<V>-win64.zip`) and nothing else; this mirror ships that and does not
build from source. Only 1.5.5 and later are mirrored (earlier archive layouts
differ per release).

## Layout

```
zstd/
├── mirror.yml          the spec — never at the repo root
├── metadata.json       bundle interface
├── CATALOG.md          → ocx package describe
├── logo.svg / logo.png describe assets, 512px PNG
└── tests/smoke.star    Starlark smoke test
```

`LICENSE` and `NOTICE.md` are shared at the root.

## Edit and regenerate

`.github/workflows/mirror-zstd.yml`, `describe-zstd.yml`,
`announce-from-registry-zstd.yml`, `cascade-zstd.yml`, `patch-zstd.yml` and
`verify-generated.yml` are generated. Never hand-edit them; change the spec and
run, naming every spec:

```sh
direnv allow    # once: puts the pinned ocx / ocx-mirror on PATH
ocx-mirror package validate zstd/mirror.yml
ocx-mirror package pipeline generate ci --spec zstd/mirror.yml
```

Push straight to `main`; this repository takes no pull requests.
