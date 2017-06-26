---
title: Setting up an Xcode Project for Code Signing with Mobile Center
description: Code signing apps built with Mobile Center
keywords: code signing, ios
author: siminapasat
ms.author: siminap
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 47bb8997-4d24-48f4-a0e8-f503d2c65185
ms.service: mobile-center
ms.custom: build
ms.tgt_pltfrm: ios
---

# Setting up an Xcode project for code signing

When developing an iOS app, there are two ways to configure the Code Signing settings.

## Automatic provisioning
The automatic provisioning settings let Xcode select what provisioning profile and certificate to use when signing a build. Generally, this is the approach [recommended by Apple](https://developer.apple.com/library/content/qa/qa1814/_index.html) when developing locally.

When building your project on a build service, such as Mobile Center, we recommend you use the Manual signing settings in order to make sure that locally your project is using the same signing settings as the one in Mobile Center.

When building a project locally on the device, Xcode will use the automatically detected provisioning profile and certificate. In order to build your project with Mobile Center, make sure that the files you are uploading are compatible with the code signing settings in the project and in the project targets. For instance, if the Xcode project is configured to use a development code signing identity, make sure to upload a compatible development certificate to Mobile Center.

### Xcode 8
#### Automatic Signing
The Automatic signing in Xcode 8 is truly automatic. 
In automatic signing the provisioning profile is chosen by a combination of the correct project's Team, app bundle id , target and capabilities if this provisioning profile doesn't exists Xcode will create one automatically. 

When using automatic-signing the `Archive` action firsts creates an archive file signed with **development code signing**. 
Then, the export part resigns the archive with a **certificate matching the export method** (app-store,ad-hoc,enterprise,development).If the used export method is not `development` then the the signing process requires two different provisioning profiles and certificates. One for the `Archive` action and one for the `Export` action.

Currently we support automatic signing using **development export method** only.
We are currently working on supporting other exports options.

In order to use automatic signing you must use the development provisioning profile that was created by Xcode. 

#### How to find the provisioning profile created by Xcode?

When enabling the automatic signing option Xcode provides the provisioning profile name

![Xcode 8 find provisioning profile name][xcode-8-provisioning-profile-name]

#### Xcode 8.1 & 8.2
You can find the provisioning profile by searching in your account details

![Xcode 8 search for your account][xcode-8-account]

![Xcode 8 search for your profile account][xcode-8-account-profile]

#### Xcode 8.3 
From Xcode 8.3 it's not possible to search for your account details, instead you will need to search for the provisioning profile directly in the folder `~/Library/MobileDevice/Provisioning\ Profiles`


## Manual provisioning
You can configure Xcode to use a specific certificate and provisioning profile to sign a build. Make sure that you upload the exact same files to Mobile Center.

[xcode-8-provisioning-profile-name]: images/xcode-8-provisioning-profile-name.png

[xcode-8-account]: images/account.png

[xcode-8-account-profile]: images/account-profile.png

