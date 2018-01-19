---
title: Uploading Mac Code Signing Files in App Center
description: Code signing apps built with App Center
keywords: code signing, mac, macos
author: andyzg
ms.author: t-anzha
ms.date: 11/01/2017
ms.topic: article
ms.assetid: 4c468e82-f2cb-4cfd-87d4-1e5f761aa61a
ms.service: app-center
ms.custom: build
ms.tgt_pltfrm: macos 
---

# Uploading code signing files

To sign your Mac builds, upload your provisioning profile (.provisionprofile) and certificate (.p12 file) when [configuring the build](~/build/macos/first-build.md), along with the password you have set for the certificate. Your certificate can be found through exporting it from Xcode, and your provisioning profile can be found from the [Apple Developer Center](https://developer.apple.com/account/), under Certificates, IDs & Profiles.

# Uploading your certificate
Your certificate can be found in your Keychain or through simply exporting it from Xcode as follows:
1. In Xcode, click on "Xcode" in the menubar, "Preferences", then "Accounts"
2. Select the Apple ID on the left and then the desired team that contains your certificate on the right
3. Click on "Manage Certificates..."
![Export certificate][xcode-certificate-export]
4. Right click the certificate you're looking for, click "Export Certificate", choose a destination and enter a password.
5. Go to the build configuration of the branch you want to sign in App Center and upload the certificate you just exported and provide the correct password.

# (Optional) Download the provisioning profile
The provisioning profiles can be found from the [Apple Developer Center](https://developer.apple.com/account/), under Certificates, IDs & Profiles. Make sure you've switched to the "macOS" section in the top left corner. Once you've downloaded your provisioning profile, you can upload it to App Center in the build configuration.
![Download provisioning profile][download-provisioning-profile]
3. After saving the provisioning profile locally, you can upload it to App Center when [configuring a branch](~/build/macos/first-build.md).

[xcode-certificate-export]: images/xcode-certificate-export.jpg
[download-provisioning-profile]: images/provisioning-profile-blurred.png
