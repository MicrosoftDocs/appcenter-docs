---
title: Publishing to Google Play fails because the app isn't found
description: Insight documentation about creating an app package in Google Play Console so that App Center can connect and work with Google Play
keywords: google, google play store, store, insight
author: oddj0b
ms.author: vigimm
ms.date: 09/06/2019
ms.topic: reference
ms.assetid: 43efde4a-3249-46bc-83db-2d8d29b712e4
ms.service: vs-appcenter
ms.custom: insight, distribution store
---

# Connecting to the Google Play Store fails fails because the app package name couldn't be found

When connecting to the Google Play Store, you may come across an error like this:

> The app package name could not be found in your Google Play Console account. Sign in to your Google Play Console account and make sure your app is published.

This error appears when you try to connect to the Google Play Store before Google knows the package name of your app. Make sure you create the app in the Google Play Console first, and publish it to one of the built-in tracks at least once as well. Follow the steps below to fix the issue.

## Fixing this issue

Make sure you have the right app package name, and that the app is published in the Google Play Console.

### Verify the app package name

First verify you used the correct app package name. You can see this in the Google Play Console:

* Sign in to the [Google Play Console](https://play.google.com/apps/publish/).
* Make sure the app exists in the **All applications** list.
  * If the app is not there, create it and go through the publishing steps below.
* The app package name is written in the **App name** column under the app name itself.
  * If it is not there, go through the publishing steps below.

### Publish the app

If you have the correct app package name and it still doesn't work, that means the app isn't yet published in the Google Play Console. Publish it there first, to the **Production**, **Beta** or **Alpha** track. App Center doesn't support manually created tracks.

* Sign in to the [Google Play Console](https://play.google.com/apps/publish/).
* Make sure the app exists in the **All applications** list. Create the app if it doesn't exist.
* The **Status** likely says **Draft**. Your goal is to have the status say **Published**.
* Go to the settings for the app.
* Go through all the steps in the console to [publish the app](https://support.google.com/googleplay/android-developer/answer/6334282?hl=en&ref_topic=7072031).
