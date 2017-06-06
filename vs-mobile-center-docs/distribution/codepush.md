---
title: Use CodePush to update your app live
description: Fix bugs and add content quickly
keywords: distribution
author: iageoghe
ms.author: iageoghe
ms.date: 06/02/2017
ms.topic: article
ms.assetid: F19F4122-B9F0-42CC-85B8-E3C344AE5419
ms.service: mobile-center
ms.custom: distribute
---

# CodePush

CodePush is a Mobile Center cloud service that enables Cordova and React Native developers to deploy mobile app updates directly to their users’ devices. It works by acting as a central repository that developers can publish certain updates to (e.g. JS, HTML, CSS and image changes), and that apps can query for updates from (using the provided client SDKs). This allows you to have a more deterministic and direct engagement model with your end-users, while addressing bugs and/or adding small features that don’t require you to re-build a binary and/or re-distribute it through any public app stores. All React Native apps created on Mobile Center are CodePush enabled by default, to start using CodePush you simply need to follow the following steps.

## 1. Install the CodePush CLI

You manage your CodePush account using the [NodeJS-based CLI][cli]. To install it, open a command prompt or terminal, and type `npm install -g code-push-cli`

**Note:** On macOS and Linux, you may need to prefix this command with `sudo`

## 2. CodePush-ify your app

Add the appropriate CodePush client SDKs to your app and configure them to query for updates against one of your app deployments. The following provide details on how to do this for each unique app type:

  - [Cordova][cordova]
  - [React Native (iOS)][react-native]

## 3. Release an app update

After making changes to your app’s code or assets, push the update to your staging environment by using the CLI command which corresponds to the app type you are building (React Native or Cordova), and specify the name of your CodePush app and the platform that your update is targetting (iOS or Android).

###React Native
Run the `release-react` command in the CodePush CLI, which will handle bundling your JavaScript and asset files and releasing the update to the CodePush server. 

For example: `code-push release-react MyApp ios`.

###Cordova
Run the `release-cordova` command in the CodePush CLI, which will handle bundling your JavaScript and asset files and releasing the update to the CodePush server. 

For example: `code-push release-cordova MyApp android`.

## 4. Run your app

Once these steps are complete, all users running your app will receive the update using the experience you configured in step #2. For more details, refer to the [CLI][cli] and client SDK documentation
([Cordova][cordova], [React Native][react-native]).</p>

 [cordova]:https://github.com/Microsoft/cordova-plugin-code-push#getting-started
 [react-native]:https://github.com/Microsoft/react-native-code-push#getting-started
 [cli]:https://github.com/Microsoft/code-push/tree/master/cli#getting-started
