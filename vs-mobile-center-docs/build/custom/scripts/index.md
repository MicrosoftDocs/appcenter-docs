---
title: Build Scripts
description: 
keywords: build, pre, post, custom, scripts
author: danieladams
ms.author: v-daada
ms.date: 06/27/2017
ms.topic: article
ms.assetid: 3603ae8a-8adc-49df-9eee-f078008691af
ms.service: mobile-center
ms.custom: build
---

# Build scripts
You can add up to three custom build steps that run at pre-defined stages during build time. Place the scripts with the respective format next to the project-level (`.xcodeproj`, `build.gradle`, `.csproj`, `.sln` or `package.json`) file that you've selected in the build configuration and we will run them as custom build steps. For iOS and Android apps, we support Bash scripts, for UWP apps we support PowerShell scripts. If one of your scripts is failing, the whole build will fail. This way we ensure it won’t fail at a later time and therefore saves you build time.

**NOTE:** Once your build scripts have been detected make sure to re-save the branch configuration!

![Save detected scripts][build-scripts-detected]

## Post-clone
The post-clone script runs immediately after the repository was cloned but before we do anything else on our end.

To run scripts post-clone, add the following file next to the project file in your repository:

### iOS and Android
`mobile-center-post-clone.sh`

```
#!/usr/bin/env bash

# Example: Clone some project
git clone https://github.com/example/SomeProject

```

### UWP
`mobile-center-post-clone.ps1`

## Pre-build
The pre-build script runs before the actual build starts, but after we have installed dependencies from e.g. NuGet, CocoaPods or Carthage.

To run scripts pre-buid, add the following file next to the project file in your repository:

### iOS and Android
`mobile-center-pre-build.sh`

```
#!/usr/bin/env bash
```

### UWP
`mobile-center-pre-build.ps1`

## Post-build
The post-build script runs after the build has finished and we have copied all the necessary artifacts to the output directory.

To run scripts post-build, add the following file next to the project file in your repository:

### iOS and Android
`mobile-center-post-build.sh`

```
#!/usr/bin/env bash

HOCKEYAPP_API_TOKEN={API_Token}
HOCKEYAPP_APP_ID={APP_ID}

# Example: Upload to HockeyApp using the API
curl \
-F "status=2" \
-F "notify=0" \
-F "notes_type=1" \
-F "ipa=@$MOBILECENTER_OUTPUT_DIRECTORY/MyApps.ipa" \
-H "X-HockeyAppToken: $HOCKEYAPP_API_TOKEN" \
https://rink.hockeyapp.net/api/2/apps/$HOCKEYAPP_APP_ID/app_versions/upload

```

### UWP
`mobile-center-post-build.ps1`

## Environment variables
We set the following environment variables, so you can access them from your build scripts.

| Variable | Description |
| --------------------------------- | --- |
| `MOBILECENTER_BUILD_ID` | The unique identifier for the current build |
| `MOBILECENTER_BRANCH` | Name of the branch that is being built from |
| `MOBILECENTER_SOURCE_DIRECTORY` | Location of the source code on the build machine |
| `MOBILECENTER_OUTPUT_DIRECTORY` | Location where the build results are stored in |
| `MOBILECENTER_TRIGGER` | What triggered the build, was it `manual` or `continuous` by push |

## iOS variables

| Variable | Description |
| --------------------------------- | --- |
| `MOBILECENTER_XCODE_PROJECT` | Selected Xcode project |
| `MOBILECENTER_XCODE_SCHEME` | Selected Xcode scheme |

## Android variables

| Variable | Description |
| --------------------------------- | --- |
| `MOBILECENTER_ANDROID_VARIANT` | Selected Android variant |
| `MOBILECENTER_ANDROID_MODULE` | Selected Android module |

## UWP variables

| Variable | Description |
| --------------------------------- | --- |
| `MOBILECENTER_UWP_SOLUTION` | Selected solution |
| `MOBILECENTER_UWP_CONFIGURATION` | Selected configuration |

## Xamarin variables

| Variable | Description |
| --------------------------------- | --- |
| `MOBILECENTER_XAMARIN_PROJECT` | Selected project|
| `MOBILECENTER_XAMARIN_CONFIGURATION` | Selected configuration|

## React Native variables

| Variable | Description |
| --------------------------------- | --- |
| `MOBILECENTER_REACTNATIVE_PACKAGE` | Selected package|


[build-scripts-detected]: ~/build/custom/scripts/images/build-scripts-detected.png "Build configuration shows detected build scripts"