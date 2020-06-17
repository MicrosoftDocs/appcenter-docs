---
author: ahdbilal
ms.topic: include
ms.date: 06/08/2020
ms.author: ahdbilal
---

The `app_secret` is an identifier of your app. The biggest risk of exposing your `app_secret` is sending bad/unrelated data to your app, as the `app_secret` is required to know which app the traffic applies to. 
It will have no effect on the security of the data. To retrieve any sensitive data, you would need to provide an app/user [token](../../api-docs/index.md), which is generated on the client’s side.
However, there is no way to make any data that must be placed on the client's side completely secure. One of the ways to increase the security of your application is by injecting the app secret into your code via an environment variable so that it is not visible in the code. 
