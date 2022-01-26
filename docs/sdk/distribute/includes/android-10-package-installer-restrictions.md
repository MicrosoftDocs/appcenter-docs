---
author: lucen-ms
ms.author: lucen
ms.date: 10/26/2021
ms.topic: include
ms.tgt_pltfrm: android
---

> [!NOTE]
> Android 10 or higher has restrictions on launch activity from the background. Please see article about [restrictions on starting activities from the background](https://developer.android.com/guide/components/activities/background-starts).

> [!NOTE]
> Apps running on Android 10 (Go edition) cannot receive the **SYSTEM_ALERT_WINDOW** permission. Please see article about [SYSTEM_ALERT_WINDOW on Go devices](https://developer.android.com/about/versions/10/behavior-changes-all#sysalert-go).

> [!NOTE]
> Beginning with Android 11, `ACTION_MANAGE_OVERLAY_PERMISSION` intents always bring the user to the top-level Settings screen, where the user can grant or revoke the `SYSTEM_ALERT_WINDOW` permissions for apps. Please see article about [permissions updates in Android 11](https://developer.android.com/about/versions/11/privacy/permissions#manage_overlay).
