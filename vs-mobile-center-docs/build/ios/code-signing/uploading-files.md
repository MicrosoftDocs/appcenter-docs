---
title: Uploading iOS Code Signing Files in Mobile Center
description: Code signing apps built with Mobile Center
keywords: code signing, ios
author: siminapasat
ms.author: siminap
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 6a9c7fcc-7a9b-4d9b-bea2-c6ee8e4208a1
ms.service: mobile-center
ms.custom: build
ms.tgt_pltfrm: ios
---

# Uploading the code signing files

To sign your iOS builds, upload a provisioning profile (.mobileprovision) and your certificate (.p12 file) when [configuring the build](~/build/ios/first-build/index.md), along with the password you have set for the certificate. These files can be found in the [Apple Developer Center](https://developer.apple.com/account/), under Certificates, IDs & Profiles.
![Apple Developer: Certificates, IDs & Profiles][apple-certificates]

# Uploading your provisioning profile
1. Once on the "Certificates, IDs & Profiles" page, click on "Provisioning Profiles".
2. Select the provisioning profile you are planning to use for signing your app with in Mobile Center and download it. Make sure to select the right type of certificate (development or distribution).
![Download provisioning profile][download-provisioning-profile]
3. After saving the provisioning profile locally (in a .mobileprovision file), you can upload it to Mobile Center when [configuring a branch](~/build/ios/first-build/index.md).

# Uploading your certificate
1. Once on the "Certificates, IDs & Profiles" page, click on "Certificates".
2. Select the certificate you are planning to use for signing your app in Mobile Center and download it. Make sure to select the right type of certificate (development or production) and that the provisioning profile you've previously selected contains this certificate.
![Download certificate from Apple Developer][download-certificate]
3. Download the certificate and open it on your Mac.
4. Head to Keychain Access on your Mac and locate the certificate you have downloaded.
5. Right click on the certificate and click Export. Save it with the .p12 extension and remember the password.
6. After exporting the provisioning profile locally, you can upload it to Mobile Center when [configuring a branch](~/build/ios/first-build/index.md).

[apple-certificates]: images/apple-developer-certificates-blurred.png
[download-provisioning-profile]: images/provisioning-profile-blurred.png
[download-certificate]: images/certificate-blurred.png
