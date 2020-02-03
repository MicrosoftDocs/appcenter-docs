---
title: Migrated app data
description: The data that is being moved when moving an app from HockeyApp to App Center
keywords: transition
author: derpixeldan
ms.author: daadam
ms.date: 12/11/2019
ms.topic: article
ms.assetid: 322c74b9-0666-4059-a1dd-f529530a66df
ms.service: vs-appcenter
ms.custom: hockeyapp
---

# Migrated app data

The following data is available once an app is moved from HockeyApp to App Center.

## Analytics (User Metrics)

App Center continues to receive user metrics data from the HockeySDK and the existing data will remain. The retention will be 90 days.

## Bug tracker

Azure DevOps, GitHub and Jira are the bug trackers currently supported on App Center. For GitHub and Jira, App Center doesn't support to sync the ticket status with the crash groups. After moving the app, you'll have to re-authenticate the service.

## Crashes

App Center continues to receive crashes from the HockeySDK. The data that already exists in App Center will remain. The data retention will be mapped to a maximum of 90 days.

Crashes uploaded via the HockeyApp custom crashes API are forwarded to App Center. Note that, if the `OS` is not provided in the crash logs, they won't be symbolicated in App Center.

## Distribution

For each app we create an "app name" distribution group on the app level containing all the users of the app on HockeyApp. A maximum of 90 and a minimum of 30 releases are moved to App Center with all their states and restrictions. To determine the number of releases to move, we calculate the average number of releases uploaded per day in the last 90 days and multiple it by 30. In-app updates with the HockeySDK integrated continue to work.

**Restrictions**

* a distribution group is mapped to a distribution group with the same name
* a tag is mapped to a distribution group with the same name
* a user is mapped to the same user

**Disabled versions**

A disabled version on HockeyApp becomes a disabled version on App Center.

**Mandatory versions**

A version that is set mandatory will be set mandatory for the "app name" distribution group we've created. If the release is restricted it's set mandatory for each target audience on App Center.

**Release notes**

The release notes remain the same.

## Webhooks
Existing webhooks will be moved. App Center currently supports webhooks for Slack and Microsoft Teams. For other platforms, you may write an [Azure function](https://docs.microsoft.com/azure/azure-functions/) that translates the way we `POST` to fit your needs.
