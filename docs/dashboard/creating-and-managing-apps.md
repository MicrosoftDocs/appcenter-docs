---
title: Creating and managing apps
description: Using the dashboard to create and access app info in App Center.
keywords: dashboard apps
author: blparr
ms.author: blparr
ms.date: 04/30/2019
ms.topic: article
ms.assetid: 24dc2b8f-6b76-4881-9195-368233b8a820
ms.service: vs-appcenter
---

# Creating and managing apps

## Creating an app

To create an app:

1. Log in to [Visual Studio App Center](https://appcenter.ms)
2. Click the **Add new** dropdown in the upper-right corner of the page, then choose **Add new app**.
3. Populate the panel that appears with information about the new app.

## Release Type

Select one of the suggested release types: Alpha, Beta, Enterprise, Production or Store. You can also use a custom release type by selecting the 'Custom' field. This custom release type must be a single word, alphanumeric, starting with a capital letter or number, followed by lowercase or numbers.

## Uploading an app icon

Upload an app icon in the **Add new app** dialog, or in the settings page of your app. Note that uploading an icon in App Center does not change the icon in the app bundle, meaning the icon of the app when viewed on the install portal and installed on devices won't reflect this change.

## Accessing apps

All apps you belong to can be found in **My Apps**. When looking for apps owned by organizations you belong to, click on the organization in the left navigation.

## App secrets

App secret is like an api key for your app, it allows events and telemetry to be sent to App Center backend. It doesn't provide any access to your account. It can't be used to invoke App Center REST APIs (like trigger builds or send push notifications). If your code is open source, we recommend you inject the secret at build or in a similar way.

## App roles

On each app there are three roles:

* **Managers** can manage app settings, collaborators, and integrations
* **Developers** can manage app services (e.g. create builds, run tests)
* **Viewers** can view and download all data but cannot make changes

For every app you create, whether owned by you or your organization, you are automatically assigned as manager for the app. Additionally, all organization admins are assigned as managers for all apps within the organization. Collaborators can be assigned any of the three roles listed above for each app. Learn more about [managing collaborators and admins.](~/dashboard/creating-and-managing-organizations.md)

> [!NOTE]
> Every app that you create, whether it be owned by you or an organization, you automatically become a 'Manager'.

## Changing app roles

To change the permission of a collaborator or admin:

1. Select an app from the dashboard
2. In the left side navigation, select **Settings**
3. Select **Collaborators**
4. Next to the name of the user you wish to change roles of, reassign the role by making a selection from the drop-down

> [!NOTE]
> Only managers can change collaborator permissions.

## Adding collaborators to apps

To share your app with others, select an app from the dashboard and then click **Manage app** to add collaborators by typing in the user's email address.

> [!NOTE]
> If you are not a 'Manager' role on an app, you cannot add collaborators to that app.

## Transferring an app

When you transfer an app into an organization, all app data will be transferred over. The admins of the new organization will also gain access to the app that was transferred in.

To transfer an app from your personal account to an organization or from one organization to another:

1. Select an app from the dashboard
2. In the left side navigation, select **Settings**
3. In the top right corner, select the menu (three dots)
4. Select **Transfer app to organization**
5. Select the organization you wish to transfer the app into

> [!NOTE]
> * You can only transfer an app in and out of organizations you are an admin of.
> * After transferring an app into an organization, you cannot transfer it back to your personal account. 

## Next steps

* [Create an organization](~/dashboard/creating-and-managing-organizations.md)
* [Connect to your repository (GitHub, Bitbucket, VSTS, Azure DevOps)](~/build/index.md)
* [Add App Center's SDK to your app](~/sdk/index.md)
