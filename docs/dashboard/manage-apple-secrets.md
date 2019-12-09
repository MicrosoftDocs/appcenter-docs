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

You can add your Apple ID and signing certificate in two ways:

1. While going through the Distribute upload wizard
2. Navigating to **Account settings** -> **Developer accounts**  and click the blue **+** button. 

Secrets are store in a secure vault, to protect the confidentiality of your credentials.

App Center uses your Apple ID to manage your provisioning profile and your signing certificate to re-sign a release.

## How can app members use my Apple ID?

When you add an Apple ID to an app, all other app members will use it for to communicate with App Store Connect and automatic device management. Because the Apple ID is a personal login, it is only possible to add it to an app and not an organization.

## Two factor authentication

App Center supports Apple IDs with two-factor authentication protection enabled, the six-digit code verification code must be generated from a trusted devices.

Any of your trusted Apple devices can generate a six-digit code by clicking "Allow." Once you have a code, fill out the dialogue and App Center uses the same session next time it is needed. A six-digit code only lasts for 30 days and will require renewal thereafter. You can renew a code with a click on **Reconnect account** from the UI. The UI will be prompted for a new six-digit code.

App Store Connect (portal for App Store and TestFlight) requires both the six-digit code and an [app-specific password](https://support.apple.com/en-us/HT204397) to log in with two-factor authentication (2FA). You can read how to [add a app-specific password at the App Store docs page](~/distribution/stores/apple.md#adding-two-factor-authentication).
