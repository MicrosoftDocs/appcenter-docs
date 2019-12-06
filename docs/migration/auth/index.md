---
title: "App Center Auth Migration Guide"
description: App Center Auth migration guide to Azure Active Directory B2C
author: amchew
ms.author: amchew
ms.date: 12/06/2019
ms.topic: article
ms.assetid: ca1357b3-1fb0-4751-a235-16833fca53c9
ms.service: vs-appcenter
---

# App Center Auth Migration Guide

On xxx, we annouced that we will be retiring [App Center's mobile backend services in preview](https://aka.ms/MBaaS-retirement-blog-post). What this means for App Center Auth customers is that:

- Auth Portal UI removed on xxx
- SDK deprecated on xxx
- Service retirement on xxx

Instead of App Center Auth, we recommend that you use [Azure Active Directory B2C](https://azure.microsoft.com/services/active-directory-b2c/) (Azure AD B2C) and [Microsoft Authentication Library (MSAL)](https://docs.microsoft.com/azure/active-directory/develop/msal-overview) directly.

App Center Auth is powered by Azure AD B2C. By using Azure AD B2C directly, you can use the full capabilities of Azure AD B2C and easily customize and control how users securely interact with your mobile applications at scale. The App Center Auth SDK wraps MSAL, which is a platform that gives your application the ability to access identities in Azure AD B2C. MSAL enables developers to acquire [tokens](https://docs.microsoft.com/azure/active-directory/develop/developer-glossary#security-token) from the Microsoft identity platform endpoint in order to access secured Web APIs. These Web APIs can be the Microsoft Graph, other Microsoft APIs, third-party Web APIs, or your own Web API. [MSAL is available for Android, iOS, .NET, JavaScript](https://docs.microsoft.com/azure/active-directory/develop/msal-overview#languages-and-frameworks), which support many different application architectures and platforms.

## Service Comparison

App Center Auth is powered by Azure AD B2C, but with the limitations. For example, you can select one scope (or permission) to use with your application, you must use the **Sign up and sign in** [user flow](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-reference-policies#user-flow-versions) or [custom policy](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-overview-custom) that contains the sign-in identity task, and you can't configure a native sign-in screen, create a password reset user experience or change the user language of the sign-in page. The App Center Auth portal experience also did not support searching and managing users, identity providers, applications or permissions. When you use Azure AD B2C directly, you'll be able to use any user flows and custom polcies including [configuring a native sign-in screen](https://docs.microsoft.com/azure/active-directory-b2c/configure-ropc?tabs=applications) and [creating a password reset experience](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-reference-sspr). Learn more about the [complete list of Azure AD B2C user flows](https://docs.microsoft.com/azure/active-directory-b2c/user-flow-versions#v1). Additionally, you'll be able to manage your users and experience the full capabilities of Azure AD B2C in the Azure portal.

### Added Benefits of using MSAL

MSAL gives you more flexibility in acquiring tokens from the Microsoft identity platform endpoint. Using MSAL provides the following benefits:

- No need to directly use the OAuth libraries or code against the protocol in your application.
- Acquires tokens on behalf of a user or on behalf of an application (when applicable to the platform).
- Maintains a token cache and refreshes tokens for you when they are close to expire. You don't need to handle token expiration on your own.
= Helps you specify which audience you want your application to sign in (your org, several orgs, work, and school and Microsoft personal accounts, social identities with Azure AD B2C, users in sovereign, and national clouds).
- Helps you set up your application from configuration files.
- Helps you troubleshoot your app by exposing actionable exceptions, logging, and telemetry.

## Migration Guide

When you configured App Center Auth, you will already have an existing Azure AD B2C tenant, so there is no work to do there. There is no direct migration path from App Center Auth SDK to the MSAL SDK, existing App Center Auth customers can migrate SDKs by the instructions for the following platforms:

- [MSAL for Android](https://github.com/AzureAD/microsoft-authentication-library-for-android)
- [MSAL for iOS](https://github.com/AzureAD/microsoft-authentication-library-for-objc)
- [MSAL for Xamarin](https://github.com/AzureAD/microsoft-authentication-library-for-dotnet)

Learn more about [MSAL](https://docs.microsoft.com/azure/active-directory/develop/msal-overview).