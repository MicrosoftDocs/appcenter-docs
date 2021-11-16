---
author: lucen-ms
ms.author: lucen
ms.date: 11/16/2021
ms.topic: include
---

## Manage start session

By default, the session id depends on the lifecycle of the application. If you want to control the start of a new session manually you have to follow the next steps:

> [!NOTE]
> Pay attention that each call of **Analytics.StartSession()** API will generate a new session. If in manual session tracker mode this API will not be called then all sending logs will have a null session value.

> [!NOTE]
> Pay attention that after a new application launch the session id will be regenerated.
