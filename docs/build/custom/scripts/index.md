---
title: Build Scripts
description: Details on how to write build scripts to enhance the build process
keywords: build, pre, post, custom, scripts
author: derpixeldan
ms.author: daadam
ms.date: 08/08/2018
ms.topic: article
ms.assetid: 3603ae8a-8adc-49df-9eee-f078008691af
ms.service: vs-appcenter
ms.custom: build
---

# Build scripts

You can add up to three custom build steps that run at pre-defined stages during build time. Place the scripts with the respective format next to the project-level (**.xcodeproj**, **build.gradle**, **.csproj**, **.sln** or **package.json**) file that you've selected in the build configuration and we will run them as custom build steps. For iOS and Android apps, we support Bash scripts, for UWP apps we support PowerShell scripts. If one of your scripts is failing, the whole build will fail. This way we ensure it won’t fail at a later time and therefore saves you build time.

You can find a collection of build script examples on the [dedicated public GitHub repository](https://github.com/Microsoft/appcenter-build-scripts-examples). We welcome contributions and suggestions - feel free to use the sample scripts, to modify them or to submit new pull requests with your most useful scripts, for the rest of the community to use them.

> [!NOTE]
> Once your build scripts have been detected for the first time or you moved them to a different location, make sure to save the branch configuration to apply the changes!

![Save detected scripts](~/build/custom/scripts/images/build-scripts-detected.png "Build configuration shows detected build scripts")

## Post-clone

The post-clone script runs immediately after the repository was cloned but before we do anything else on our end.

To run scripts post-clone, add the following file next to the project file in your repository:

- **appcenter-post-clone.sh** (Bash for iOS & Android)

    ```shell
    #!/usr/bin/env bash

    # Example: Clone a required repository
    git clone https://github.com/example/SomeProject

    # Example: Install App Center CLI
    npm install -g appcenter-cli
    ```

- **appcenter-post-clone.ps1** (PowerShell for UWP)

## Pre-build

The pre-build script runs before the actual build starts, but after we have installed dependencies from e.g. NuGet, CocoaPods or Carthage.

To run scripts pre-build, add the following file next to the project file in your repository:

- **appcenter-pre-build.sh** (Bash for iOS & Android)

    ```shell
    #!/usr/bin/env bash

    # Example: Change bundle name of an iOS app for non-production
    if [ "$APPCENTER_BRANCH" != "master" ];
    then
        plutil -replace CFBundleName -string "\$(PRODUCT_NAME) Beta" $APPCENTER_SOURCE_DIRECTORY/MyApp/Info.plist
    fi
    ```

- **appcenter-pre-build.ps1** (PowerShell for UWP)

## Post-build

The post-build script runs after the build has finished and we have copied all the necessary artifacts to the output directory.

To run scripts post-build, add the following file next to the project file in your repository:

- **appcenter-post-build.sh** (Bash for iOS & Android)

    ```shell
    #!/usr/bin/env bash

    HOCKEYAPP_API_TOKEN={API_Token}
    HOCKEYAPP_APP_ID={APP_ID}

    # Example: Upload master branch app binary to HockeyApp using the API
    if [ "$APPCENTER_BRANCH" == "master" ];
    then
        curl \
        -F "status=2" \
        -F "ipa=@$APPCENTER_OUTPUT_DIRECTORY/MyApps.ipa" \
        -H "X-HockeyAppToken: $HOCKEYAPP_API_TOKEN" \
        https://rink.hockeyapp.net/api/2/apps/$HOCKEYAPP_APP_ID/app_versions/upload
    else
        echo "Current branch is $APPCENTER_BRANCH"
    fi
    ```

- **appcenter-post-build.ps1** (PowerShell for UWP)

## App Center variables

We set the following environment variables, so you can access them from your build scripts.

| **General variables**             | **Description**                             |
| --------------------------------- | ------------------------------------------- |
| `APPCENTER_BUILD_ID`              | The unique identifier for the current build |
| `APPCENTER_BRANCH`                | Name of the branch that is being built from |
| `APPCENTER_SOURCE_DIRECTORY`      | Location of the source code on the build machine |
| `APPCENTER_OUTPUT_DIRECTORY`      | Location where the build results are stored in |
| `APPCENTER_TRIGGER`               | What triggered the build, was it `manual` or `continuous` by push |
| <br> **iOS specific**             | |
| `APPCENTER_XCODE_PROJECT`         | Selected Xcode project                      |
| `APPCENTER_XCODE_SCHEME`          | Selected Xcode scheme                       |
| <br> **Android specific**         | |
| `APPCENTER_ANDROID_VARIANT`       | Selected Android variant                    |
| `APPCENTER_ANDROID_MODULE`        | Selected Android module                     |
| <br> **UWP specific**             | |
| `APPCENTER_UWP_SOLUTION`          | Selected solution                           |
| `APPCENTER_UWP_CONFIGURATION`     | Selected configuration                      |
| <br> **Xamarin specific**         | |
| `APPCENTER_XAMARIN_PROJECT`       | Selected project                            |
| `APPCENTER_XAMARIN_CONFIGURATION` | Selected configuration                      |
| <br> **React Native specific**    | |
| `APPCENTER_REACTNATIVE_PACKAGE`   | Selected package                            |

[build-scripts-detected]: ~/build/custom/scripts/images/build-scripts-detected.png "Build configuration shows detected build scripts"
