---
title: Web Service and Server connection troubleshooting
description: Making sure your server or web service is reachable by devices in App Center Test
keywords: appcenter, test, stall
author: king-of-spades
ms.author: kegr
ms.date: 07/24/2020
ms.topic: article
ms.assetid: 2acf5e51-954f-4b38-aa09-bdcf5756e288 
---

# Web Service and Server connection troubleshooting
There are several common reasons why your app may have trouble communicating with a server or web service:

- The endpoint the user is trying to connect to doesn't allow communication through the Test IP addresses. 
- Geofencing is blocking communication with our servers in Denmark.
- Additional time is needed for the communication to reliably complete.
- If a secondary app is required, or the connection process requires taking your app being tested out of focus. App Center Test allows single app automation, not multiple apps, or system processes.

## Allow List
If any of the following are blocked, you may need to explicitly allow them for your connection: 

- api.appcenter.ms 
- api.mobile.azure.com 
- *.appcenter.ms 
- testcloud.xamarin.com (to allow incoming/outgoing traffic on ports 80 and 443)
- These IP addresses:
   - 195.249.159.238
   - 195.249.159.239
   
## See also
[App Center Test Security - Personal Data in Tests](~/test-cloud/security.md#personal-data-in-tests)