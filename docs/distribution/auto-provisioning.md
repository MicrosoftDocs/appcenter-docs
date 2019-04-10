---
title: Device registration
description: Registering a device for App Center Distribution
keywords: UDID, Distribution,
author: oddj0b
ms.author: vigimm
ms.date: 12/19/2018
ms.topic: article
ms.service: vs-appcenter
ms.assetid: 6060f562-4ca9-448b-aba1-fcd5f6734ceb
---

# Device registration and app re-signing

When developing an iOS app using your ad-hoc profile, you can only test on devices that are already specified in the provisioning profile for that app. Once you know these devices, you must register them in your Apple developer account, add them to your provisioning profile, generate a new provisioning profile, download and then build your app with the new profile.

App Center will help you register tester device IDs into your Apple Developer account and apply them to the latest release without leaving the App Center portal.

To configure devices, you can turn on **automatically manage devices** under [distribution group settings](groups.md#automatically-manage-devices), or opt-in to doing it when distributing a new release. This option will be under the **Device** step in the distribute new release wizard.

To add devices to an existing release, you can find [**register devices**](#device-registration) under the Distribution Group.

## Limitations

- Automatically managing devices in groups works only for distributing to non-public and non-shared groups.
- If you're distributing to individual users, you will have to register their devices manually, and re-sign the app. You can add these emails to a group to use the tools mentioned in this article.
- If you add multiple groups to your release, you have to configure each group separately using the **Automatically manage devices** under group settings.
- Managing devices is only required for iOS apps signed with a developer or ad-hoc profiles.

## Prerequisites

Before you can use the device capabilities of App Center, you will need:

1. The production certificate used for the original app signing.
2. The set of credentials to your Apple Developer account which holds the [role of Account Holder, Admin, or App Manager](https://developer.apple.com/support/roles/).
3. Turn off "Automatically manage signing" in your Xcode project.

## Distribute new release

When distributing a new release, a **Devices** step is part of the wizard. The step checks if you have unprovisioned devices in the distribution group; if this happens, you can check the **Register devices and sign my app** checkbox. App Center then performs three operations for you:

1. Register new device IDs in the Apple developer portal.
2. Adds them to the provisioning profile and downloads it.
3. Re-signs the uploaded binary so that all testers can install it.

The flow requires username and password for the [Apple developer portal](https://developer.apple.com/) and the certificate used to sign the app at build time. The certificate is exported to a .p12 file; you can read more on [how to generate a .p12 file here](#generating-a-p12-file). If you already have Apple ID and certificate saved in App Center, you can choose it from the dropdown menus.

## Device registration

To initiate the device registration flow, select a distribution group with unprovisioned devices and navigate to the **Devices** tab.

1. Click the **Register devices** button.
2. A dialog prompts for your username and password used in the [Apple developer portal](https://developer.apple.com/).

   a. Once you log in with your Apple username and password, App Center can add the unprovisioned devices to both your Apple developer account and the releases provisioning profile.

   b. Optionally you can upload a .p12 file to resign the app and have it distributed to the newly added devices. You can read more on [how to generate a .p12 file here](#generating-a-p12-file).

3. If you want to add devices and make a distribution later, you can leave the re-sign unchecked and download the updated provisioning profile with the button on the review screen.

   a. Alternatively, the profile is available to download through Xcode or the Apple developer portal.

## Privacy concerns on username and password

When adding Apple credentials and a signing certificate to App Center, using a secure connection, it is uploaded and saved in an encrypted vault. It is not possible for any user to download or retrieve sensitive information from the vault.

By using a set of credentials and certificates, it is automatically available to app collaborators but only for that specific service. As an example, developer X adds credentials and certificates to distribution group "Tester," when developer Y distributes a new release to the Tester group, X's username, password, and certificate are by default selected. App Center only uses your Apple ID during the transaction, and it does not use it for any other means.

## What is happening when you click register devices

App Center registers device IDs in your Apple developer account and adds them to the provisioning profile used for distribution. An Apple Developer account has a finite number of spots for devices split by device type. Apple works with five device types: iPad, iPhone, iPod, Apple TV, and Apple Watch. Each of these has a limitation of 100 devices, i.e., if you register six devices all of which are iPhones you have 94 devices IDs left for iPhones and still have 100 left for each of the four other device types.

## What is re-signing

For app distribution, code signing is a necessity set by Apple; this is the same for distribution through Xcode, App Center, or the iTunes Store. Furthermore, code signing is a precaution to make sure nobody has tampered with your app. You can [read more about code signing in the Apple documentation](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingCertificates/MaintainingCertificates.html#//apple_ref/doc/uid/TP40012582-CH31-SW2).

When you sign your app with an ad-hoc distribution provisioning profile, it includes a list of devices, which can install your app. When App Center re-signs an app, it first updates the provisioning profile to include all devices in a distribution group and then re-signs the app with the updated provisioning profile so that all devices can install the latest release. 

## Generating a .p12 file

To perfom this step, you need an Apple production certificate stored on your local machine. If this is not the case, you will be missing a private key.

1. Open the **Keychain Access** app on your Mac and select the **My Certificates** section on the left.
2. Find the right distribution certificate and expand it to see the corresponding private key.

    A. If the private key is not present, you need to either create a new certificate or get it from the machine where the certificate was created.

3. Make sure both the certificate and the private key are selected, then right-click on the items to get the context menu and select **Export 2 items…**. ![Export certificate from keychain](images/ios-keychain-certificates.png)
4. Select a location on disk to save the file as a .p12 – it is recommended that you choose a strong password for the file.

[export-certificate]: images/ios-keychain-certificates.png

## Remove certificates and Apple IDs from App Center

You can remove the certificates and Apple IDs from App Center in the developer accounts.

 1. Click on your profile picture in the upper-right corner and select **Account settings**.
 2. In the left menu, click **Developer accounts**.
 3. Remove the secret use by using the three vertical dots on the right side of the table and click **Remove..**.

[Read more about storing Apple secrets](../dashboard/manage-apple-secrets.md)

## Manually registering devices

If you're trying to distribute directly to users, you can follow [these steps from the Apple Developer website](https://help.apple.com/xcode/mac/current/#/dev7ccaf4d3c) to manually add devices to your account, and re-sign your app.

## Known errors

### Profile not found

When logging into Apple through App Center, the provisioning profile(s) included in your application are checked against those in your developer account. If any profile used in the binary is not found in your Apple Developer account, App Center will not be able to re-sign your application. To resolve this, ensure that your Apple Developer account contains all of the provisioning profiles used in your application; you can check application profiles in the **General** tab of Xcode project settings, or the **[iOS bundle signing options](https://docs.microsoft.com/xamarin/ios/deploy-test/app-distribution/ad-hoc-distribution#selecting-a-distribution-profile-in-a-xamarinios-project)** in Visual Studio for Mac.

### Team not found

When logging into Apple through App Center, the team included in your application are checked against those in your developer account. If any team used in the binary cannot be found in the used Apple developer account, App Center will not be able to re-sign your application. To resolve this, ensure that your Apple developer account contains the team used in your application; you can check the applications team in the "General" tab of Xcode project settings or the **[iOS bundle signing options](https://docs.microsoft.com/xamarin/ios/deploy-test/app-distribution/ad-hoc-distribution#selecting-a-distribution-profile-in-a-xamarinios-project)** in Visual Studio for Mac.

### Updated license agreement

Apple periodically updates its license agreement, and for continued Developer portal use, you must read and agree with the updated license.

 1. Sign in to [Apple Developer portal](https://developer.apple.com/).
 2. Follow the instructions given to accept the license agreement.

App Center is unable to help with content in the license or the flow for the license agreement.

### Our tester did not register their device ID

If a tester accidentally clicked **I already registered it**, follow the step to register a device manually:

 1. Navigate to [https://install.appcenter.ms/register-device ](https://install.appcenter.ms/register-device)on your mobile device.
 2. Click **Register** and follow the on-screen instructions.

## Feedback

Contact us with questions or suggestions about device registration, by commenting on below or through App Center by clicking on the blue chat button in the lower-right corner of every App Center page.
