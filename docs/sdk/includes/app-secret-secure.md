---
author: v-ankubo
ms.topic: include
ms.date: 06/08/2020
ms.author: v-ankubo
---

The `app_secret` is an identifier of your app. The biggest risk of exposed your `app_secret`  is sending bad/unrelated data to your crashes and analytics, as the app secret is used only to know which app the traffic applies to. 
It will no effect on the security of data because for getting any data needed to provide a token, which generated on the client’s side.
However, there is no way to be 100% secure any data that must be placed on the client's side. As a way to increased security your application is using custom inject system your `app_secret` into your code via an environment variable so that at least the `app_secret` is not in clear in the code. 