---
title: No permission to publish to Google Play
description: Insight documentation about granting the correct permissions so that App Center can access the Google Play Account and perform the necessary actions to publish an app
keywords: google, google play store, store, insight
author: oddj0b
ms.author: vigimm
ms.date: 09/04/2019
ms.topic: reference
ms.assetid: 536d7c06-ceeb-40e4-91e3-5ed90b03bbd0
ms.service: vs-appcenter
ms.custom: insight, distribution store
---

# Publishing to the Google Play Store fails because of permissions

When publishing to the Google Play Store, you may come across an error like this:

> Your Google service account doesn't have permissions to publish the app to the Google Play Store.

This error happens when App Center doesn't have access to your Google service account. Follow the steps below to fix the issue.

## Fixing this issue

* Read [how to link your App Center app with your Google service account](https://docs.microsoft.com/en-us/appcenter/distribution/stores/googleplay#setting-up-api-access-clients "Setting up API access clients").
* Especially, make sure to [grant access to your service account](https://play.google.com/apps/publish/#ApiAccessPlace "Grant access to your service account").
