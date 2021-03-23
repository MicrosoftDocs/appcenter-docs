---
title: App Center API Documentation
description: Explore the App Center API with Swagger
keywords: swagger
author: lucen-ms
ms.author: lucen
ms.date: 06/10/2020
ms.topic: article
ms.assetid: ec67a6fc-6923-4a33-b655-f6d3308dca64
ms.service: vs-appcenter
ms.custom: api
---

# App Center API Documentation

## App Center OpenAPI Specification (Swagger)
App Center exposes a full set of API endpoints. You can explore the App Center API through the [App Center OpenAPI Specification](https://openapi.appcenter.ms).

The App Center OpenAPI specification allows you to authenticate using your API token. Once you're authenticated, you can call App Center APIs to learn about the API and see what data it returns.

## <a name="section02"></a>Types of tokens: user tokens and app tokens
App Center exposes two kinds of API tokens: user tokens, and app tokens.

User API tokens have the same rights that you do as a user of App Center. User API tokens work across all organizations and apps that you're associated with.

App API tokens have either Manager or Viewer rights, but within only one app.

Each App Center account may create up to 5000 API tokens.

> [!TIP]
> We recommend creating and using App API tokens to limit the authorization scope to only one app at a time (and limit the risk if a token is exposed). If you need to automate something beyond one app, like working with organizations or shared distribution groups, you should create a User API token.

> [!WARNING]
> Don't embed API tokens into source code. API tokens should be treated as secrets, and stored securely.

> [!WARNING]
> **A request must contain a payload body** for POST/PUT/PATCH API calls. Use `{}` for an empty payload body, API calls will receive a **411 Length Required** error response otherwise.

## Creating an App Center App API token
1. Navigate to [https://appcenter.ms](https://appcenter.ms) and sign in using your account credentials.
2. **Select the app** that you want to create an API token for.
3. On the left side, choose **Settings**.
4. In the middle panel, select **App API Tokens** from the menu list.
5. On the top-right corner, click **New API token**.
6. In the text field, enter a descriptive name for your token.
7. Select the type of access for your App API token:

   **Full Access:** A full access App API token has the equivalent of Manager permissions for that app. Only Managers can create full access App API tokens.

   **Read-Only:** A read-only App API token has the equivalent of Viewer access permissions for that app. Managers and Developers can create read-only App API tokens.

8. At the bottom of the panel, click **Add new API token**.
9. A pop-up will open with your App API token. **Copy and store it in a secure location** for later use. For security reasons, you can't see or generate the same token again after you click the **Close** button.
10. Click the **Close** button.

## Creating an App Center User API token
1. Navigate to [https://appcenter.ms](https://appcenter.ms) and sign in using your account credentials.
2. On the top-right corner of the App Center portal, click your account avatar, then select **Account Settings**.
3. In the middle panel, select **User API Tokens** from the menu list.
4. On the top-right corner, click **New API token**.
5. In the text field, enter a descriptive name for your token.
6. Select the type of access for your User API token:

   **Full Access:** A full access User API token has all the permissions that you have for the current account / organization. For example, if you don't have manager or developer permissions for an app, the user can't run a test, even though you're using a full access User API token.

   **Read-Only:** A read-only User API token has Viewer access permission for the current account / organization. For example, with a read-only User API token, you can read data from crashes, analytics, and get basic app information. Read-only User API tokens can't change app settings, trigger a build, create an export configuration, etc.

7. At the bottom of the panel, click **Add new API token**.
8. A pop-up will open with your User API token. **Copy and store it in a secure location** for later use. For security reasons, you can't see or generate the same token again after you click the **Close** button.
9. Click the **Close** button.

## Using an API Token in an API request
When sending API requests to App Center from an application, you must include the API token in the header of every request sent to App Center.

Pass the API token in the request's `X-API-Token` header property.

## Find your App Center app name and owner name
Some of App Center's API functions and CLI requests require an app name or owner name as parameters.

For instance, the API call to remove the user from the app requires both: [`DELETE /v0.1/apps/{owner_name}/{app_name}/users/{user_email}`](https://openapi.appcenter.ms/#/account/apps_removeUser).

You can find the app name and owner name from an App Center URL, or using the [App Center CLI](https://github.com/Microsoft/appcenter-cli).

### Find owner_name and app_name from an App Center URL
1. Navigate to [https://appcenter.ms](https://appcenter.ms).
2. Navigate to your app.
3. When you look at your app's URL, it's in the format `https://appcenter.ms/users/{owner-name}/apps/{app-name}`.

Owner can be a user or an organization. For example:

| Owner| URL                                                       | Owner name     | App name   |
| ----- | --------------------------------------------------------- | -------------- | ---------- |
| User | `https://appcenter.ms/users/AlexLerxst/apps/Caravan-01` | AlexLerxst | Caravan-01 |
| Org | `https://appcenter.ms/orgs/BallardFlowers/apps/BouquetOrders-app` | BallardFlowers | BouquetOrders-app |

### Find owner_name and app_name from the App Center CLI
If you haven't yet installed the App Center CLI, installation and usage instructions can be found in the [App Center CLI documentation](https://github.com/Microsoft/appcenter-cli).

Once installed, retrieve the list of apps you have access by running:

```shell
appcenter apps list
```

App Center CLI will display a list of apps, with the format `{owner-name}`/`{app-name}`.

Refer to the [App Center CLI documentation](https://github.com/Microsoft/appcenter-cli) for a full list of command-line functions.


## <a name="section06"></a>Using an API Token with the App Center OpenAPI Specification
The [App Center OpenAPI Specification](https://openapi.appcenter.ms/) handles API authentication for you, so you don't have to paste the API token into headers for your requests. To test App Center APIs with your API token:

1. Navigate to App Center's [OpenAPI specification](https://openapi.appcenter.ms) to explore our APIs.
2. On the upper right corner, click on the **Authorize** button.
3. Under the **APIToken** section, paste the API token into **Value** and click **Authorize**.

    ![Setting API token to authorize App Center usage](~/api-docs/images/authorization_withtoken.PNG)

4. If it shows "Authorized" and a Logout button, authorization was successful. On the top-right corner of the pop-up, click the "X" to exit the pop-up.

## Making your first API call using OpenAPI (Swagger)

This section shows you how to use App Center's [OpenAPI page](https://openapi.appcenter.ms) by using the API call `GET /v0.1/user`. This API call returns the user's profile data.

1. Create an API token by following the instructions [above](#section02).
2. Authorize the OpenAPI Specification page to use your API token following the instructions in the [previous section](#section06).
4. Under **Account**, click on `GET /v0.1/user`.
5. On the left-hand corner, click the **Try it out** button.
6. Click the **Execute** button under the **Parameters** section.
7. Awesome! You can now see the response under the **Responses** section.

## Revoking an API Token
In the event that an API token is leaked, you should revoke it immediately to prevent unauthorized access to your App Center account.

### Revoking a User API token
1. Navigate to [https://appcenter.ms](https://appcenter.ms).
2. On the top-right corner of the App Center portal, click your account avatar, then select **Account Settings**.
3. In the middle panel, select **User API Tokens** from the menu.
4. Check the box next to the token that you want to revoke, and click the **Delete** button in the upper right-hand corner.

### Revoking an App API token
1. Navigate to [https://appcenter.ms](https://appcenter.ms).
2. **Select the app** that you want to revoke an API token for.
3. On the left side, choose **Settings**.
4. In the middle panel, select **App API Tokens** from the menu.
5. Check the box next to the token that you want to revoke, and click the **Delete** button in the upper right-hand corner.
