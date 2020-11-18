---
title: Using the React Native SDK with CodePush
description: How to use to the React Native SDK with CodePush
keywords: distribution
author: king-of-spades
ms.author: kegr
ms.date: 11/10/2020
ms.topic: article
ms.assetid: FF626D21-2A99-457E-B632-AAC354782B54
ms.service: vs-appcenter
ms.custom: distribute
---

# React Native Client SDK
This plugin provides client-side integration for the CodePush service, allowing you to easily add a dynamic update experience to your React Native app(s).

## How does it work?
React Native apps are composed of JavaScript files and any associated [images](https://facebook.github.io/react-native/docs/images.html#content), which are bundled together by the [packager](https://github.com/facebook/metro) and distributed as part of a platform-specific binary (an `.ipa` or `.apk` file). When the app is released, updating either the JavaScript code (for example making bug fixes, adding new features) or image assets, requires you to recompile and redistribute the entire binary, which includes any review time associated with the stores to which you're publishing.

The CodePush plugin helps get product improvements in front of your end users instantly, by keeping your JavaScript and images synchronized with updates you release to the CodePush server. This way, your app gets the benefits of an offline mobile experience, as well as the "web-like" agility of side-loading updates as soon as they are available.

In order to ensure that your end users always have a functioning version of your app, the CodePush plugin maintains a copy of the previous update, so that in the event that you accidentally push an update that includes a crash, it can automatically roll back. This way, you can rest assured that your newfound release agility won't result in users becoming blocked before you have a chance to [roll back](./cli.md#rolling-back-updates) on the server.

> [!NOTE]
> Any product changes which touch native code (e.g. modifying your **AppDelegate.m**/**MainActivity.java** file, adding a new plugin) can't be distributed via CodePush, and therefore, must be updated via the appropriate store(s).*

## Supported React Native platforms

- iOS (7+)
- Android (5.0+)
- Windows (UWP)

We try our best to maintain backwards compatibility of our plugin with previous versions of React Native, but due to the nature of the platform, and the existence of breaking changes between releases, it's possible that you need to use a specific version of the CodePush plugin in order to support the exact version of React Native you're using. The following table outlines which CodePush plugin versions officially support the respective React Native versions:

| React Native version(s) | Supporting CodePush version(s)                       |
|-------------------------|------------------------------------------------------|
| <0.14                   | **Unsupported**                                      |
| v0.14                   | v1.3 *(introduced Android support)*                  |
| v0.15-v0.18             | v1.4-v1.6 *(introduced iOS asset support)*           |
| v0.19-v0.28             | v1.7-v1.17 *(introduced Android asset support)*      |
| v0.29-v0.30             | v1.13-v1.17 *(RN refactored native hosting code)*    |
| v0.31-v0.33             | v1.14.6-v1.17 *(RN refactored native hosting code)*  |
| v0.34-v0.35             | v1.15-v1.17 *(RN refactored native hosting code)*    |
| v0.36-v0.39             | v1.16-v1.17 *(RN refactored resume handler)*         |
| v0.40-v0.42             | v1.17 *(RN refactored iOS header files)*             |
| v0.43-v0.44             | v2.0+ *(RN refactored uimanager dependencies)*       |
| v0.45                   | v3.0+ *(RN refactored instance manager code)*        |
| v0.46                   | v4.0+ *(RN refactored js bundle loader code)*         |
| v0.46-v0.53             | v5.1+ *(RN removed unused registration of JS modules)*|
| v0.54-v0.55             | v5.3+ *(Android Gradle Plugin 3.x integration)*       |
| v0.56-v0.58             | v5.4+ *(RN upgraded versions for Android tools)*      |
| v0.59                   | v5.6+ *(RN refactored js bundle loader code)*         |
| v0.60-v0.61             | v6.0+ *(RN migrated to Autolinking)*                  |

We work hard to respond to new React Native releases, but they do occasionally break us. We'll update this chart with each React Native release, so that users can check to see what our official support is.

### Supported Components

When using the React Native assets system (like using the `require("./foo.png")` syntax), the following list represents the set of core components (and props) that support having their referenced images and videos updated via CodePush:

| Component                                       | Prop(s)                                  |
|-------------------------------------------------|------------------------------------------|
| `Image`                                         | `source`                                 |
| `MapView.Marker` <br />*(Requires [react-native-maps](https://github.com/lelandrichardson/react-native-maps) `>=O.3.2`)* | `image`                             |
| `ProgressViewIOS`                               | `progressImage`, `trackImage`            |
| `TabBarIOS.Item`                                | `icon`, `selectedIcon`                   |
| `ToolbarAndroid` <br />*(React Native 0.21.0+)* | `actions[].icon`, `logo`, `overflowIcon` |
| `Video`                                         | `source`                                 |

The following list represents the set of components (and props) that don't currently support their assets being updated via CodePush, due to their dependency on static images and videos (like using the `{ uri: "foo" }` syntax):

| Component   | Prop(s)                                                              |
|-------------|----------------------------------------------------------------------|
| `SliderIOS` | `maximumTrackImage`, `minimumTrackImage`, `thumbImage`, `trackImage` |
| `Video`     | `source`                                                             |

We'll update this list as new core components are released, which support referencing assets, to ensure users know what exactly they can expect to update using CodePush.

> [!NOTE]
> CodePush only works with Video components when using `require` in the source prop. For example:

```javascript
<Video source={require("./foo.mp4")} />
```

## Store Guideline Compliance
While Google Play and internally distributed apps (for example Enterprise, Fabric, HockeyApp) have no limitations over how to publish updates using CodePush, the iOS App Store and its corresponding guidelines have more precise rules you should be aware of before integrating the solution within your application.

[Apple's Developer Program License Agreement](https://developer.apple.com/programs/information/Apple_Developer_Program_Information_8_12_15.pdf), under paragraph **3.3.2**, fully allowed performing over-the-air updates of JavaScript and assets -  and in its latest version (20170605) [downloadable here](https://developer.apple.com/terms/) this ruling is even broader:

> Interpreted code may be downloaded to an Application but only so long as such code: (a) doesn't change the primary purpose of the Application by providing features or functionality that's inconsistent with the intended and advertised purpose of the Application as submitted to the App Store, (b) doesn't create a store or storefront for other code or applications, and (c) doesn't bypass signing, sandbox, or other security features of the OS.

CodePush allows you to follow these rules in full compliance so long as the update you push doesn't significantly deviate your product from its original App Store approved intent.

To further remain in compliance with Apple's guidelines we suggest that App Store-distributed apps don't enable the `updateDialog` option when calling `sync`, since in the [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/) it's written that:

> Apps must not force users to rate the app, review the app, download other apps, or other similar actions in order to access functionality, content, or use of the app.

This isn't necessarily the case for `updateDialog`, since it won't force the user to download the new version, but at least you should be aware of that ruling if you decide to show it.

## Example Apps / Starters

The React Native community has graciously created some awesome open-source apps that can serve as examples for developers that are getting started. The following is a list of OSS React Native apps that are also using CodePush, and can therefore be used to see how others are using the service:

- [F8 App](https://github.com/fbsamples/f8app) - The official conference app for [F8 2016](https://www.fbf8.com/).
- [Feline for Product Hunt](https://github.com/arjunkomath/Feline-for-Product-Hunt) - An Android client for Product Hunt.
- [GeoEncoding](https://github.com/LynxITDigital/GeoEncoding) - An app by Lynx IT Digital, which demonstrates how to use numerous React Native components and modules.
- [Math Facts](https://github.com/Khan/math-facts) - An app by Khan Academy to help memorize math facts more easily.

Additionally, if you're looking to get started with React Native + CodePush, and are looking for an awesome starter kit, you should check out the following:

- [Native Starter Pro](https://strapmobile.com/native-starter-pro/)
- [Pepperoni](http://getpepperoni.com/)

  > [!NOTE]
  > If you've developed a React Native app using CodePush, that's open-source, let us know. We'd love to add it to this list!*

## Continuous Integration / Delivery

In addition to being able to use the CodePush CLI to "manually" release updates, we believe that it's important to create a repeatable and sustainable solution for continuously delivering updates to your app. That way, it's simple enough for you and/or your team to create and maintain the rhythm of performing agile deployments. In order to assist with setting up a CodePush-based CD pipeline, refer to the following integrations with various CI servers:

- [Azure DevOps](https://marketplace.visualstudio.com/items?itemName=ms-vsclient.code-push) - Azure DevOps (formerly known as VSTS) also has extensions for publishing to [HockeyApp](https://marketplace.visualstudio.com/items?itemName=ms.hockeyapp) and the [Google Play](https://github.com/Microsoft/google-play-vsts-extension) store, so it provides a pretty great mobile CD solution in general.*
- [Travis CI](https://github.com/mondora/code-push-travis-cli)

Additionally, if you want more details of what a complete mobile CI/CD workflow  can look like, which includes CodePush, check out this [excellent article](https://zeemee.engineering/zeemee-engineering-and-the-quest-for-the-holy-mobile-dev-grail-1310be4953d1#.zfwaxtbco) by the [ZeeMee engineering team](https://zeemee.engineering).

## TypeScript Consumption

This module ships its `*.d.ts` file as part of its NPM package, which allows you to simply `import` it, and receive intellisense in supporting editors (like Visual Studio Code), as well as compile-time type checking if you're using TypeScript. For the most part, this behavior should just work out of the box, however, if you've specified `es6` as the value for either the `target` or `module` [compiler option](https://www.typescriptlang.org/docs/handbook/compiler-options.html) in your [`tsconfig.json`](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html) file, then just make sure that you also set the `moduleResolution` option to `node`. This ensures that the TypeScript compiler will look within the `node_modules` for the type definitions of imported modules. Otherwise, you'll get an error like the following when trying to import the `react-native-code-push` module: `error TS2307: Cannot find module 'react-native-code-push'`.
