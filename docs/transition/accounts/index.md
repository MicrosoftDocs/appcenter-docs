---
title: HockeyApp Accounts in App Center
description: The third stage of the HockeyApp Transition switches the account and user management from HockeyApp to App Center
keywords: transition
author: derpixeldan
ms.author: daadam
ms.date: 09/11/2019
ms.topic: article
ms.assetid: 5a93cd1f-e3de-435e-9d0f-f996790f6387
ms.service: vs-appcenter
ms.custom: hockeyapp
---

# HockeyApp Accounts in App Center

The third stage of the HockeyApp Transition switches the account and user management from HockeyApp to App Center. HockeyApp accounts now have the same capabilities as App Center accounts. Both user and organization accounts can be managed in App Center. No manual steps are required, the migration happened automatically.

## Organization access level management

App Center has a more granular organization access level management than HockeyApp. Users that are added to an app owned by an organization are automatically added as a Member. Users of all apps on HockeyApp are now shown as Members under the organization collaborators in App Center.

### Owner mapping

The different owner flags of HockeyApp organizations are mapped to the new App Center [organization roles](~/dashboard/creating-and-managing-organizations.md#organization-roles) as follows:

* "All Apps" flag is `true` == Admin
* "Billing" flag is `true` == Admin
* "All Distribution Groups" flag is `true` == Collaborator
* "All Apps" flag is `false` && "All Distribution Groups" flag is `false` && "All Distribution Groups" flag is `false` == Member