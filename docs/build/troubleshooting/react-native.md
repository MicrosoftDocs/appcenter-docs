---
title: App Center Build Code React Native Troubleshooting
description: Troubleshooting issues with React Native in Build
keywords: build, troubleshooting
author: nrajpurkar
ms.author: nirajpur
ms.date: 02/06/2019
ms.topic: article
ms.assetid: 3b2dde5f-e2c2-44fc-8834-928f7d73ce9a
ms.service: vs-appcenter
ms.custom: build
---

# React Native Troubleshooting

## <a name="engine-node"/>My React Native Builds fail with, "The engine "node" is incompatible with this module. Expected version ">=x.x.x" ; error Found incompatible module

If you come across a failure like this in your React Native builds, add a **Post-Clone script** with the following:

```shell
#!/usr/bin/env bash
set -ex
brew uninstall node@6
NODE_VERSION="8.9.4"
curl "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.pkg" > "$HOME/Downloads/node-installer.pkg"
sudo installer -store -pkg "$HOME/Downloads/node-installer.pkg" -target "/"
```

Replace the value of NODE_VERSION with the exact one you want.

> [!NOTE] 
> If you are using RN 0.56.0 later, you'd be forced to use Node 8.12, you will see these lines in the Build logs
>```text
>Now using node v8.12.0 (npm v6.4.1)
>default -> node8 (-> v8.12.0 *)
>```

If you want to force us to select the Node version you want, you can do so by modifying the post-clone script to 

```shell
#!/bin/sh

# please specify required Node.js version
NODE_VERSION=8.10.0

# workaround to override the v8 alias
npm config delete prefix
. ~/.bashrc
nvm install "$NODE_VERSION"
nvm alias node8 "$NODE_VERSION"
```

Post making changes to the Build Script, **Edit** the Build Branch Configuration and Click on **Save** to re-save the Build Configuration for App Center to pick up the changes, or **Save and Build** to immediately queue a build, after saving changes. 

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

```
chmod u+x npmpreinstall.sh
```

## <a name="heap-out"/>My React Native build fails with "FATAL ERROR: CALL_AND_RETRY_LAST Allocation failed - JavaScript heap out of memory"

The issue can be resolved by allocating more memory with the `--max-old-space-size` flag.

On Android, add the following to the project's **build.gradle** file:

```
project.ext.react = [
    nodeExecutableAndArgs: ["node", "--max_old_space_size=8192"]
]
```

On iOS, in Xcode, select your target and go to the **Build Phases** tab, in the section **Bundle React Native code and images**, add the flag to the shell script:

```
export NODE_BINARY='node --max_old_space_size=8192'
../node_modules/react-native/packager/react-native-xcode.sh
```
