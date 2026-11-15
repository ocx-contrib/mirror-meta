---
title: zstd
description: Zstandard — fast lossless compression with zlib-class ratios at much higher speed, with a command-line tool for compressing and decompressing files
keywords: zstd,zstandard,compression,decompression,archive,lossless,cli,meta
---

# zstd

[Zstandard](https://facebook.github.io/zstd/) (`zstd`) is a fast lossless
compression algorithm and command-line tool developed at Meta. It targets
real-time compression with ratios comparable to zlib at substantially higher
speed, offers compression levels from fast (`-1`) to maximum (`--ultra -22`),
multi-threaded operation (`-T0`), long-distance matching for large inputs, and
trained dictionaries for small data.

## What's included

- **zstd** — the command-line tool (`zstd.exe`). `zstd file` compresses to
  `file.zst`, `zstd -d file.zst` decompresses, `zstd -t` verifies a frame, and
  `zstd -l` lists frame metadata.

The archive also ships upstream's `README.md`, the `libzstd` DLL and static
library, the public headers, and the library's example sources.

## Platforms

**`windows/amd64` only.** Upstream publishes prebuilt binaries for Windows
alone; every release otherwise carries just source tarballs. This package
redistributes those upstream Windows builds unmodified and does not build from
source, so there is no linux or macOS build here. Use your system package
manager on those platforms (`apt install zstd`, `brew install zstd`, ...).

The 32-bit Windows build (`win32`) and `windows/arm64` are not provided. Only
releases 1.5.5 and later are mirrored: earlier releases changed the archive
layout from one version to the next.

## Usage

```sh
# compress, keeping the input; level 19, all cores
zstd -19 -T0 data.tar -o data.tar.zst
```

```sh
# decompress to stdout, or verify without writing anything
zstd -d -c data.tar.zst
zstd -t data.tar.zst
```

```sh
# compress a directory by piping through tar
tar -cf - project | zstd -T0 > project.tar.zst
```

## Links

- [zstd on GitHub](https://github.com/meta/zstd)
- [Project site](https://facebook.github.io/zstd/)
- [Command-line manual](https://facebook.github.io/zstd/zstd_manual.html)
- [Format specification (RFC 8878)](https://datatracker.ietf.org/doc/html/rfc8878)
