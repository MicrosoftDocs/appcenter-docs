---
title: "Distribution Groups"
description: Managing Testers with Distribution Groups
author: gaknoll
ms.author: gaknoll
ms.date: 10/01/2018
ms.topic: article
ms.assetid: daff1cce-c26f-11e8-a355-529269fb1459
ms.service: vs-appcenter
---

# Distribution Groups

App Center first introduced the concept of [distribution groups](~/distribution/groups.md) as a way to organize your testers. This concept was later brought to HockeyApp as a way to prepare HockeyApp customers for the transition to App Center. A distribution group could be based on types of users such as beta testers or internal stakeholders, or based on different stages of the development cycle. Invite testers to your groups with just an email address. When distributing a new release in App Center, you’ll select one of your distribution groups as the destination. 

For HockeyApp apps, you’ll see a list of HockeyApp distribution groups ready for you to use in App Center.

> [!NOTE]
> The application download count is not synchronized from HockeyApp to App Center distribution groups.

## Collaborators Group

The first group in the list is the **Collaborators** group. This group is automatically created in App Center to include all the HockeyApp app users with ‘Developer’ and ‘Member’ roles. Any changes made in HockeyApp will be reflected in App Center for all distribution groups synchronized from HockeyApp. 

## HockeyApp App Group

The second group in the list is also automatically created in App Center, and is called **All users of YourAppsName**. This group includes all users added to your HockeyApp app. Including users with Developer, Member and Tester roles.

## Distribution Groups from HockeyApp

Additionally, any Distribution Groups created in HockeyApp will appear in the groups list below. HockeyApp distribution groups are indicated with the blue HockeyApp icon.

All distribution groups owned by the same organization as the app are synchronized on an organization level on App Center. You can view shared distribution groups on App Center by navigating to an organization and click on **People**, then **Distribution Groups**.

> [!NOTE]
> Distribution groups with a different owner than your app on HockeyApp aren't synchronized to shared distribution groups on App Center and only mapped to the app level distribution groups.

## Editing HockeyApp Distribution Groups

For HockeyApp distribution groups, you must continue to manage your testers and collaborators as well as edit group settings in HockeyApp. On the testers tab of a HockeyApp distribution group, you’ll notice a banner that takes you directly to the group in HockeyApp.

## Creating New Groups in App Center

In addition to using your HockeyApp distribution groups, you can create new distribution groups in App Center. New App Center distribution groups won't be synchronized with HockeyApp and will only appear in App Center. Unlike HockeyApp distribution groups, new groups created in App Center will be fully editable in App Center.

App Center supports two types of distribution groups:

1. For every app, distribution groups can be created inside the Distribute service. Those distribution groups are only available to that particular app.
2. For organizations, you can create shared distribution groups that can be added to multiple apps across an org.