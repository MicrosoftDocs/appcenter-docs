---
title: Why do I see This app is not accessible from your Google Play account?
description: Insight documentation about how to make your app accessible for App Center
keywords: google, google play store, store, insight
author: oddj0b
ms.author: vigimm
ms.date: 02/15/2019
ms.topic: reference
ms.assetid: c5799bd0-0792-4b7a-8088-aeedaf053964
ms.service: vs-appcenter
ms.custom: insight, distribution store
---

# Why do I see `This app is not accessible from your Google Play account.`?

The package you entered exists but is not accessible through your Google Play Console account.
Log into your Google Play Console account and [make sure your app is published](https://play.google.com/apps/publish/ "Published apps").

**How can I fix it?**

* If the package status is not published, you must first publish it manually via the Google Play Console to be able to use App Center to upgrade your app.
* If the App you are trying to publish is accessible through a different Google Play Console account, you must provide the API access to this account instead.
[Follow our instructions on how-to provide the correct .json file](https://docs.microsoft.com/en-us/appcenter/distribution/stores/googleplay "Provide the .json file").
