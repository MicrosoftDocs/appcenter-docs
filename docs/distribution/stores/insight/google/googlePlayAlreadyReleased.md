---
title: Why do I see The first release must be uploaded through Google Play Console?
description: Insight documentation about creating the first release through Google Play Console to use App Center for updating Android app through Google Play
keywords: google, google play store, store, insight
author: oddj0b
ms.author: vigimm
ms.date: 02/15/2019
ms.topic: reference
ms.assetid: 0698c6b2-d9e7-428b-ba36-30b9961420cd
ms.service: vs-appcenter
ms.custom: insight, distribution store
---

# Why do I see `The first release must be uploaded through Google Play Console.`?

The package you entered exists in your Google Play Console account but has never been published.
App Center requires the first version of the app to be published through Google Play Store console to avoid missing meta-data.
Log into your Google Play Console account and [make sure your app is published.](https://play.google.com/apps/publish/ "Published apps")

**How can I fix it?**

* You need to first publish your app manually via the Google Play Console.
* You can publish your app on any track (alpha, beta, or production). Once your app is published in at least one track, App Center will be able to release and upgrade your app for any track.
