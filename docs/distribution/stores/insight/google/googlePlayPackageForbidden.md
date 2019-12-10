---
title: App not accessible from Google Play
description: Insight documentation about how to make your app accessible for App Center
keywords: google, google play store, store, insight
author: oddj0b
ms.author: vigimm
ms.date: 09/06/2019
ms.topic: reference
ms.assetid: c5799bd0-0792-4b7a-8088-aeedaf053964
ms.service: vs-appcenter
ms.custom: insight, distribution store
---

# Connecting to the Google Play Store fails because the app isn't accessible

When connecting to the Google Play Store, you may come across an error like this:

> This app exists but is not accessible from your Google Play account. Sign in to your Google Play Console and make sure your app is published.

This error appears when your account doesn't have access to an app in the Google Play Console. It usually means the app is published by a different account, which you didn't give the API access to.

## Fixing this issue

Provide the App Center API access to a Google account, which does have access to the app. Follow the [instructions on how to provide the correct .json file](https://docs.microsoft.com/appcenter/distribution/stores/googleplay).
