---
title: Creating and managing teams
description: Using the dashboard to create and access teams in App Center.
keywords: dashboard teams
author: winnieli1208
ms.author: yuli1
ms.date: 01/22/2018
ms.topic: article
ms.assetid: 041D1B07-64DA-4B90-A2A9-430023632AD6
ms.service: vs-appcenter
---

# Creating and managing teams

Any [collaborator](~/dashboard/creating-and-managing-apps.md) within an organization can create teams. Teams allow for better management of collaborators and app permissions.

## Creating teams

Any collaborator can create teams within an organization. Organizations can have multiple teams but each team belongs to only one organization. 

1. Select your organization on the left navigation and click **People**.
2. Select **Teams** and click on the **Add New Team** button.

## Adding users to a team

The team creator or any organization admin can invite other collaborators to a team. A user must be invited (and have accepted the invitation) to the organization before they can join a team. 
 
## Removing users from a team

The team creator or any organization admin can remove users from a team.

## Adding the team to an app

The team creator, any [app manager](~/dashboard/creating-and-managing-apps.md), or any organization admin can add a team to an app. When a team is added to an app, all users of the team gain access to the app with the team's assigned role. 

There are two ways to add a team to an app: 

### In team setting 
1. Select the team organization in the left navigation and click on **People**.
2. Click on **Teams** and select the team you wish to add to an app.
3. Select **APPS** in the top navigation and type the app name you wish to add.

### In app setting  
1. In the dashboard, select the app you wish to add a team to.
2. Click on **Settings** in the left navigation.
2. Click on **Collaborators** and type the team you wish to add to the app.

## Removing the team from an app:
The team creator or any organization admin can remove a team from an app and the team member's permission to the app will be revoked. 
There are two ways to remove a team from an app:

### In team setting
1. Select the team organization in the left navigation and click on **People**.
2. Click on **Teams** and select the team you wish to add to an app.
3. Select **APPS** in the top navigation.
4. Hover your cursor to the app you want to remove and click on the delete icon on the right.

### In app setting
1. Select the app you wish to remove from a team in the dashboard.
2. Click on **Settings** in the left navigation and open **Collaborators**.
3. Hover your cursor to the app you want to remove and click on the delete icon on the right.

## Changing Permissions

The team creator or any org admin can change the app permission of the team. Only admins can [change permissions of an individual user.](~/dashboard/creating-and-managing-apps.md) 
  
### Permission levels 
- **Manager** - invite members and access settings 
- **Developer** - manage services (e.g. create builds, run tests) 
- **Viewer** - view and download app data 

> [!NOTE]
> Users get the highest permission assigned (team level or app level). 

## Leaving a team 
Users can leave a team upon confirmation and will lose access to any apps associate with the team. The team creator cannot leave the team. The only option is to delete the team. 

## Deleting a team
The team creator or any admin can delete a team. All users in the team will have app permissions revoked. 

