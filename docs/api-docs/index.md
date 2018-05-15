---
title: App Center API Documentation
description: Explore the App Center API with Swagger
keywords: swagger
author: jwhiteDev
ms.author: jawh
ms.date: 05/02/2018
ms.topic: article
ms.assetid: ec67a6fc-6923-4a33-b655-f6d3308dca64
ms.service: vs-appcenter
ms.custom: api
---

# API Documentation

Explore the App Center API Service with [swagger](https://openapi.appcenter.ms).

## Getting Started

### <a name="section1"/>How to acquire an API token from App Center and make calls to the App Center API
1. Navigate to https://appcenter.ms and login with your account information.
2. On the bottom left corner, click your username and select **Account Settings**.

![The account details menu to select Settings](~/api-docs/images/mc_menu_dialog.PNG)

3. In the middle panel, select **API Tokens** from the menu list.
4. On the top right corner, click **New API token**.
5. In the text field, enter a descriptive name for your token.
6. Select the type of access for your API token:
  - Full Access
    - A full access API token has all the permissions that the associated user has for that app. For example, if the user does not have manager or developer permissions for an app, the user cannot run a test (which requires developer or manager permissions) even though the user is using a full access API token.
  - Read Only
    - A read only API token has viewer access permissions. For example, with a read only API token, the user can perform actions such as reading data from crashes, analytics, and getting basic app information. Users cannot perform actions such as changing the app settings, triggering a build, creating an export configuration etc.
7. At the bottom of the panel, click **Add new API token**.
8. This will generate a pop up with your API token. Copy and store it in a secure location for later use. For security reasons, you will not be able to see or generate the same token again after you click the **Close** button.
9. Click the **Close** button.
10. Navigate to App Center's [swagger](https://openapi.appcenter.ms) page to explore our APIs.
11. On the upper right corner, click on the **Authorize** button.
12. Under the **APIToken** section, paste the API token value that you just copied into the text field titled **Value** and click **Authorize**.

![Setting api token value to authorize our API's](~/api-docs/images/authorization_withtoken.PNG)

13. If it shows "Authorized" and a Logout-Button, authorization was successful. On the top right corner of the pop up, click the "X" to exit the pop up.
14. You are now able to use any App Center API and see the response. Enjoy!

### Running your first API call

This section shows you how to use App Center's [swagger page](https://openapi.appcenter.ms) by using the API call `GET /v0.1/user`. This API call returns the user's profile data.

1. Complete steps 1-14 in the [previous section](#section1).
2. Navigate to App Center's [swagger](https://openapi.appcenter.ms) page to explore our APIs.
3. Under **Account**, click on `GET /v0.1/user`.
4. On the left-hand corner, click the **Try it out** button.
5. Click the **Execute** button under the **Parameters** section.
6. Awesome! You can now see the response under the **Responses** section.

### How to find your app name and owner name
Some of App Center's API and CLI require an app name and owner name as parameters. An example is the API call to remove the user from the app, [`DELETE /v0.1/apps/{owner_name}/{app_name}/users/{user_email}`](https://openapi.appcenter.ms/#/account/apps_removeUser).

You can find the app name and owner name from your App Center app URL, or using the [App Center CLI](https://github.com/Microsoft/appcenter-cli).

Here are the steps to do so:

#### From App Center app URL
1. Navigate to [https://appcenter.ms](https://appcenter.ms).
2. Navigate to your app.
3. When you look at your app's URL, it is in the format `https://appcenter.ms/users/{owner-name}/apps/{app-name}`.

Owners can be user or org. For example,

| Owner| URL                                                   | Owner name     | App name   |
| -----|:-----------------------------------------------------:|:--------------:| ----------:|
| User | `https://appcenter.ms/users/amandachew/apps/DiceOut-01` | amandachew     | DiceOut-01 |
| Org  | `https://appcenter.ms/orgs/CrystalGeyser/apps/MacOS-app` | CrystalGeyser | MacOS-app  |

#### From App Center CLI

##### Prerequisites
App Center CLI requires Node.js version 8 or higher.

1. Open your terminal window in Mac or Linux, or command prompt in Windows.
2. Run `npm install -g appcenter-cli`.
3. Run `appcenter apps list`. You will see a list of apps with the format `{owner-name}`/`{app-name}`.

Please refer to [App Center CLI](https://github.com/Microsoft/appcenter-cli) for the full documentation and list of commands.
