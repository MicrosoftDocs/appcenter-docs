---
title: Creating and managing apps
description: Using the dashboard to create and access app info in App Center.
keywords: dashboard apps
author: joemellin
ms.author: joemel
ms.date: 12/06/2017
ms.topic: article
ms.assetid: 24dc2b8f-6b76-4881-9195-368233b8a820
ms.service: vs-appcenter
---

# Creating and managing apps


## Creating an app

To create an app, log in and click the **Add new** dropdown and choose **Add new app**.

## Accessing apps

All apps you belong to can be found in **My Apps**. When looking for apps owned by organizations you belong to, click on the organization in the left navigation.

## App secrets

App secret is like an api key for your app, it allows events and telemetry to be sent to App Center backend. It doesn't provide any access to your account. It can't be used to invoke App Center REST APIs (like trigger builds or send push notifications). If your code is open source, we recommend you inject the secret at build or in a similar way.

## App roles

On each app there are three roles:

* **Managers** can manage app settings, collaborators, and integrations.

* **Developers** can manage app services (e.g. create builds, run tests).

* **Viewers** can view and download all data but cannot make changes.

To change the permission of a collaborator, select an app, click **Manage app** and use the dropdown to re-assign the role. Only 'Managers' can change collaborator permissions.

> [!NOTE]
> Every app that you create, whether it be owned by you or an organization, you automatically become a 'Manager'.

## Adding collaborators to apps

To share your app with others, select an app and then click **Manage app** to add collaborators by typing in the user's email address.

> [!NOTE]
> If you are not a 'Manager' role on an app, you cannot add collaborators to that app.

## Transfering an app

We currently only enable the transfer of apps from users to organization accounts.

To do so, go to your app settings, select the menu at the top right (three dots) corner, select **Transfer app to organization**.
