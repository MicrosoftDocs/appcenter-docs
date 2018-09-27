---
title: "Distribution Groups"
description: Managing Testers with Distribution Groups
author: gaknoll
ms.author: gaknoll
ms.date: 09/27/2018
ms.topic: article
ms.assetid: daff1cce-c26f-11e8-a355-529269fb1459
ms.service: vs-appcenter
---

# Managing Testers with Distribution Groups

App Center first introduced the concept of [distribution groups](~/distribution/groups) as a way to organize your testers. This concept was later brought to HockeyApp as a way to prepare HockeyApp customers for the transition to App Center. A distribution group could be based on types of users such as beta testers or internal stakeholders, or based on different stages of the development cycle such as nightly build or staging. Invite testers to your groups with just an email address. When distributing a new release in App Center, you’ll select one of your distribution groups as the destination. 

For side-by-side apps, you’ll see a list of HockeyApp distribution groups ready for you to use in App Center. 

![Distribution Groups List](~/migration/hockeyapp/images/sxs-all-groups.png)

## Collaborators Group

The first group in the list is the “Collaborators” group. This group is automatically created in App Center to include all the HockeyApp app users with ‘Developer’ and ‘Member’ roles. Any changes made in HockeyApp will be reflected in App Center for all HockeyApp side-by-side groups. 

![Collaborators Distribution Group](~/migration/hockeyapp/images/sxs-collab-group.png)

## HockeyApp App Group

The second group in the list is also automatically created in App Center, and shares the same name as your app. This group includes **All** users for your HockeyApp app. This includes users with ‘Developer’, ‘Member’ and ‘Tester’ roles. 

![All HockeyApp Users Distribution Group](~/migration/hockeyapp/images/sxs-app-group.png)

## Distribution Groups from HockeyApp

Additionally, any Distribution Groups created in HockeyApp will appear in the groups list below. HockeyApp distribution groups are designated by the blue HockeyApp icon. 

![HockeyApp Distribution Groups](~/migration/hockeyapp/images/sxs-hockeyapp-groups.png)

## Editing HockeyApp Distribution Groups

For HockeyApp distribution groups you must continue to manage your testers and collaborators as well as edit group settings in HockeyApp. On the testers tab of a HockeyApp distribution group, you’ll notice a banner that takes you directly to the group in HockeyApp. Once we offer the final cutover migration experience for your HockeyApp apps in early 2019, you’ll be able to manage all settings in App Center. 

![Editing HockeyApp Distribution Groups](~/migration/hockeyapp/images/sxs-open-in-hockeyapp.png)

## Creating New Groups in App Center

In addition to using your HockeyApp distribution groups, you can create new distribution groups in App Center. It is important to note that new App Center distribution groups will not be synced with HockeyApp and will only appear in App Center. Unlike HockeyApp distribution groups, new groups created in App Center will be fully editable in App Center.
