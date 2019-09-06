---
title: Publishing AAB fails because app signing is not enabled
description: What to do when uploading an Android App Bundle fails because Google Play App Signing isn't enabled.
keywords: google, google play store, store, insight
author: oddj0b
ms.author: vigimm
ms.date: 09/04/2019
ms.topic: reference
ms.assetid: 97807d59-8e0d-4581-a15a-13de6407ebe9
ms.service: vs-appcenter
ms.custom: insight, distribution store
---

# Publishing an Android App Bundle fails because app signing isn't enabled

When publishing an Android App Bundle .aab file, you may come across an error like this:

> Google Play app signing is not enabled for this package. You must enroll into app signing by Google Play to upload an Android App Bundle.

This error appears when you try to publish an app for which you have not enabled app signing by Google Play. This is a requirement for releasing Android App Bundles. Follow the steps below to fix the issue.

## Fixing this issue

* Sign in to the [Google Play Console](https://play.google.com/apps/publish/).
* Open the settings for your app.
* Go to **Release management** > **App signing**.
* Follow the steps there to enable app signing by Google Play for your app.

See the official documentation by Google on [using app signing by Google Play](https://support.google.com/googleplay/android-developer/answer/7384423).
