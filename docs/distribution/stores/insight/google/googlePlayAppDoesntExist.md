---
title: Why do I see App package has no match in Google Play Console?
description: Insight documentation about creating an app package in Google Play Console so that App Center can connect and work with Google Play
keywords: google, google play store, store, insight
author: oddj0b
ms.author: vigimm
ms.date: 02/15/2019
ms.topic: reference
ms.assetid: 43efde4a-3249-46bc-83db-2d8d29b712e4
ms.service: vs-appcenter
ms.custom: insight, distribution store
---

# Why do I see `App package has no match in Google Play Console.`?

The package you entered could not be found in your Google Play Console account.
Log into your Google Play Console account and [make sure your app is published.](https://play.google.com/apps/publish/ "Published apps")

**How can I fix it?**

* You can publish your app on any track (alpha, beta, or production). Once your app is published in at least one track, App Center will be able to release and upgrade your app for any track.
* If you don’t know what is you package name, you can find it inside your manifest.json file.

    Example:\
    `package="com.example.myapplication"`

    [Read more in Googles documentation](https://play.google.com/apps/publish/ "Published apps") or by running the `aadt` command against your .apk file, example shown below:

    `$ ./aapt dump badging myapplication.apk`

    Result:\
    `package: name='com.example.myapplication'`
