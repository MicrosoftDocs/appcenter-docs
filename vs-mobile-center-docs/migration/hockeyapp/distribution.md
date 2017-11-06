---
title: "Migrating HockeyApp Distribution"
author: joemellin
ms.author: joemel
ms.date: 05/10/2017
ms.topic: article
ms.assetid: 78E2160E-DD37-4844-956B-11A85FD45855
ms.service: mobile-center
---

# HockeyApp Distribution in App Center

HockeyApp distribution is now supported in App Center. Both web portals are linked and a full side by side experience is possible. Feel free to take advantage of our new App Center UI and have it seemslessly integrate with your existing Hockeyapp apps.

## What's new about distribution in App Center

New in App Center is the concept of Distribution Groups. Distribution Groups provide a direct way of managing groups of testers. It is now possible to have a single app instance but still manage and control releases to multiple independent groups of testers. In addition, in App Center you can take advantage of the Build service which has native integration to quickly setup a full CI/CD pipeline from commit to build to distribution.

### Manging your testers

In HockeyApp, testers and your fellow developers are combined into a single user list. To make the management of testers easier we have introduced the concept of [distribution groups][dist-groups]. You can have unlimitted groups per app to control different audiences. Creation of groups is just adding a name and typing in email addresses of testers.

## Spring 2017: Preview your apps & data in App Center

With the side-by-side experience all your HockeyApp apps will be automatically available in App Center. In addition, all distribution groups in HockeyApp will be available as well in App Center. All releases that have been done through HockeyApp will also be visible in App Center as well.

With the side by side experience, upload of new releases can be done in either HockeyApp or App Center, either location will be kept in sync in both experiences. Legacy distribution groups will be automatically created in App Center. These legacy groups will by kept in sync with HockeyApp. Any release to a legacy distribution group will be added to HockeyApp and testers will be notified and install unchanged via the HockeyApp experience.

[dist-groups]: ~/distribution/groups.md
