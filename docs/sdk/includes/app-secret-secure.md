---
author: king-of-spades
ms.author: kegr
ms.topic: include
ms.date: 06/08/2020
---

The `app_secret` is an identifier of your app, it's required to know which app the traffic applies to. If your `app_secret` is exposed, the biggest risk is sending bad data to your app, but it won't have an effect on the security of the data. 

To retrieve any sensitive data, you would need to provide an app/user [token](../../api-docs/index.md), which is generated on the client’s side. There's no way to make data on the client's side completely secure. 

You can improve your app's security by using an environment variable to inject the app secret into your code. That way, the secret isn't visible in your code. 