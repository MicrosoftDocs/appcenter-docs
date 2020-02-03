---
title: Understanding Azure AD B2C
description: Azure AD B2C and how it relates to the App Center Auth Service
keywords: MBaaS, Auth, Azure AD B2C, Identity, Azure Active Directory B2C
author: amchew
ms.author: amchew
ms.date: 07/08/2019
ms.topic: article
ms.assetid: 297d338f-cd75-4ecd-87fb-e5b57a2eb430
ms.service: vs-appcenter
ms.custom: MBaaS
---

# Understanding Azure AD B2C

App Center Auth is powered by [Azure Active Directory B2C](https://azure.microsoft.com/services/active-directory-b2c/) (Azure AD B2C). Azure AD B2C is a business-to-consumer identity management service that enables you to customize and control how customers sign up, sign in, and manage their profiles when using your applications. We chose Azure AD B2C because it is an enterprise-grade, highly-available and secure global service that scales to and handles billions of authentications per day. Using Azure AD B2C, you can easily customize and control how users securely interact with your mobile applications at scale. 

Learn more about [Azure AD B2C](https://docs.microsoft.com/azure/active-directory-b2c/). 

## How Azure AD B2C works with the App Center Auth Service

App Center Auth preview enables you to connect an existing Azure AD B2C tenant and leverage user identities with other App Center services such as [Data](~/data/index.md) and [Push](~/push/push-to-user.md#app-center-auth-set-identity). 

To configure App Center Auth, you will need an existing Azure AD B2C:
  - Tenant
  - Registered application under the tenant
  - Scope under the application
  - User journey (or policy) under the tenant

This section details the key concepts of Azure AD B2C.

## Protocols and tokens

Azure AD B2C implements a form of the [OpenID Connect and OAuth 2.0 protocols](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-reference-protocols). With the implementation of these protocols, we ensure that the security tokens and their claims enable the resource owner (end user) to provide access to resources.  

![App Center Token Exchange Service](./images/token-exchange-service.png)

Once the app user signs in to the application (step 1 of the above graphic), the application starts the sign-in user journey by issuing authentication requests to Azure AD B2C.

Once steps 2-4 are completed, the result of the authentication request is JSON Web Token (JWT) that contains information about the signed-in user. There are three types of tokens returned: [ID token, access token or refresh token](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-reference-tokens#token-types), with different formats, security characteristics, and contents in the token. From this token, Azure AD B2C then verifies the JWT and creates [claims](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-reference-tokens#claims) that can be used to validate an identity and allow access to secure resources.

Learn more about Azure AD B2C [authentication protocols](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-reference-protocols) and [tokens](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-reference-tokens).

## Tenant

In Azure AD B2C, a tenant represents a directory of users. Each tenant includes the directory of users, the registered applications, scope, and user journey. A tenant enables identity and access management of its resources. Each Azure AD B2C tenant is distinct from other Azure AD B2C tenants and [Azure Active Directory tenants](https://docs.microsoft.com/azure/active-directory/fundamentals/active-directory-whatis#terminology).

Learn more about [Azure AD B2C tenants](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-overview#tenants-and-applications).

## Application and scopes

To use Azure AD B2C with your application, you will need to register the application in the tenant on the Azure portal. The registration process collects and assigns values to your application. These values include an application ID that uniquely identifies the application and a redirect URI that is used to direct OAuth 2.0 responses back to the application.

For every application:

  - The application directs the user to run a policy.
  - The user completes the policy according to the policy definition.
  - The application receives a token.
  - The application uses the token to try to access a resource.
  - The resource server validates the token to verify that access can be granted.
  - The application periodically refreshes the token.

To use App Center Auth, you need to register both [native](https://docs.microsoft.com/azure/active-directory-b2c/add-native-application) and [web](https://docs.microsoft.com/azure/active-directory-b2c/tutorial-register-applications) applications.

Scopes (or permissions) are granted to the resource for the JWT. Examples of scopes are `read`, `write` and `delete`, and they are a way to manage permissions to protected resources. 

Learn more about Azure AD B2C [applications](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-overview#tenants-and-applications) and [scopes](https://docs.microsoft.com/azure/active-directory/develop/v2-permissions-and-consent#scopes-and-permissions).

## User journey

A user journey is a request that specifies a policy, which controls the behavior of how the user and the application interact with Azure AD B2C. 

There are two types of policies:
  - **User flow**: Suitable for most developers. Azure AD B2C provides a list of predefined user flows for the most common identity tasks, such as sign-up, sign-in, and profile editing.
  - **Custom policy**: Suitable for advanced users. If you are an identity professional, systems integrator, consultant, or on an in-house identity team, are comfortable with OpenID Connect flows, and understand identity providers and claims-based authentication, you might choose XML-based custom policies.

App Center Auth preview supports the **Sign up and sign in** [user flow](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-reference-policies#user-flow-versions) or [custom policy](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-overview-custom) that contains the sign-in identity task.

Learn more about [user flows](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-reference-policies) and [custom policies](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-overview-custom).

## Additional resources

For advanced identity developers, learn more about [Azure AD B2C solution and training](https://docs.microsoft.com/azure/active-directory-b2c/solution-articles) articles.
