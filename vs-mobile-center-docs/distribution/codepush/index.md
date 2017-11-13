---
title: Use CodePush to update your app live
description: Fix bugs and add content quickly
keywords: distribution
author: iageoghe
ms.author: iageoghe
ms.date: 06/02/2017
ms.topic: article
ms.assetid: F19F4122-B9F0-42CC-85B8-E3C344AE5419
ms.service: vs-appcenter
ms.custom: distribute
---

# CodePush

CodePush is a App Center cloud service that enables Cordova and React Native developers to deploy mobile app updates directly to their users’ devices. It works by acting as a central repository that developers can publish certain updates to (e.g. JS, HTML, CSS and image changes), and that apps can query for updates from (using the provided client SDKs). This allows you to have a more deterministic and direct engagement model with your end-users, while addressing bugs and/or adding small features that don’t require you to re-build a binary and/or re-distribute it through any public app stores. All React Native apps created on App Center are CodePush enabled by default, to start using CodePush you simply need to follow the following steps.

## 1. Install the App Center CLI

You manage most of CodePush's functionality using the App Center CLI. To install it, open a command prompt or terminal, and type `npm install -g app-center-cli`

 > [!NOTE]
 > On macOS and Linux, you may need to prefix this command with `sudo`

## 2. CodePush-ify your app

Add the appropriate CodePush client SDKs to your app and configure them to query for updates against one of your app deployments. The following provide details on how to do this for each unique app type:

  - [Cordova][cordova]
  - [React Native (iOS)][react-native]

## 3. Release an app update

After making changes to your app’s code or assets, push the update to your staging environment by using the CLI command which corresponds to the app type you are building (React Native or Cordova) and specify the name of your CodePush app.

### React Native
Run the `release-react` command in the App Center CLI, which will handle bundling your JavaScript and asset files and releasing the update to the App Center server. 

For example: `app-center codepush release-react -a <ownerName>/MyApp`.

### Cordova
Run the `release-cordova` command in the App Center CLI, which will handle bundling your JavaScript and asset files and releasing the update to the App Center server. 

For example: `app-center codepush release-cordova -a <ownerName>/MyApp`.

> [!TIP]
> One important new functionality in the App Center CLI is the ability to set an app as the current app by using `app-center apps set-current <ownerName>/<appName>`. By setting an app as the current app you don't have to use the -a flag. For example, the command `app-center codepush deployment list -a <ownerName>/<appName>` can be typed as `app-center codepush deployment list` if current app is set. You can check which app is set as your account's current app by using `app-center apps get-current`. Utilizing this command make most of the CLI commands shorter.

## 4. Run your app

Once these steps are complete, all users running your app will receive the update using the experience you configured in step #2. For more details, refer to the [CLI][cli] and client SDK documentation
([Cordova][cordova], [React Native][react-native]).</p>

 [cordova]:./cordova.md#getting-started
 [react-native]:./react-native.md#getting-started
 [cli]:./cli.md#getting-started
