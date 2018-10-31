---
title: Install a Build from App Center
description: Intructions on how to install a build
keywords: distribution
author: JoshuaWeber
ms.author: JoshuaWeber
ms.date: 10/17/2018
ms.topic: article
ms.assetid: 89a78fd8-ee2d-4f2d-9026-756047866351
ms.service: vs-appcenter
ms.custom: distribute
---

# Install a Build

Installation of an application being distributed by App Center begins with an email. If you have access to the application you will receive a notification email for each new version available. Simply click on the install link in the email to begin the process. You will need to enter your credentials to login. If this is your first time accessing App Center, you can instead [create a new account][signup]. Once logged in you can review the application information and release notes, and click the install button to trigger installation onto your device.

## Windows and Certificates Requirements

To install a windows package requires a trusted root certificate installed in the root certificate chain for the device you are installing too. The most common solution is for the developer to sign a application package with a purchased 3rd party provider trusted root certificate. This certificate will chain to through the third party to the Microsoft root store and so will be a trusted cert for all user devices. Developers can opt to use a self-created test certificate and sign the application package, however it will result in additional steps for testers at installation time.

#### Installing a build signed with a developer test certificate

You can install a test signed app by first installing the test certificate (which is automatically included in the app package) by following these steps.

1. Right-click on the `.appxbundle` package you downloaded via App Center and select **properties**.
2. Under the **Digital Signatures** tab you should see the test certificate. Click to select the certificate and click on **Details** button.
3. Select the button **View Certificate**.
4. Select the button **Install Certificate**.
5. From the **Store Location** radio buttons select **Local Machine**. Click the **Next** button.
6. Click **Yes** on the admin prompt for changes to your device.
7. On the **Certificate Import Wizard** chose the radio button **Place all certificates in the following store** then select the **Browse** button.
8. Select the **Trusted People** certificate store. Then click the **OK** button.
9. Click the **Next** button on the **Certificate Import Wizard** window.
10. Click **Finish** button to complete the certificate install.
11. You can now close all windows and double click on the `.appxbundle` file. It should now install properly.


[login]: ~/dashboard/creating-and-managing-apps.md
[signup]: ~/dashboard/creating-and-managing-apps.md
