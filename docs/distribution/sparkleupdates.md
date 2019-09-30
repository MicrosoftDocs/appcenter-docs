---
title: Enable Sparkle Updates
description: Easily stay up-to-date on the latest build with Sparkle update notifications.
keywords: distribution
author: derpixeldan
ms.author: daadam
ms.date: 09/30/2019
ms.topic: article
ms.service: vs-appcenter
ms.custom: distribute
ms.assetid: b5c07e60-985b-4941-a139-a203ea912d5a
---

# Sparkle Updates

## Setup for distribution
Install the Sparkle [SDK][sparkle-sdk-url].
Sparkle support for Mac sandboxes is under development (09/2019). If you require sandboxes, check out the following [fork][sparkle-fork] and this [discussion][github-discussion].

Navigate to your app settings, click on the three dots menu, and copy the app secret.
Set [SUFeedURL][sparkle-sufeedurl] to https://api.appcenter.ms/v0.1/public/sparkle/apps/{app_secret} and replace {app_secret} with your app secret.

Create an app bundle and release it via App Center.

## Specify the dsa_signature through API

Once the app is released, you can use the [following endpoint][open-api-patch] to update the dsa_signature of your release.
You can verify that the feed url now includes the dsa_signature.

[sparkle-sdk-url]: http://sparkle-project.org
[github-discussion]: https://github.com/andymatuschak/Sparkle/pull/165
[sparkle-fork]: https://github.com/tumult/Sparkle
[sparkle-sufeedurl]: https://sparkle-project.org/documentation/customization/
[open-api-patch]: https://openapi.appcenter.ms/#/distribute/releases_update