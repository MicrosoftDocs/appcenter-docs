---
title: Azure Subscriptions in App Center
description: Information about App Center Azure Subscription integration.
keywords: pricing,billing,subscription
author: jwhitedev
ms.author: jawh
ms.date: 03/05/2019
ms.topic: article
ms.assetid: E1803020-0E6C-42EF-A4D3-FBCB15D7B220
ms.service: vs-appcenter
---

# Azure Subscriptions in App Center

While on the free tier, you don't need an Azure subscription. Once you decide to upgrade your plan, you'll be asked to connect an Azure subscription to your organization/personal account.

With an Azure subscription, you can manage all billing and control the different costs of your team's usage.

This article covers the following scenarios:

- Creating a new Azure Subscription and linking it to an organization/personal account.
- Connecting an existing Azure subscription to an organization/personal account.
- Removing an existing Azure Subscription.

## Create a new Azure Subscription

If you do not have an existing Azure subscription, the following steps will guide you through the process.

1. First navigate to **Azure** under your organization/personal account settings in App Center and select the **+** to add an Azure subscription.
2. Enter your email to sign in to Azure. Sign in with a Microsoft account. If you already have an account, skip to step 5.
3. Enter your email, then click **get a new Microsoft account**.
4. Enter your email (username), password, and follow the verification step.
5. After sign in, if you don't have any subscriptions, click on **Create New Subscription**.
6. Choose this newly created account from the list.
7. You'll be redirected to an Azure subscription creation page (Pay as you go) subscription.
8. Enter your billing information and the rest of required information.
9. Click **Done**.
10. After few minutes, you'll be redirected back to App Center billing page to continue with your checkout.

## Connecting to an existing Azure subscription

If you already set as an "Owner" of an Azure subscription, you can connect it to your organization/personal account in App Center.

> [!WARNING]
> Once you add an Azure subscription to an organization, any organization admin can use it to change billing settings within the same org. Organization admins can make these changes to your Azure subscription without having to have an "Owner" role assigned to them.

1. First navigate to **Azure** under your organization/personal account settings in App Center and select the **+** to add an Azure subscription.
2. Enter your email to sign in to Azure. Sign in with a Microsoft account.
3. After signing-in, select your subscription from the list of subscriptions.
4. You'll be redirected to the billing page and you can continue your checkout process.

## Remove an existing Azure Subscription

If you need to remove an Azure subscription from your organization/personal account, complete the following steps.

> [!NOTE]
> To remove an Azure subscription, there cannot be an active billing plan associated with the subscription. Make sure to set your billing back to the free plan and at the end of the month, the billing cycle, you will be able to remove the subscription once the new settings take place.

1. In App Center, select **Manage** under your Organization, or your **Account Settings** for your personal account, and select **Azure**.
2. Select the subscription you would like to remove.
3. If your subscription is assigned to any apps, remove all of them by clicking the garbage can icon next to the name of each app.
4. Select the **three dots** and select **Delete**. Then select **Remove** to confirm.

## FAQ

- Can I use my Free Azure subscription or credits from my Dev Essentials subscription?

    No, free Azure Subscriptions or credits from Dev Essentials subscriptions can't be used to pay for App Center

- Can I use an Azure Subscription with spending limits?

    No, before you can select your subscription you need to turn off spending limits permanently. Follow this document to [Understand Azure spending limit and how to remove it](https://docs.microsoft.com/azure/billing/billing-spending-limit).

- How often will I see charges from App Center on my Azure bill?

    Charges from App Center are posted daily on your Azure Subscription usage. App Center bills once for the entire calendar month at the start of your next billing cycle.

- Where can I see my App Center billing information?

    You can see your billing information as part of your Azure Subscription monthly bill. To get your invoice to your email as a .pdf document:

  1. Select your subscription from the Subscriptions page. Opt in for each subscription you own. Click Invoices then Email my invoice.
  2. Click Opt in and accept the terms.
  3. Once you've accepted the agreement, you can configure additional recipients.
  4. If you don't get an email after following the steps, make sure your email address is correct in the communication preferences on your profile.
