---
title: Enable Sparkle updates
description: Easily stay up-to-date on the latest build with Sparkle update notifications.
keywords: distribution
author: derpixeldan
ms.author: daadam
ms.date: 10/09/2019
ms.topic: article
ms.service: vs-appcenter
ms.custom: distribute
ms.assetid: b5c07e60-985b-4941-a139-a203ea912d5a
---

# Sparkle Updates

Sparkle is a software update framework for [macOS](http://sparkle-project.org) and [Windows](https://winsparkle.org/) apps.

## Setup for distribution

Install the Sparkle SDK in your app and configure the App Center Sparkle feed. To access the Sparkle feed of an app in App Center, navigate to your app settings, click on the three dots menu, and copy the app secret. Set [SUFeedURL](https://sparkle-project.org/documentation/customization/) to `https://api.appcenter.ms/v0.1/public/sparkle/apps/{app_secret}` and replace `{app_secret}` with your app secret. Build your app and release it to a [public distribution group](~/distribution/groups.md#public-distribution-groups) in App Center.

Sparkle support for sandboxes in macOS is under development (09/2019). If you require sandboxes, check out the [following fork](https://github.com/tumult/Sparkle) and [this discussion](https://github.com/andymatuschak/Sparkle/pull/165).

## Specify the dsa_signature via API

Once the app is released, you can use the [following endpoint](https://openapi.appcenter.ms/#/distribute/releases_update) to update the dsa_signature of your release. Once updated, you can verify that the feed URL includes the dsa_signature.