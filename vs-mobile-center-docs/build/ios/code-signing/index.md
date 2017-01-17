---
title: Code Signing
description: Code signing apps built with Mobile Center
keywords: code signing,  ios
author: siminapasat
---

# Code Signing

To run an app on real devices during the development process or to distribute it via a beta program or in the AppStore it is required that the app is signed. Without code signing, the app can be only ran on a simulator or on a jailbroken device.

To code sign a build, upload a provisioning profile (.mobileprovision) and your certificate (.p12 file) when [configuring the build](../first-build/index.md), along with the password you have set for the certificate. Make sure that the code signing settings in the project and in the project targets are compatible with the uploaded files. (e.g. if you choose a development code signing identity in Xcode, also upload a development certificate to Mobile Center for building.)
* a **provisioning profile** (.mobileprovision) contains the list of devices that can run the application and knows which certificates are connected to this profile
    * a **development** provisioning profile is used to install development apps on test devices and it contains a set of UDIDs (Unique Device Identifiers); the app can be downloaded and installed only on the devices listed in the provisioning profile
    * an **ad hoc distribution** provisioning profile is used to install an app on a limited number of registered devices (for instance during beta testing)
    * a **in house distribution** provisioning profile is used to distribute apps within an enterprise and it is only available via the Apple Enterprise portal
* a **certificate** (.p12) is the code signing identity of the developer
    * a **development** certiifcate is used for development purposes and testing (with internal or external users)
    * a **distribution** certificate is used for builds submitted to the AppStore
    * an **enterprise distribution** certificate is used for apps distributed within an enterprise and it is only available via the Apple Enterprise portal
