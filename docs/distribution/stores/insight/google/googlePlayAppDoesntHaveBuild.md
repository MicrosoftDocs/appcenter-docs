---
title: Why do I see The first release must be uploaded through Google Play Console?
description: Insight documentation about creating an app package in Google Play Console so that App Center can connect and work with Google Play
keywords: google, google play store, store, insight
author: oddj0b
ms.author: vigimm
ms.date: 02/15/2019
ms.topic: reference
ms.assetid: d8eedbe1-bcf9-4748-bf63-1c985983ab48
ms.service: vs-appcenter
ms.custom: insight, distribution store
---

# Why do I see `The first release must be uploaded through Google Play Console.`?

The package you entered exists in your Google Play Console account but has never been published.
App Center requires the first version of the app to be publish through Google Play Store console in order to avoid missing meta-data that can only be filled through your Google Play Console.
Log into your Google Play Console account and [make sure that your app is present and published in the Google Play Console](https://play.google.com/apps/publish/ "Published apps")

**How can I fix it?**

* You need to first publish your app manually via the Google Play Console.
* You can publish your app on any track (alpha, beta, or production). Once your app is published in at least one track, App Center will be able to release and upgrade your app for any track.
