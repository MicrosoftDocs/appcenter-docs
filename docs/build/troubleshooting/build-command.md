---
title: How to find your build command in App Center
description: Comparing and debugging build commands
author: lucen-ms
ms.author: lucen
ms.date: 10/09/2020
ms.topic: article 
ms.assetid: 5c7318ce-a99b-4356-b8ac-7c3ff1407484
ms.service: vs-appcenter 
ms.custom: build
---

# How to find your build command in App Center

[!INCLUDE [Retirement announcement for App Center](~/includes/retirement.md)]

Sometimes it's useful to compare the exact build command executed across different builds. 

To compare commands, it helps to know where to look in App Center's logs. What the commands look like and how to find them depends your app's framework. 

## Native 
#### Android (Java/Gradle)
Here is an example output from a Native Android Build:

```
=====================================================================
Task         : Gradle
Description  : Build using a Gradle wrapper script
Version      : 1.128.0
Author       : Microsoft Corporation
Help         : More Information
=====================================================================
SYSTEMVSSCONNECTION exists true
[command]/Users/vsts/agent/2.150.0/work/1/s/gradlew -DMOBILECENTER_KEYSTORE_PASSWORD=*** -DMOBILECENTER_KEY_ALIAS=*** -DMOBILECENTER_KEY_PASSWORD=*** -DMOBILECENTER_BUILD_VERSION=12 -DAPPCENTER_KEYSTORE_PASSWORD=*** -DAPPCENTER_KEY_ALIAS=*** -DAPPCENTER_KEY_PASSWORD=*** -DAPPCENTER_BUILD_VERSION=12 clean :app:assembleRelease :app:testRelease :app:lintRelease
```

#### iOS (Objective-C/Swift) 
Here is an example output from a Native iOS build:

```
=====================================================================
Task         : Xcode
Description  : Build, test, or archive an Xcode workspace on macOS. Optionally package an app.
Version      : 4.130.0
Author       : Microsoft Corporation
Help         : More Information
=====================================================================
[command]/usr/bin/xcodebuild -version
Xcode 10.2
Build version 10E125
[command]/usr/bin/xcodebuild -sdk iphoneos -workspace /Users/vsts/agent/2.149.2/work/1/s/SampleiOS.xcworkspace -scheme SampleiOS clean DSTROOT=/Users/vsts/agent/2.149.2/work/1/output/build/build.dst OBJROOT=/Users/vsts/agent/2.149.2/work/1/output/build/build.obj SYMROOT=/Users/vsts/agent/2.149.2/work/1/output/build/build.sym SHARED_PRECOMPS_DIR=/Users/vsts/agent/2.149.2/work/1/output/build/build.pch CODE_SIGN_STYLE=Manual
```

## React Native 
> [!NOTE]
> For reproducing locally, make sure that you also install the package dependencies from the package.json file: 
> - Using npm - `npm install`
> - Using yarn - `yarn install`

#### Android
Since React Native links to the Android SDK to compile, the output will look similar to a Native Android Application:

```
=====================================================================
Task         : Gradle
Description  : Build using a Gradle wrapper script
Version      : 1.128.0
Author       : Microsoft Corporation
Help         : More Information
=====================================================================
SYSTEMVSSCONNECTION exists true
[command]/Users/vsts/agent/2.149.2/work/1/s/android/gradlew -DMOBILECENTER_BUILD_VERSION=5 -DAPPCENTER_BUILD_VERSION=5 -p android clean :app:assembleRelease :app:lintRelease
```

#### iOS
Since React Native links to Xcode to compile, the output from it will look similar to that of a Native iOS Application:

```
=====================================================================
Task         : Xcode
Description  : Build, test, or archive an Xcode workspace on macOS. Optionally package an app.
Version      : 4.130.0
Author       : Microsoft Corporation
Help         : More Information
=====================================================================
[command]/usr/bin/xcodebuild -version
Xcode 10.2
Build version 10E125
##[warning]Output directory for build output (binaries) ignored. Specifying an output directory is incompatible with the 'archive' action.
[command]/usr/bin/xcodebuild -sdk iphoneos -project /Users/vsts/agent/2.149.2/work/1/s/ios/SampleReactNative.xcodeproj -scheme SampleReactNative clean archive -archivePath /Users/vsts/agent/2.149.2/work/1/output/build/archive/SampleReactNative.xcarchive -UseModernBuildSystem=NO CODE_SIGNING_ALLOWED=NO
```

## Xamarin
#### Android
Here's some example output from a Xamarin.Android build. The key lines to examine are after the `[command]` brackets, though the heading is useful to help you find the correct location. 

```
=====================================================================
Task         : Xamarin.Android
Description  : Build an Android app with Xamarin
Version      : 1.151.0
Author       : Microsoft Corporation
Help         : More Information
=====================================================================
[command]/Library/Frameworks/Mono.framework/Versions/5_18_2/bin/msbuild /version /nologo
[command]/Library/Frameworks/Mono.framework/Versions/5_18_2/bin/msbuild /Users/vsts/agent/2.150.3/work/1/s/Xamarin.UITest/FormsGallery/FormsGallery/FormsGallery.Android/FormsGallery.Android.csproj /t:PackageForAndroid /p:Configuration=Debug
```

#### iOS
Xamarin.iOS is almost identical in format, except the references to `Android` are for `iOS` instead:
```
=====================================================================
Task         : Xamarin.iOS
Description  : Build an iOS app with Xamarin on macOS
Version      : 1.131.0
Author       : Microsoft Corporation
Help         : More Information
=====================================================================
[command]/Library/Frameworks/Mono.framework/Versions/5_18_2/bin/msbuild /version /nologo
[command]/Library/Frameworks/Mono.framework/Versions/5_18_2/bin/msbuild /Users/vsts/agent/2.150.3/work/1/s/Xamarin.UITest/FormsGallery/FormsGallery.sln /p:Configuration=Debug /p:Platform=iPhoneSimulator /t:Rebuild
```