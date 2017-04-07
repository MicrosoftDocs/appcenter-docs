---
title: Mobile Center API Documentation
description: Explore the Mobile Center API with Swagger
keywords: swagger
author: psycosyd
ms.author: jawh
ms.date: 04/11/2017
ms.topic: article
ms.assetid: ec67a6fc-6923-4a33-b655-f6d3308dca64
ms.service: mobile-center
ms.custom: api
---

# API Documentation

Explore the Mobile Center API Service with [swagger](https://docs.mobile.azure.com/api/).

## Getting Started

### How to acquire an api-token from Mobile Center and make calls to the Mobile Center API?
1. Navigate to https://mobile.azure.com and login with your account information.
2. Select your account info on the bottom left and select **Settings**

	![The account details menu to select Settings](~/api-docs/images/mc_menu_dialog.PNG)

3. Select **API Tokens** from the menu list
4. Click on **New API token**  at the top and enter an appropriate description into the field
5. This will generate a pop up with your API token. Copy it and store it in a secure location for use later
6. Now navigate to https://docs.mobile.azure.com/api/ and click on the **Authorize** button on the top.
7. Under **Api key authorization** section, paste the API key token value that you just copied.

![Setting api token value to authorize our API's](~/api-docs/images/authorization_withtoken.PNG)

8. This API token will be used to make all calls to the Mobile Center APIs. You can try out any API and see the response.

## Known Limitations

You cannot obtain your API key using your GitHub or Microsoft account. You need to set a password in Mobile Center and authenticate with your Mobile Center username and password. Please follow these steps to set a password and avoid seeing the "Unauthorized" error code when you attempt to create the API token.
  1. Logout from Mobile Center.
  2. Navigate to the link to reset your password - https://mobile.azure.com/reset. You will get a mail that takes you to create a new password in Mobile Center.
  3. Once you have created your password, use it along with your Mobile Center username to perform the basic authentication outlined above.
  4. The `POST /v0.1/api_tokens` request should now return a valid API token.
