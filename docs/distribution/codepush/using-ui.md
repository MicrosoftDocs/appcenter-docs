---
title: Using the CodePush UI
description: Describes the CodePush capabilities exposed through the App Center Portal
keywords: distribution
author: jwargo
ms.author: jowargo
ms.date: 06/01/2018
ms.topic: article
ms.assetid: 607EEEB8-81C5-4E4E-8ADE-9D88C5D86661
ms.service: vs-appcenter
---

# Using the CodePush UI

The CodePush service is designed to enable developers to manage their deployments and publish application updates using the [App Center CLI](~/distribution/codepush/cli.md). Developers publish content updates to a particular Deployment (typically staging) using the CLI, and users configured for that deployment get the updates. Developers can also promote updates from one deployment to another (from **Staging** to **Production** for example).

To view details for your apps CodePush Deployments:

1. Login to the [App Center Portal](https://appcenter.ms).
2. If you are not part of an **Organization**, select an application from the list. If you belong to one or more organizations, select the organization in the navigator, then select an application from the list.
3. In the navigator on the left side of the page, select **Distribution**, and then select **CodePush**.

App Center will list all of the **Releases** for the selected deployment, displaying the release version, status, publish date, and more for each release.

## Switching Deployments

From the page listing the available releases for a particular deployment, switch to a different deployment using the drop-down field located in the top-right corner of the page. Use the drop-down to select the CodePush deployment you're interested in.

## Viewing Release Details

To modify settings for a particular release, select (click on) the release in the list. App Center opens a panel displaying detailed information about the release, including deployment statistics.

At the top of the page are three options:

+ **Download Bundle** button: Click the button to download the packaged release assets. You'll do this in troubleshooting when you want to view what data is being deployed to devices. The bundle is essentially a zip file (without an extension); after you've downloaded the bundle, add a `.zip` extension to the file, then interact with the file like any other zip file.
+ **Promote** button: Click this button to promote this release from the current deployment to a different deployment. For example, you would use this feature to promote a release from the **Staging** to **Production** deployments for release to a larger target audience.
+ **Wrench Icon**: Click the icon to edit settings for the selected release.

The body of the pane displays deployment statistics for the release, enabling you to understand how this release is deployed:

+ Rollout Percentage
+ Number of Rollbacks
+ Active installations
+ Installations
+ Downloads

## Release Settings

App Center enables developers to modify several aspects of a CodePush release. To access release settings, click the wrench icon in the upper-right corner of the release details page. Click **Done** to save your changes, or the **X** in the upper-right corner to cancel your changes.

### Target Version

Specifies the binary version of the application you are releasing the update for; only users running that version will receive the update, while users running an older and/or newer version of the app binary will not. 

> [!NOTE]
> This setting corresponds to the [CLI's targetBinaryVersion parameter](https://github.com/Microsoft/code-push/tree/master/cli#target-binary-version-parameter).

This is useful for the following reasons:

1. If a user is running an older binary version, there may be breaking changes in the update that aren't compatible with the older version.
2. If a user is running a newer binary version, then it's presumed that what they are running is newer (and potentially incompatible) with the CodePush update.

If you ever want an update to target multiple versions of the app store binary, we also allow you to specify the parameter as a semver range expression. That way, any client device running a version of the binary that satisfies the range expression (i.e. semver.satisfies(version, range) returns true) will get the update. Examples of valid semver range expressions are as follows:


| Expression     | Who gets the update?                                                               |
| -------------- | ---------------------------------------------------------------------------------- |
| 1.2.3          | Only devices running the specific binary version 1.2.3 of your app       |
| *              | Any device configured to consume updates from your CodePush app                    |
| 1.2.x          | Devices running major version 1, minor version 2 and any patch version of your app |
| 1.2.3 - 1.2.7  | Devices running any binary version between 1.2.3 (inclusive) and 1.2.7 (inclusive) |
| >=1.2.3 <1.2.7 | Devices running any binary version between 1.2.3 (inclusive) and 1.2.7 (exclusive) |
| 1.2            | Equivalent to >=1.2.0 <1.3.0                                                       |
| ~1.2.3         | Equivalent to >=1.2.3 <1.3.0                                                       |
| ^1.2.3         | Equivalent to >=1.2.3 <2.0.0                                                       |

> [!NOTE]
> As defined in the semver spec, ranges only work for non pre-release versions (see [pre-release tags](https://github.com/npm/node-semver#prerelease-tags)). If you want to update a version with pre-release tags, then you must write the exact version you want to update (1.2.3-beta for example).

### Description

A brief description of this release. This provides an optional "change log" for the deployment. The value is simply round tripped to the client so that when the update is detected, your app can choose to display it to the end-user (e.g. via a "What's new?" dialog). This string accepts control characters such as \n and \t so that you can include whitespace formatting within your descriptions for improved readability.

> [!NOTE]
> This setting corresponds to the [CLI's description parameter](https://github.com/Microsoft/code-push/tree/master/cli#description-parameter).

### Enabled

Controls whether the update is available for deployment to users. This option is enabled by default, you would disable this setting when you want to keep a particular release from deploying (due to a bug in the code, or when you're not ready for a version to be deployed yet).

> [!NOTE]
> This setting corresponds to the [CLI's disabled parameter](https://github.com/Microsoft/code-push/tree/master/cli#disabled-parameter).

### Required Update

Specifies whether a particular release is required (for example, when it includes a critical security fix). When an application manually synchronizes with the CodePush server process (using `codepush.sync`), application can decide whether or not to apply an update, unless the required attribute is enabled.

> [!NOTE]
> This setting corresponds to the [CLI's mandatory parameter](https://github.com/Microsoft/code-push/tree/master/cli#mandatory-parameter).

The required attribute is unique because the server will dynamically modify it, as necessary, in order to ensure that the semantics of your releases are maintained for your end-users. For example, imagine that you released the following three updates to your app:


| Release | Mandatory? |
| ------- | ---------- |
| v1      | No         |
| v2      | Yes        |
| v3      | No         |

If a device is running v1 of the app, and queries the server for an update, the server responds with v3 (since that is the latest), but will dynamically convert the release to required, since a required update was released in between. This behavior is important since the code contained in v3 is incremental to that included in v2, and therefore, whatever made v2 mandatory, continues to make v3 mandatory for anyone that didn't already acquire v2.

If an end-user is currently running v2, and they query the server for an update, it will respond with v3, but leave the release as optional. This is because they already received the mandatory update, and therefore, there isn't a need to modify the policy of v3. This behavior is why we said that the server "dynamically converts" the mandatory flag, because as far as the release goes, its mandatory attribute will always be stored using the value you specified when releasing it. It is only changed on-the-fly as necessary when responding to an update check from an device.

If you never release an update marked as mandatory, then the described behavior doesn't apply to you, since the server will never change an optional release to mandatory . If a release is marked as mandatory, it will never be converted to optional. The server will only change an optional release to mandatory in order to respect the semantics described above.

### Rollout Percentage

Developers use the [CLI's rollout parameter](https://github.com/Microsoft/code-push/tree/master/cli#rollout-parameter) to instruct CodePush to push a particular release to a percentage of the devices running the app. This enables developers to test out a release before rolling it out to everyone.

You'll use this setting to increase the rollout percentage for a particular release. Since the release was already distributed to a percentage of the audience, you can only increase the rollout percentage value.
