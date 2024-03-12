---
title: Configuring Azure Active Directory Conditional Access
description: Use Azure Active Directory Conditional Access with App Center
keywords: dashboard Azure organizations "conditional access"
author: lucen-ms
ms.author: lucen
ms.date: 10/23/2019
ms.topic: article
ms.assetid: 48cd6f51-bd42-4f80-8ca9-390c7abecad4
ms.service: vs-appcenter
ms.custom: general
---

# Configuring Azure Active Directory Conditional Access

[!INCLUDE [Retirement announcement for App Center](../includes/retirement.md)]

Visual Studio App Center supports [Azure Active Directory Conditional Access](/azure/active-directory/conditional-access/overview). Azure Active Directory Conditional Access is an advanced feature of Azure AD that allows you to specify detailed policies that control who can access your resources. Using Conditional Access, you can protect your applications by limiting users' access based on things like groups, device type, location, and role.

> [!IMPORTANT]
> Azure Active Directory Conditional Access is available in the Premium tier of Azure AD. For more information about Azure AD Premium, see [Azure Active Directory pricing](https://azure.microsoft.com/pricing/details/active-directory/).

## Connecting your organization to Azure Active Directory
If your App Center organization isn't already connected to an Azure Active Directory tenant, you must connect it first. See [Connecting to Azure Active Directory](./connecting-to-azure-active-directory.md) for how to do that.

## Setting up Conditional Access
> [!NOTE]
> This is an abbreviated guide to setting up Conditional Access. Full documentation is available in [What is Conditional Access?](/azure/active-directory/conditional-access/overview).

In the [Azure portal](https://portal.azure.com), open your Active Directory tenant, then open the **Security** settings, and click on **Conditional Access**.

In Conditional Access settings, click **New policy** to create a policy.

![Azure Active Directory Conditional Access](./images/conditional-access-2.png)

In New policy settings, click on **Cloud apps or actions** and select Visual Studio App Center as the target of the policy. Then [select the other conditions](/azure/active-directory/conditional-access/best-practices) that you want to apply, enable the policy, and click **Create** to save it.

![AAD Conditional Access: Cloud apps or actions](./images/conditional-access-1.png)

> [!TIP]
> You can troubleshoot your conditional access policies with the [What If tool](/azure/active-directory/conditional-access/troubleshoot-conditional-access-what-if) in the Azure Portal.
