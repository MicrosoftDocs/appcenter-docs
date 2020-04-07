---
title: App Center Billing
description: Information about Visual Studio App Center pricing plans
keywords: pricing,billing,subscription
author: maestersid
ms.author: jawh
ms.date: 02/11/2020
ms.topic: article
ms.assetid: 7cc39110-1d3e-4030-9935-ea5bb8766a1d
ms.service: vs-appcenter
---

# App Center Billing

You can configure a billing plan for your App Center organization or user account. If you configure a plan for an organization, all apps under the organization will bill against the configured plan. For billing configured under your user account, all apps will bill against the user account plan.

## User account billing configuration

1. Log into the [App Center Portal](https://appcenter.ms).
2. Click on the user account icon in the upper-right corner of the App Center Portal and select **Account Settings** from the menu.
3. In the panel that opens, select **Billing**.
4. In the Billing settings page, click the **Configure Plan** button. The panel that appears will walk you through purchasing your new plan. The sliders in the panel default to the free tier; adjust the sliders to add more Build or Test concurrency.
   - For **Test**: To choose concurrent device(s) without device hours limits, choose the number of devices, then select **Enterprise usage** from the drop-down menu in the **Test** section.
5. When you have completed customizing your billing plan, click the **Continue** button to save your changes.
   - To connect your user account to an Azure subscription, refer to the [Azure Subscriptions](~/general/azure-subscriptions.md) article.
   - If you already have one or more subscriptions associated with your user account, you can choose which one to use for billing.
6. Follow the remaining steps to complete the configuration process.

## Organization account billing configuration

1. Log into the [App Center Portal](https://appcenter.ms).
2. Select the Organization from the list of organizations in the App Center portal.  
3. For the selected Organization, select **Manage** in the list of options that appears.
4. In the panel that opens, select **Billing**.
5. In the Billing settings page, click the **Configure Plan** button. The panel that appears will walk you through purchasing your new plan. The sliders in the panel default to the free tier; adjust the sliders to add more Build or Test concurrency.
   - For **Test**: To choose concurrent device(s) without device hours limits, choose the number of devices, then select **Enterprise usage** from the drop-down menu in the **Test** section.
6. When you have completed customizing your billing plan, click the **Continue** button to save your changes.
   - To connect your user account to an Azure subscription, refer to the [Azure Subscriptions](~/general/azure-subscriptions.md) article.
   - If you already have one or more subscriptions associated with your user account, you can choose which one to use for billing.
7. Follow the remaining steps to complete the configuration process.

## FAQ

- What happens if I delete my organization during the month?

  You will lose the data from your org and will still pay for the full month.

- What happens if a paid user's subscription has an issue (credit card expiry)?

  Azure will notify you via an email notification first. In App Center, you will be downgraded to the free tier temporarily until the subscription issue is fixed. Once it's fixed, we will convert you back to your previously selected paid plan.

- Can I downgrade during the month?

  You can, but it will not take effect until the next calendar month.

- Can I use my Free Azure subscription or credits from my Dev Essentials subscription?

  No, free Azure Subscriptions or credits from Dev Essentials subscriptions cannot be used to pay for App Center.

- Can I use an Azure Subscription with spending limits?

  No, before you can select your subscription you need to turn off spending limits.

- Where can I find my monthly invoice?

  App Center bills monthly to the associated Azure Subscription. You can access subscription information, including invoices, by logging into the [Azure portal](https://portal.azure.com). From there, search for _Cost Management + Billing_. If you have permissions to view the invoice, select *Invoices* under the *Billing* in the left menu. For more information, please review the documentation on [how to view your Azure invoice](https://docs.microsoft.com/azure/cost-management-billing/understand/download-azure-invoice) in the Azure documentation.
