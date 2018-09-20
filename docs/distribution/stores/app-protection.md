---
title: Intune stores release with MAM aware apps
description: A guide on how to setup Intune app protection with App Center when publishing your line-of-business apps to the Intune Store. It's an easy way to protect your company data.
keywords: MAM, Intune, Distribution, Stores
author: oddj0b
ms.author: vigimm
ms.date: 09/20/2018
ms.topic: article 
ms.assetid: 3df16ba1-544f-48d9-84fa-db1763c20d66
ms.service: vs-appcenter
---

# Intune App Protection for the Intune store

**Preview feature**

The Intune app protection is mobile application management (MAM) protection for your line-of-business apps. In the same protection category as MAM, there is a service called mobile device management (MDM) which is more intrusive than MAM. With MAM you can only delete apps and its data from devices and not wipe all device data including private photos. You can read more about MAM in Intune's documentation.

App Center offers an automatic flow where all iOS releases to Intune will be made MAM aware, and you can manage it from the Intune blade in the Azure portal.

## Prerequisites
* You must be an admin in an organization in App Center.
* You should use the same signing certificate used to sign your iOS build.

## Steps to set it up
1. Navigate to your organization with the app overview in front of you.
2. In the left menu under your organization choose the **Manage** option.
3. In the new menu select **Compliance & Security**.
4. Click the blue **Configure** button.
5. On the configuration screen, you must select the same certificate used to sign production builds.
  * If the certificate selected here isn't the same as the one used for building your app, you'll have a certificate mismatch and applying Intune app protection will most likely fail.
6. After you have selected a certificate and clicked **Done** all iOS apps in your organization will be made MAM aware when released to an Intune store connection.
