---
title: Troubleshooting
description: Troubleshooting App Center Test.
keywords: appcenter test cloud, troubleshooting
author: glennwilson
ms.author: v-glenw
ms.date: 02/11/2019
ms.topic: article
ms.assetid: 63f6b52d-ecd6-4270-b179-0ce580c8916c
ms.service: vs-appcenter
ms.custom: test
---

# Troubleshooting

The documents in this section discuss troubleshooting tips for App Center Test.

## Android screenshots

If your App Center Test Reports consistently show blank or scrambled screenshots on Android, the typical cause is that the app has disabled screenshots. The [Android screenshots guide](troubleshooting-android-screenshots.md) explains why that can happen and how to get the screenshots to appear.

## CLI exit codes

The App Center CLI tool returns an exit code which reflects whether App Center Test received the necessary information and if it encountered an error. The [CLI exit codes guide](troubleshooting-cli-exit-codes.md) lists App Center CLI exit codes with an explanation for each.

## iOS privacy alerts

While an iOS application is executing, the operating system may display alerts to the user at various times as the application attempts to activate or access Apple Push Notifications, Location Services, Contacts, the device Microphone or Camera, etc. to request permission. These are sometimes called alerts, System Alerts, System Popups, Springboard Alerts or Privacy Dialogs. When these requests are accepted, that acceptance state is persisted so the user will generally not see them again on that device.

Handling these alerts in App Center Test varies by the test framework and is described in The [iOS privacy alerts guide](troubleshooting-ios-privacy-alerts.md).