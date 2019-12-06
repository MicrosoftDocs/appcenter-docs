---
title: Managing your Apple ID and certificates
description: Read how to securely store your Apple ID and iOS signing certificate in App Center.
keywords: Secret storage, Apple ID, certicates
author: oddj0b
ms.author: vigimm
ms.date: 12/11/2019
ms.topic: article
ms.assetid: 505ce61e-7647-41cf-8500-459f110944f4
ms.service: vs-appcenter
ms.custom: dashboard
---

# Managing your Apple ID and certificates

## How does Secret storage work

Your Apple ID and certificate are stored securely in an encrypted vault designed so that only App Center internal services can read the values. As with any other credentials, you cannot download them after adding to the Secret storage. However, you as the owner can assign them to services in App Center.

## How do I add Apple ID and certificate to storage?

You can add your Apple ID and signing certificate as part of the distribution workflow or from **Account settings** -> **Developer accounts** by clicking the blue + button. Secrets are store in a secure vault, to protect the confidentiality of your credentials.

App Center uses your Apple ID to manage your provisioning profile and your signing certificate to re-sign for a release which includes all testers.

## How can app members use my Apple ID

When you add an Apple ID to an app all other members will use it for App Store Connect communication and automatic device management. Because the Apple ID is a personal log it's only possible to add it to an app.

## Two factor authentication

App Center supports Apple IDs with two-factor authentication protection and asks for a 6-digit code in a separate dialog after username and password have been entered.

Any of your trusted Apple device can generate a 6-digit code by clicking "Allow." Once you have a code, fill out the dialogue and App Center uses the same session next time it is needed. A 6-digit code only lasts for 30 days and will require renewal thereafter. Renewing a code is done by removing the Apple ID and adding it again, this prompts for username, password, and a 6-digit code.

App Store Connect (portal for App Store and TestFlight) requires both the 6-digit code and an [app-specific password](https://support.apple.com/en-us/HT204397) to log in with two-factor authentication (2FA), you can read how to [add a app-specific password at the App Store docs page](~/distribution/stores/apple.md#adding-two-factor-authentication).
