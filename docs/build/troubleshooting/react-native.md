---
title: App Center Build Code React Native Troubleshooting
description: Troubleshooting issues with React Native in Build
keywords: build, troubleshooting
author: nrajpurkar
ms.author: nirajpur
ms.date: 05/30/2019
ms.topic: article
ms.assetid: 3b2dde5f-e2c2-44fc-8834-928f7d73ce9a
ms.service: vs-appcenter
ms.custom: build
---

# React Native Troubleshooting

## <a name="FBSDKCoreKit"/>My React Native build fails with: 'FBSDKCoreKit/FBSDKCoreKit.h' file not found

If the project is compiling locally and failing in App Center, the issue is likely related to the Facebook SDK expecting that it is installed in the user's home directory. This can be problematic for hosted builds. To work around this requirement follow these steps:

* Check in the FacebookSDK to your repository. It can go anywhere, but the script below assumes it's added to `<repo-root>/vendor/FacebookSDK`.

* Add a npm preinstall script to your package.json:

```json
"scripts": {
    ...
    "preinstall": "./npmpreinstall.sh"
}
```

Where `npmpreinstall.sh` symlinks `~/Documents/FacebookSDK` to your repo with the following:

```shell
#!/bin/sh
if [ ! -L ~/Documents/FacebookSDK ]; then
    echo 'Symlinking ~/Documents/FacebookSDK to Facebook SDK in repo'
    ln -s $(cd ./vendor/FacebookSDK; pwd) ~/Documents/FacebookSDK
fi
```
* Make `npmpreinstall.sh` executable: 

```shell
chmod u+x npmpreinstall.sh
```

## <a name="heap-out"/>My React Native build fails with "FATAL ERROR: CALL_AND_RETRY_LAST Allocation failed - JavaScript heap out of memory"

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
