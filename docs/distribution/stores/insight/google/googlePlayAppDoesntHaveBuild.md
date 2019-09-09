---
title: Publishing to Google Play fails because the app is not published
description: Insight documentation about creating an app package in Google Play Console so that App Center can connect and work with Google Play
keywords: google, google play store, store, insight
author: oddj0b
ms.author: vigimm
ms.date: 09/06/2019
ms.topic: reference
ms.assetid: d8eedbe1-bcf9-4748-bf63-1c985983ab48
ms.service: vs-appcenter
ms.custom: insight, distribution store
---

# Connecting to the Google Play Store fails because the app isn't published

When connecting to the Google Play Store, you may come across an error like this:

> You must publish your app to the Production, Beta or Alpha track from the Google Play Console before you can connect the store.

This error appears when you try to connect to the Google Play Store before publishing the app. Because App Center doesn't support adding some of the metadata that is required for the first publication, you must publish your app to one of the built-in tracks at least once from the Google Play Console. Follow the steps below to fix the issue.

## Fixing this issue

Publish the app to the **Production**, **Beta** or **Alpha** track through the Google Play Console. App Center doesn't support manually created tracks.

* Sign in to the [Google Play Console](https://play.google.com/apps/publish/).
* Select your app in the **All applications** list. The **Status** there likely says **Draft**. Your goal is to have the status say **Published**.
* Go through all the steps in the console to [publish the app](https://support.google.com/googleplay/android-developer/answer/6334282?hl=en&ref_topic=7072031).
  * If you already published the app to a manually created track, publish it again to one of the built-in tracks.
