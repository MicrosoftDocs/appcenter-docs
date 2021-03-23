---
title: Shared docs for .Net SDKs
description: Shared docs for .Net SDKs
keywords: sdk
author: lucen-ms
ms.author: lucen
ms.date: 01/18/2021
ms.topic: include
ms.assetid: a05d996a-5980-11eb-ae93-0242ac130002
ms.tgt_pltfrm: wpf-winforms
dev_langs:  
 - csharp
---
If you need to start App Center services separately, you should:

1. Configure or start it with the App Secret.
1. If the code can be called multiple times, check if the App Center is already configured.
1. Start the required service(s) without the App Secret.

```csharp
AppCenter.Configure("{Your App Secret}");
if (AppCenter.Configured)
{
    AppCenter.Start(typeof(Analytics)); 
    AppCenter.Start(typeof(Crashes)); 
}
```
