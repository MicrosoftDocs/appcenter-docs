---
title: Manage Distribution Groups
description: Distribute mobile apps to groups of users
keywords: distribution
author: JoshuaWeber
ms.author: JoshuaWeber
ms.date: 01/20/17
ms.topic: article
ms.assetid: 65c820ac-e2ec-4ab1-9d2e-bbc2ddac2640
ms.service: mobile-center
---

# Manage Distribution Groups

Distribution Groups are used to control access to releases. A Distribution Group represents a set of users that can be managed jointly and can have common access to releases. Example of Distribution Groups can be teams of users, like the QA Team or External Beta Testers or can represent stages or rings of releases, such as Staging.

## Creating a Distribution Group

To create a new Distribution Group select the "New Group" group button from the top of the screen. Provide a name for the Distribution Group. You can then add users to this group by email. You can also add additional users after the group has been created.

## Managing Users in a Distribution Group

Clicking on a Distribution Group will allow for management of the group. You can use the invitation box to add additional users. Or select users from the table to remove them from the group. From this page you can also see the full release history for this Distribution Group by clicking on the releases tab.

> [!NOTE]
> You may only add existing [app users][app_users] to a Distribution Group. This is a temporary restriction that will be removed in the future.**

## Releasing a Build to a Distribution Group

To [release a new build][upload] to a Distribuiton Group. Make use of the "Distribute new Release" button at the top of the screen and choose the Distribution Group from the list during the steps.

[app_users]: ~/dashboard/index.md
[upload]: ~/distribution/uploading.md
