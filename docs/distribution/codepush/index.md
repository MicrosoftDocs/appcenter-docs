---
title: Use CodePush to update your app live
description: Fix bugs and add content quickly
keywords: distribution
author: iageoghe
ms.author: iageoghe
ms.date: 06/19/2018
ms.topic: article
ms.assetid: F19F4122-B9F0-42CC-85B8-E3C344AE5419
ms.service: vs-appcenter
ms.custom: distribute
---

# CodePush

CodePush is an App Center cloud service that enables Apache Cordova and React Native developers to deploy mobile app updates directly to their users’ devices. It works by acting as a central repository that developers can publish certain updates to (e.g. JS, HTML, CSS and image changes), and that apps can query for updates from (using the provided client SDKs). This allows you to have a more deterministic and direct engagement model with your end-users, while addressing bugs and/or adding small features that don’t require you to re-build a binary and/or re-distribute it through any public app stores. All React Native apps created on App Center are CodePush enabled by default, to start using CodePush you simply need to follow the following steps.

## 1. Install the App Center CLI

You manage most of CodePush's functionality using the App Center CLI. To install the CLI, open a terminal window or command prompt and exeute the following command:

```
npm install -g appcenter-cli
```

> [!NOTE]
> If you encounter an `EACCES` error executing this command, you may have to [fix npm permissions on your system](https://docs.npmjs.com/getting-started/fixing-npm-permissions). Many sites recommend using the `sudo` command to get around this error, but you should never install npm modules using `sudo`.

 After successfuly installing the App Center CLI, execute the `appcenter login` command to configure the CLI for your App Center account details.

## 2. CodePush-ify your app

Add the CodePush client SDK to your app, and configure it to pull app updates from one of your deployments in App Center. The following sections provide details on how to do this for the supported app platforms:

- [Apache Cordova][cordova]
- [React Native][react-native]

## 3. Release an app update

After making changes to your app’s code or assets, publish the update to App Center using the App Center CLI as described in the following sections.

### React Native

Execute the App Center CLI `release-react` command to bundle your app's code and asset files, then publish them to the App Center server as a new release. For example:

```
appcenter codepush release-react -a <ownerName>/MyApp
```

### Cordova

Execute the App Center CLI `release-cordova` command to bundle your app's code and asset files, then publish them to the App Center server as a new release. For example:

```
appcenter codepush release-cordova -a <ownerName>/MyApp
```

> [!TIP]
> One important feature in the App Center CLI is the ability to set an app as the current app using `appcenter apps set-current <ownerName>/<appName>`. By setting an app as the current app you don't have to use the `-a` flag. For example, the command `appcenter codepush deployment list -a <ownerName>/<appName>` can be typed as `appcenter codepush deployment list` if current app is set. You can check which app is set as your account's current app by using `appcenter apps get-current`. Utilizing this command make most of the CLI commands shorter.

## 4. Run your app

Once these steps are complete, all users running your app will receive the update using the experience you configured in step #2. For more details, refer to the [CLI][cli] and client SDK documentation ([Apache Cordova][cordova], [React Native][react-native]).

[cordova]:./cordova.md#getting-started
[react-native]:./react-native.md#getting-started
[cli]:./cli.md#getting-started
