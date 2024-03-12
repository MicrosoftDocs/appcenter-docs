---
title: Install a Build from App Center
description: Instructions on how to install a build
keywords: distribution
author: lucen-ms
ms.author: lucen
ms.date: 02/06/2020
ms.topic: article
ms.assetid: 89a78fd8-ee2d-4f2d-9026-756047866351
ms.service: vs-appcenter
ms.custom: distribute
---

# Install a Build

[!INCLUDE [Retirement announcement for App Center](../includes/retirement.md)]

Installing an application distributed by App Center begins with an email. If you have access to the application, you'll receive a notification email for each new version available. Click on the install link in the email to begin the process. You'll need to enter your credentials to log in. If it's your first time accessing App Center, you can [create a new account][signup]. Once logged in, you can review the app information, release notes, and click the `install` button to install it on your device.

> [!NOTE]
> If you or your testers have email notifications disabled or use the option 'Do not notify testers' when distributing a release, then you won't receive the email mentioned above. In that case, you can download releases in [the install portal](https://install.appcenter.ms/). For more information on installation for testers check out the guide [here](/appcenter/distribution/testers/).

## Windows and Certificates Requirements
Installing a windows package requires a trusted root certificate installed in the root certificate chain for the device you're installing to. The most common solution is for the developer to sign an app package with a 3rd-party trusted root certificate. This certificate will chain through the third-party to the Microsoft root store, and so will be a trusted cert for all user devices. Developers can use a self-created test certificate and sign the application package, however the app will require additional steps to install.

#### Installing a build signed with a developer test certificate
You can install a test signed app by first installing the test certificate (which is automatically included in the app package) by following these steps.

1. Right-click on the `.appxbundle` package you downloaded via App Center and select **properties**.
2. Under the **Digital Signatures** tab, you should see the test certificate. Click to select the certificate and then click the **Details** button.
3. Select the button **View Certificate**.
4. Select the button **Install Certificate**.
5. From the **Store Location** radio buttons, select **Local Machine**. Click the **Next** button.
6. Click **Yes** on the admin prompt for changes to your device.
7. On the **Certificate Import Wizard**, choose the radio button **Place all certificates in the following store**, then select the **Browse** button.
8. Select the **Trusted People** certificate store. Then click the **OK** button.
9. Click the **Next** button on the **Certificate Import Wizard** window.
10. Click **Finish** button to complete the certificate install.
11. You can now close all windows and double-click on the `.appxbundle` file. It should now install properly.

[login]: ~/dashboard/creating-and-managing-apps.md
[signup]: ~/dashboard/creating-and-managing-apps.md
