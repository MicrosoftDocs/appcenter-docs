---
title: Device registration
description: Registering a device for App Center Distribution
keywords: UDID, Distribution,
author: oddj0b
ms.author: vigimm
ms.date: 10/05/2018
ms.topic: article
ms.service: vs-appcenter
ms.assetid: 6060f562-4ca9-448b-aba1-fcd5f6734ceb
---

# Device registration and app re-signing

As a prerequisite for distributing your app to iOS devices, it is necessary to obtain the correct device ID and register it in the Apple developer portal. App Center has three features to help you release apps to internal testers:

1. **Automatically manage devices** under [distribution group settings](groups.md#automatically-manage-devices)
2. An option to register devices, so they work with an existing release
3. A step to **Distribute new release** which can register devices and re-sign the app

## Distribute new release

When distributing a new release, a new **Devices** step is part of the wizard, this will not work for a **Public distribution group**. The new step checks if you have unprovisioned devices in the distribution group; if this happens you can check off  **Register devices and sign my app**. App Center then performs three operations for you:

1. Registers new device IDs in Apple developer portal,
2. Adds them to the provisioning profile and downloads it,
3. Signs the uploaded binary so that all testers can install it.

The flow requires username and password for the [Apple developer portal](https://developer.apple.com/) and the certificate used to sign the app at build time. The certificate is exported to a .p12 file; you can read more on [how to generate a .p12 file here](#generating-a-p12-file)

## Device registration

To initiate the device registration flow, select a distribution group with unprovisioned devices and navigate to the devices tab, this is not possible in a **Public distribution group**. Click the **Devices** tab and click the **Register devices** button. A dialog prompts for your username and password used in the [Apple developer portal](https://developer.apple.com/). Once you log in with your Apple username and password, App Center can add the unprovisioned devices to both your Apple developer account and the corresponding provisioning profile. Optionally you can upload a .p12 file to resign the app and have it distributed to the newly added devices. If you just want to add devices and make a distribution later you can leave resign unchecked and download the updated provisioning profile with the button on the review screen. Alternatively, the profile is available to download through Xcode or the Apple developer portal. You can read more on [how to generate a .p12 file here](#generating-a-p12-file)

## Privacy concerns on username and password

When adding Apple credentials and a signing certificate to App Center, using a secure connection, it is uploaded and saved in an encrypted vault. It is not possible for any user to download or retrieve sensitive information from the vault.

By using a set of credentials and certificates, it is automatically available to app collaborators but only for that specific service. As an example, developer X adds credentials and certificates to distribution group "Tester," when developer Y distributes a new release to the Tester group, X's username, password, and certificate are by default selected. App Center only uses your Apple ID during the transaction, and it does not use it for any other means.

## What is happening when you click register devices

App Center registers device IDs in your Apple developer account and adds them to the provisioning profile used for distribution. An Apple Developer account has a finite number of spots for devices split by device type. Apple works with five device types: iPad, iPhone, iPod, Apple TV, and Apple Watch. Each of these has a limitation of 100 devices, i.e. if you register six devices all of which are iPhones you have 94 devices IDs left for iPhones and still have 100 left for each of the four other device types. You can read more about it in [Apple's documentation](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingProfiles/MaintainingProfiles.html#//apple_ref/doc/uid/TP40012582-CH30-SW10).

## What is re-signing

For app distribution, code signing is a necessity set by Apple; this is the same for distribution through Xcode, App Center, or the iTunes Store. Furthermore, code signing is a precaution to make sure nobody has tampered with your app. You can read more about it in the [Apple documentation](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingCertificates/MaintainingCertificates.html#//apple_ref/doc/uid/TP40012582-CH31-SW2).

When you sign your app with an ad-hoc distribution provisioning profile, it includes a list of devices which can install your app. When App Center re-signs an app, it first updates the provisioning profile to include all devices in a distribution group and then re-signs with the updated provisioning profile so that all devices can install the latest release. 

## Generating a .p12 file

The prerequisite for using this guide is to have an Apple production certificate stored on your local machine. If this is not the case, you will be missing a private key.

1. Head to the **Keychain Access** app on your Mac and select the **My Certificates** section on the left.
2. Find the right distribution certificate and expand it to see the corresponding private key.

    A. If the private key is not present, you need to either create a new certificate or get it from the machine where the certificate was created.

3. Make sure both the certificate and the private key are selected, then right click on the items to get the context menu and select **Export 2 items…**. ![Export certificate from keychain](images/ios-keychain-certificates.png)
4. Select a location on disk to save the file as a .p12 – it is recommended that you choose a strong password for the file.

[export-certificate]: images/ios-keychain-certificates.png

## Known errors

### Profile not found

When logging into Apple through App Center, the provisioning profile(s) included in your application are checked against those in your developer account. If any profile used in the binary is not found in your Apple Developer account, App Center will not be able to re-sign your application. To resolve this, ensure that your Apple Developer account contains all of the provisioning profiles used in your application; you can check application profiles in the **General** tab of Xcode project settings, or in the **[iOS bundle signing options](https://developer.xamarin.com/guides/ios/getting_started/installation/device_provisioning/#iOS_Bundle_Signing_Tab)** in Visual Studio for Mac.

### Team not found

When logging into Apple through App Center, the team included in your application are checked against those in your developer account. If any team used in the binary cannot be found in the used Apple developer account, App Center will not be able to re-sign your application. To resolve this, ensure that your Apple developer account contains the team used in your application; you can check the applications team in the "General" tab of Xcode project settings or the **[iOS bundle signing options](https://developer.xamarin.com/guides/ios/getting_started/installation/device_provisioning/#iOS_Bundle_Signing_Tab)** in Visual Studio for Mac.

### Updated license agreement

Apple periodically updates its license agreement, and for continued Developer portal use, it is necessary to read and agree with the updated license. The fix is to visit [Apple Developer portal](https://developer.apple.com/), login, and follow the instructions on the screen. App Center is unable to help with content in the license or the flow for the license agreement.

### Our tester did not register their device ID

If you accidentally clicked **I already registered it** you can register your devices by visiting [https://install.appcenter.ms/register-device](https://install.appcenter.ms/register-device) on your mobile device.  Click **Register** and follow the on-screen instructions.

## Feedback

Contact us with questions or suggestions about device registration, by commenting on below or through App Center by clicking on the blue chat button in the lower-right corner of every App Center page.
