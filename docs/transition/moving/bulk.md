---
title: Move multiple apps at once via API
description: The data that is being moved when moving an app from HockeyApp to App Center
keywords: transition
author: derpixeldan
ms.author: daadam
ms.date: 09/05/2019
ms.topic: article
ms.assetid: d1c71ddc-c64c-4be5-8b8a-eb095d57be89
ms.service: vs-appcenter
ms.custom: hockeyapp
---

# Move multiple apps at once via API

Moving apps one by one can be a challenge when you have to do it for many apps. The following APIs enable you to move multiple apps at once for your user or organization account.

Note, that your apps might use features or functionality that is not available in App Center. Make sure you read about potential [compatibility issues](~/transition/moving/incompatibilities.md). Once you've moved an app, only a [subset of HockeyApp APIs](~/transition/api.md) will remain functional. Make sure you update those unavailable to the new App Center API. Also, understand what [data](~/transition/moving/data.md) will be moved for your apps.

## Move apps owned by a user account
Specify a list of app IDs or move all apps of your user account via `POST /api/2/apps/move`.

Parameters:

* **apps** - Array of app IDs. No app ID specified requests to move all apps of the account.

Example:
```curl \
    -X POST \
    -F "apps[]=69e641a599f64e4c8adbb221b05a5ab1" \
    -F "apps[]=096dea13e6244155b0a7733328dcff57" \
    -H "X-HockeyAppToken: 182a66de22s040l591s014645b9d7c87" \
    https://rink.hockeyapp.net/api/2/apps/move
```

Return:
```Status: 200
Body:
{
    "url":"https://rink.hockeyapp.net/confirm_moving_apps/5?confirmation_token=beadef8a-6c05-4837-8b4b-acc7b9539ed1"
}
```

Open the returned url in your browser and confirm to move the apps.

## Move apps owned by an organization account
Specify a list of app IDs or move all apps of an organization via `POST /api/2/organizations/<org-id>/apps/move`. You have to be owner of an organization in order move its apps.

Parameters:

* **apps** - Array of app IDs. No app ID specified requests to move all apps of the account.

Example:
```curl \
-X POST \
-F "apps[]=096dea13e6244155b0a7733328dcff57" \
-F "apps[]=69e641a599f64e4c8adbb221b05a5ab1" \
-H "X-HockeyAppToken: 182a66de22s040l591s014645b9d7c87" \
https://rink.hockeyapp.net/api/2/organizations/3407707/apps/move
```

Return:
```Status: 200
Body:
{
    "url":"https://rink.hockeyapp.net/confirm_moving_apps/6?confirmation_token=8bf7e14b-b813-473f-9b07-0aae28528e1e"
}
```

Open the returned url in your browser and confirm to move the apps.