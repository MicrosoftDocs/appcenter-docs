---
# required metadata

title: Device registration | App Center Distribution
description: 
keywords: UDID, Distribution,
author: oddj0b
ms.author: vigimm

ms.date: 07/03/2017
ms.topic: article
ms.service: mobile-center

ms.assetid: 6060f562-4ca9-448b-aba1-fcd5f6734ceb

# optional metadata

#ROBOTS:
#audience:
ms.reviewer: siminap

---

# Device registration and app re-signing
**Preview feature** 

As a prerequisite for distributing your app to iOS devices, it is necessary to obtain the correct device ID and register it in the Apple developer portal. App Center has two features to help you release apps to internal testers: 

1. An option to register devices, so they work with an existing release
2. A step to **Distribute new release** which can register devices and re-sign the app

## Distribute new release
When distributing a new release, a new **Devices** step is part of the wizard, this will not work for a **Public distribution group**. The new step checks if you have unprovisioned devices in the distribution group; if this happens you can check off  **Register devices and sign my app**. App Center then performs three operations for you:

1. Registers new device IDs in Apple developer portal,
2. Adds them to the provisioning profile and downloads it,
3. Signs the uploaded binary so that all testers can install it.

The flow requires username and password for the [Apple developer portal](https://developer.apple.com/) and the certificate used to sign the app at build time. The certificate is exported to a .p12 file; you can read more on [how to generate a .p12 file here](#generating-a-p12-file)

## Device registration
To initiate the device registration flow, select a distribution group with unprovisioned devices and navigate to the devices tab this is not possible in a **Public distribution group**. Click the **Devices** tab and click the **Register devices** button. A dialog prompts for your username and password used in the [Apple developer portal](https://developer.apple.com/). Once you log in with your Apple username and password, App Center can add the unprovisioned devices to both your Apple developer account and the corresponding provisioning profile. Optionally you can upload a .p12 file to resign the app and have it distributed to the newly added devices. If you just want to add devices and make a distribution later you can leave resign unchecked and download the updated provisioning profile with the button on the review screen. Alternatively, the profile is available to download through Xcode or the Apple developer portal. You can read more on [how to generate a .p12 file here](#generating-a-p12-file)

## Next step for this feature
The App Center roadmap includes a solution to automatically register device IDs with Apple developer portal, then apply it to your app so testers can install it within minutes.

## Privacy concerns on username and password
App Center only uses your Apple ID once as a one-time transaction, and it does not store or in any other way have access to your username and password. 

## What is happening when you click register devices
App Center registers device IDs in your Apple developer account and adds them to the provisioning profile used for distribution. An Apple Developer account has a finite number of spots for devices split by device type. Apple works with five device types, which are iPad, iPhone, iPod, Apple TV, and Apple Watches. Each of these has a limitation of 100 devices, i.e., if you register six devices all of which is iPhones, you have 94 devices IDs left for iPhones and still have 100 left for each of the four other device types. You can read more about it in [Apple's documentation](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingProfiles/MaintainingProfiles.html#//apple_ref/doc/uid/TP40012582-CH30-SW10).

## What is re-signing
For app distribution, code signing is necessity set by Apple; this is the same for distribution through Xcode, App Center, or iTunes Stores. Furthermore, code signing is a precaution to make sure nobody has tampered with your app. You can read more about it in [Apple documentation](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingCertificates/MaintainingCertificates.html#//apple_ref/doc/uid/TP40012582-CH31-SW2).

When you sign your app with an ad-hoc distribution provisioning profile, it includes a list of devices which can install your app. When App Center re-signs an app, it first updates the provisioning profile to include all devices in a distribution group and then re-signs with the updated provisioning profile so that all devices can install the latest release. 

## Generating a .p12 file
The prerequisite for using this guide is to have an Apple production certificate stored on your local machine. If this is not the case, you will be missing a private key.

1. Head to the **Keychain Access** app on your Mac, and select the **My Certificates** section on the left.
2. Find the right distribution certificate and expand it to see the corresponding private key.
	
	A. If the private key is not present, you need to either create a new certificate or get it from the machine where the certificate was created.

3. Make sure both the certificate and the private key are selected, then right click on the items to get the context menu and select **Export 2 items…**. ![Export certificate from keychain][export-certificate]
4. Select a location on disk to save the file as a .p12 – it is recommended that you choose a strong password for the file.

[export-certificate]: images/ios-keychain-certificates.png

## Known errors

### Profile not found
When logging into Apple through App Center, the provisioning profile(s) included in your application are checked against those in your developer account. If any profile used in the binary is not found in your Apple Developer account, App Center will not be able to re-sign your application. To resolve this, ensure that your Apple Developer account contains all of the provisioning profiles used in your application; you can check application profiles in the **General** tab of Xcode project settings, or in the **[iOS bundle signing options](https://developer.xamarin.com/guides/ios/getting_started/installation/device_provisioning/#iOS_Bundle_Signing_Tab)** in Visual Studio for Mac.

### Team not found
When logging into Apple through App Center, the team included in your application are checked against those in your developer account. If any team used in the binary cannot be found in the used Apple developer account, App Center will not be able to re-sign your application. To resolve this, ensure that your Apple developer account contains the team used in your application; you can check the applications team in "General" tab of Xcode project settings or the **[iOS bundle signing options](https://developer.xamarin.com/guides/ios/getting_started/installation/device_provisioning/#iOS_Bundle_Signing_Tab)** in Visual Studio for Mac.

### Updated license agreement
Apple periodically updates its license agreement, and for continued Developer portal use, it is necessary to read and agree with the updated license. The fix is to visit https://developer.apple.com/, login, and follow the instructions on the screen. App Center is unable to help with content in the license or the flow for the license agreement.

### Multifactor authentication
Apple supports multifactor authentication (MFA) for its developer portal and soon so will App Center. For now, the only option is to disable MFA for your Apple ID. Visit appleid.apple.com for details.

## Feedback
Contact us with questions or suggestions about device registration, by commenting on below or through App Center by clicking on the round blue chat button in the lower right-hand side of the screen.

