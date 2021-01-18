---
title: Shared docs for .Net SDKs
description: Shared docs for .Net SDKs
keywords: sdk
author: king-of-spades
ms.author: kegr
ms.date: 01/18/2021
ms.topic: include
ms.assetid: a05d996a-5980-11eb-ae93-0242ac130002
ms.tgt_pltfrm: wpf-winforms
dev_langs:  
 - csharp
---
If you need to start App Center services separately, you can use the following methods:

```csharp
AppCenter.Configure("{Your App Secret}");
if (AppCenter.Configured)
{
    //Call Start without an App Secret
    AppCenter.Start(typeof(Analytics)); 
}
```
