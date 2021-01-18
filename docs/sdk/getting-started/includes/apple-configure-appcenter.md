---
title: Shared docs for Apple SDKs
description: Shared docs for Apple SDKs
keywords: sdk
author: king-of-spades
ms.author: kegr
ms.date: 01/18/2021
ms.topic: include
ms.assetid: 1cef8428-597e-11eb-ae93-0242ac130002
ms.tgt_pltfrm: apple
dev_langs:  
 - swift
 - objc
---
If you need to start App Center services separately, you can use the following methods:

```objc
[MSACAppCenter configureWithAppSecret:@"{Your App Secret}"];
if ([MSACAppCenter isConfigured]) {
   [MSACAppCenter startService:[MSACAnalytics class]];
}
```
```swift
AppCenter.configure(withAppSecret: "{Your App Secret}")
if AppCenter.isConfigured {
    AppCenter.startService(Analytics.self)
}
```
