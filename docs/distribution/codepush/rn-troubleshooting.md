---
title: Troubleshooting the React Native SDK with CodePush
description: "How to use to the React Native SDK with CodePush"
keywords: distribution
author: king-of-spades
ms.author: kegr
ms.date: 02/19/2020
ms.topic: article
ms.assetid: 3D5B9952-1962-450B-8F3C-4F2A02AE1F5F
ms.service: vs-appcenter
ms.custom: distribute
---

# React Native Client SDK Debugging and Troubleshooting

The `sync` method includes numerous diagnostic logging out-of-the-box, so if you're encountering an issue when using it, the best thing to try first is examining the output logs of your app. This will tell you whether the app is configured correctly (like can the plugin find your deployment key?), if the app can reach the server, if an available update is being discovered, if the update is being successfully downloaded/installed, etc. We want to continue improving the logging to be as intuitive/comprehensive as possible, so let us know if you find it to be confusing or missing anything.

Additionally, you can also use any of the platform-specific tools to view the CodePush logs. Start up your developer console and look for messages that are prefixed with `[CodePush]`.

By default, React Native logs are disabled on iOS in release builds, so if you want to view them in a release build, you need to make the following changes to your **AppDelegate.m** file:

1. Add an `#import <React/RCTLog.h>` statement. For RN < v0.40 use: `#import "RCTLog.h"`

2. Add the following statement to the top of your `application:didFinishLaunchingWithOptions` method to see CodePush logs in release mode:

    ```objective-c
    RCTSetLogThreshold(RCTLogLevelInfo);
    ```

If examining the logs don't provide an indication of the issue, refer to the following common issues for additional resolution ideas:

| Issue / Symptom | Possible Solution |
|-----------------|-------------------|
| Compilation Error | Double-check that your version of React Native is [compatible](rn-overview.md#supported-react-native-platforms) with the CodePush version you are using. |
| Network timeout / hang when calling `sync` or `checkForUpdate` in the iOS Simulator | Try resetting the simulator by selecting the `Simulator -> Reset Content and Settings..` menu item, and then rerunning your app. |
| Server responds with a `404` when calling `sync` or `checkForUpdate` | Double-check that the deployment key you added to your **Info.plist** (iOS), **build.gradle** (Android) or that you're passing to `sync`/`checkForUpdate`, is in fact correct. You can run `appcenter codepush deployment list <ownerName>/<appName> --displayKeys` to view the correct keys for your app deployments. |
| Update not being discovered | Double-check that the version of your running app (like `1.0.0`) matches the version you specified when releasing the update to CodePush. Additionally, make sure that you are releasing to the same deployment that your app is configured to sync with. |
| Update not being displayed after restart | If you're not calling `sync` on app start (like within `componentDidMount` of your root component), then you need to explicitly call `notifyApplicationReady` on app start, otherwise, the plugin will think your update failed and roll it back. |
| I've released an update for iOS but my Android app also shows an update and it breaks it | Be sure you have different deployment keys for each platform to receive updates correctly |
| Images disappear after installing CodePush update | If your app is using the React Native assets system to load images (that is the `require(./foo.png)` syntax), then you **MUST** release your assets along with your JS bundle to CodePush. |
| No JS bundle is being found when running your app against the iOS simulator | By default, React Native doesn't generate your JS bundle when running against the simulator. Therefore, if you're using `[CodePush bundleURL]`, and targeting the iOS simulator, you may be getting a `nil` result. This issue will be fixed in RN 0.22.0, but only for release builds. You can unblock this scenario right now by making [this change](https://github.com/facebook/react-native/commit/9ae3714f4bebdd2bcab4d7fdbf23acebdc5ed2ba) locally.