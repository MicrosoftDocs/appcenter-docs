---
title: iOS Code Signing in App Center
description: Code signing apps built with App Center
keywords: code signing,  ios
author: siminapasat
ms.author: siminap
ms.date: 01/20/2017
ms.topic: article
ms.assetid: aba79461-01c9-4a47-a8d9-0ef015c8c8a5
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: ios
---

# iOS Code Signing

To run an app on a real device during the development process through a beta program or in the App Store, it is required that the app is code signed. 

You can code sign a build by uploading your provisioning profile (.mobileprovision) and your certificate (.p12) when [configuring the build](../first-build/index.md). You will also need to include the password you have set for the certificate. To ensure that the settings work, make sure that the settings in the project and project targets are compatible with the uploaded files, e.g. if you choose a development code signing identity in Xcode, make sure to upload a development certificate to App Center for building.

* A **provisioning profile** (.mobileprovision) contains the list of devices that can run the application and knows which certificates are connected to the profile.
    * A **development** provisioning profile is used to install development apps on test devices and contains a set of UDIDs (Unique Device Identifiers). The signed app can be downloaded and installed only on the devices listed in the provisioning profile.
    * An **ad hoc distribution** provisioning profile is used to install an app on a limited number of registered devices.
    * An **in-house distribution** provisioning profile is used to distribute apps within an enterprise and it is only available via the Apple Enterprise portal
* A **certificate** (.p12) is the code signing identity of the developer.
    * A **development** certificate is used for development purposes and testing.
    * A **distribution** certificate is used for builds submitted to the App Store.
    * An **enterprise distribution** certificate is used for apps distributed within an enterprise and it is only available via the Apple Enterprise portal.
