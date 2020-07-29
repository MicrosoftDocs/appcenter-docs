---
title: Generating a Breakpad Symbols Upload Payload
author: bryansmith
ms.topic: include
---

## Generate a .zip file to upload

There are two ways for App Center to retrieve the symbols necessary for symbolication. App Center can generate them from the native binaries used in your project, or you can upload the Breakpad symbols directly.

### Option 1: Upload native binaries
Put all .so files from the project's `obj/local/$ABI/` directory into a .zip file.

### Option 2: Upload Breakpad symbols
1. Dump the symbols using the Breakpad toolchain as described in the [Breakpad documentation](https://chromium.googlesource.com/breakpad/breakpad/+/master/README.ANDROID#93) under section "Get the debugging symbols".
2. Create a **symbols.zip** file with the following structure:
> [!NOTE]
> If you are uploading your symbols from macOS, then you must clean your symbols of any extraneous folders, e.g. __MACOS gets generated and to delete this you can use `zip -d <symbols.zip> __MACOSX/\*`.

```text
$ unzip -l symbols.zip
Archive:  symbols.zip
  Length     Date   Time    Name
 --------    ----   ----    ----
        0  07-22-13 15:07   symbols/
        0  07-22-13 15:07   symbols/libnative.so/
        0  07-22-13 15:07   symbols/libnative.so/EAC901FB6DDCCE8AED89E1A8E4A58360/
    12468  07-22-13 15:07   symbols/libnative.so/EAC901FB6DDCCE8AED89E1A8E4A58360/libnative.so.sym
        0  07-22-13 15:07   symbols/libnative.so/FDC5C9E715C4F16408C0B78F95855BF0/
    12467  07-22-13 15:07   symbols/libnative.so/FDC5C9E715C4F16408C0B78F95855BF0/libnative.so.sym
 --------                   -------
    24935                   6 files
```