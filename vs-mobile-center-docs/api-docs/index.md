---
title: Mobile Center API Documentation
description: Explore the Mobile Center API with Swagger
keywords: swagger
author: psycosyd
ms.author: jawh
ms.date: 02/14/2017
ms.topic: article
ms.assetid: ec67a6fc-6923-4a33-b655-f6d3308dca64
ms.service: mobile-center
ms.custom: api
---

# API Documentation

Explore the Mobile Center API Service with [swagger](https://docs.mobile.azure.com/api/).

## Getting Started

### How to get an api-token from swagger and make calls to Mobile Center API?
1. Navigate to https://docs.mobile.azure.com/api/ and click on **Authorize** button on the top.
2. Add your Mobile Center username and password in the **Basic authentication** section and click **Authorize**.

	![Setting Basic authentication fields to obtain an api-token](~/api-docs/images/authorization_noToken.PNG)

3. Once authorized, you will need an API token to call the APIs exposed in Mobile Center.
4. Click on **account** to expand all the account management API and look for an API  to get `api_token` with a POST request.

    `POST /v0.1/api_tokens`

5. Once the API details are expanded, click **Try it out** button in the end. It would make a POST request using your authentication information.
6. In the response body, copy the `api_token` value that is contained in the json.

	![API Example Response](~/api-docs/images/api_token_response.PNG)

7. Click on the **Authorize** button on the top. Under **Api key authorization** section, paste the API key token value that you just copied.
8. This API token will be used to make all subsequent calls to Mobile Center APIs. You can try out any API and see the response.

## Known Limitations

You cannot obtain your API key using your GitHub or Microsoft account. You need to set a password in Mobile Center and authenticate with your Mobile Center username and password. Please follow these steps to set a password and avoid seeing the "Unauthorized" error code when you attempt to create the API token.
  1. Logout from Mobile Center.
  2. Navigate to the link to reset your password - https://mobile.azure.com/reset. You will get a mail that takes you to create a new password in Mobile Center.
  3. Once you have created your password, use it along with your Mobile Center username to perform the basic authentication outlined above.
  4. The `POST /v0.1/api_tokens` request should now return a valid API token.
