---
title: App Center Build Code React Native Troubleshooting
description: Troubleshooting issues with React Native in Build
keywords: build, troubleshooting
author: lucen-ms
ms.author: lucen
ms.date: 06/08/2020
ms.topic: article
ms.assetid: 3b2dde5f-e2c2-44fc-8834-928f7d73ce9a
ms.service: vs-appcenter
ms.custom: build
---

# React Native Troubleshooting

[!INCLUDE [Retirement announcement for App Center](~/includes/retirement.md)]

## My React Native build fails with: 'FBSDKCoreKit/FBSDKCoreKit.h' file not found
This error is usually because the Facebook SDK expects that it's installed in the user's home directory, which can be problematic for hosted builds. To work around this requirement, follow these steps:

1. Check in the FacebookSDK to your repository. It can go anywhere, but the script below assumes it's added to `<repo-root>/vendor/FacebookSDK`.

2. Add an npm preinstall script to your package.json:
```json
"scripts": {
    ...
    "preinstall": "./npmpreinstall.sh"
}
```

3. `npmpreinstall.sh` symlinks `~/Documents/FacebookSDK` to your repo with the following code:
```shell
#!/bin/sh
if [ ! -L ~/Documents/FacebookSDK ]; then
    echo 'Symlinking ~/Documents/FacebookSDK to Facebook SDK in repo'
    ln -s $(cd ./vendor/FacebookSDK; pwd) ~/Documents/FacebookSDK
fi
```
4. Make `npmpreinstall.sh` executable: 
```shell
chmod u+x npmpreinstall.sh
```

## My React Native build fails with "FATAL ERROR: CALL_AND_RETRY_LAST Allocation failed - JavaScript heap out of memory"
The issue can be resolved by allocating more memory with the `--max-old-space-size` flag.

On Android, add the following to the project's **build.gradle** file:

```groovy
project.ext.react = [
    nodeExecutableAndArgs: ["node", "--max_old_space_size=8192"]
]
```

On iOS, in Xcode, select your target and go to the **Build Phases** tab, in the section **Bundle React Native code and images**, add the flag to the shell script:
```shell
export NODE_BINARY="'node --max_old_space_size=8192'
../node_modules/react-native/packager/react-native-xcode.sh"
```
