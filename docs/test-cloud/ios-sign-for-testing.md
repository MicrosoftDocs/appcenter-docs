---
title: Signing iOS Apps for Automated Testing
description: What iOS Provisioning Profiles work in App Center Test and locally?
keywords: appcenter, test, stall
author: lucen-ms
ms.author: kegr
ms.date: 12/10/2020
ms.topic: article
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
---

# Signing iOS apps for Automated Testing
   - **Local Tests** - Signing with a development profile is supported by most test frameworks. For XCUITest, the test runner must be signed with a development profile but the app can be signed with any type of profile.

   - **App Center Tests** - You may sign with any profile that allows us to re-sign your app with one of our development profiles. There's an important exception: we aren't able to re-sign builds created for the App Store, so we can't run tests with apps built for App Store distribution.
   
## Background on iOS provisioning for testing
Most test frameworks only support development profiles. An exception is XCUITest. In the XCUITest model, there are two applications: the application under test (AUT) and the test runner. The AUT can be signed using any type of profile, but the test runner must be signed with a development profile.

When tests are run in the App Center Test, they're re-signed before the tests start running. Re-signing is necessary for your app to run on our devices. Our system can re-sign provisioning profiles that contain a `<ProvisionedDevices>` set, because we replace the devices with our Test service devices.

Known re-signing scenarios in App Center Test: 
- **Development Profiles** - Always contain `<ProvisionedDevices>` so they can be re-signed. 
- **Ad-Hoc Profiles** - May or may not contain `<ProvisionedDevices>`, so they might not be able to be re-signed.
- **App Store Profiles** - Never contain `<ProvisionedDevices>`, so they can _never_ be re-signed to run in App Center Test.