---
title: Mobile Center API Documentation
description: Explore the Mobile Center API with Swagger
keywords: swagger
author: conceptdev
ms.author: crdun
ms.date: 01/20/2017
ms.topic: article
ms.assetid: ec67a6fc-6923-4a33-b655-f6d3308dca64
ms.service: mobile-center
---

# API Documentation

Explore the Mobile Center API Service with [swagger](https://docs.mobile.azure.com/api/).

## Getting Started

### How to get an api-token from swagger and make calls to Mobile Center API?
1. Navigate to https://docs.mobile.azure.com/api/ and click on **Authorize** button on the top.
2. Add your Mobile Center username and password in the **Basic authentication** section and click **Authorize**.
3. Once authorized, you will need an API token to call the APIs exposed in Mobile Center.
4. Click on **account** to expand all the account management API and look for an API  to get `api_token` with a POST request.

    POST /v0.1/api_tokens

5. Once the API details are expanded, click **Try it out** button in the end. It would make a POST request using your authentication information.
6. In the response body, copy the `api_token` value that's contained in the json.
7. Now click on the **Authorize** button on the top. Under **Api key authorization** section, paste the API key token value that you just copied.
8. This API token will be used to make all subsequent calls to Mobile Center APIs. You can try out any API and see the response.
