---
title: Troubleshooting
description: Troubleshooting App Center Test.
keywords: appcenter test cloud, troubleshooting
author: glennwilson
ms.author: v-glenw
ms.date: 02/27/2019
ms.topic: article
ms.assetid: 63f6b52d-ecd6-4270-b179-0ce580c8916c
ms.service: vs-appcenter
ms.custom: test
---

# Troubleshooting

The documents in this section discuss troubleshooting tips for App Center Test.

## Android screenshots

Do your App Center Test Reports consistently show blank or scrambled screenshots on Android? The typical cause is that the app has disabled screenshots. The [Android screenshots guide](troubleshooting-android-screenshots.md) explains why that can happen and how to get the screenshots to appear.

## CLI exit codes

The App Center CLI tool returns an exit code. That exit code reflects whether App Center Test received the necessary information and if there were errors. The [CLI exit codes guide](troubleshooting-cli-exit-codes.md) lists App Center CLI exit codes with an explanation for each.

## iOS privacy alerts

When an iOS application runs, the operating system displays an alert if the application requests access to restricted functionality. This alert tells the user about the request and requires the user to respond.

How you handle these alerts in your test script is described in The [iOS privacy alerts guide](troubleshooting-ios-privacy-alerts.md).

## Time limits

App Center Test generates an error if your tests exceed certain time limits. The [Time limits guide](troubleshooting-time-outs.md) explains these limits and what to do about them.
