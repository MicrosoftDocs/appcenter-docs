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
2. Select the provisioning profile you are planning to use for signing your app with in Mobile Center and download it. Make sure to select the right type of profile (development or distribution).
![Download provisioning profile][download-provisioning-profile]
3. After saving the provisioning profile locally (in a .mobileprovision file), you can upload it to Mobile Center when [configuring a branch](~/build/ios/first-build/index.md).

# Uploading your certificate
1. Once on the "Certificates, IDs & Profiles" page, click on "Certificates".
2. Select the certificate you are planning to use for signing your app in Mobile Center and download it. Make sure to select the right type of certificate (development or production) and that the provisioning profile you've previously selected contains this certificate. Also, you need to have the private key for the certificate installed on your Mac - it will not be included if you only download the certificate from the Apple Developer Center.
![Download certificate from Apple Developer][download-certificate]
3. Download the certificate and open it on your Mac.
4. Head to the "Keychain Access" app on your Mac and locate the certificate you have downloaded: For this, select the "My Certificates" section on the left.
5. Find the right certificate and expand it to see the corresponding private key.
6. Make sure both the certificate and the private key are selected, then right click for the context menu on the items and click "Export 2 items…".
![Export certificate from keychain][export-certificate]
7. Select a location on disk to save the file as a .p12 – it is recommended that you choose a strong password for the file.
8. After exporting the provisioning profile locally, you can upload it to Mobile Center when [configuring a branch](~/build/ios/first-build/index.md).

[apple-certificates]: images/apple-developer-certificates-blurred.png
[download-provisioning-profile]: images/provisioning-profile-blurred.png
[export-certificate]: images/ios-keychain-certificates.png
[download-certificate]: images/certificate-blurred.png
