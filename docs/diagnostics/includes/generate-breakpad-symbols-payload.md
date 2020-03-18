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