---
title: Signing iOS Apps for Automated Testing
description: What iOS Provisioning Profiles work in App Center Test and locally?
keywords: appcenter, test, stall
author: king-of-spades
ms.author: kegr
ms.date: 07/28/2020
ms.topic: article
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
---

# Signing iOS apps for Automated Testing
   - Local Tests - Signing with a development profile is supported. For XCUITest, the test runner must be signed with a development profile but the app can be signed with any type of profile.

   - App Center Tests - You may sign with any profile because we always re-sign your app with one of our development profiles. There's one important exception: we aren't able to re-sign builds created for the App Store, so we can't run tests with apps built for App Store distribution.
   
## Background on iOS provisioning for testing
Most test frameworks only support development profiles. So, when tests run locally on your development machine, in general, we only support development profiles. One exception is the recent switch to use XCUITest. In this model there are two applications: the application under test (AUT) and the test runner. In this case, the AUT can be signed using any type of profile, but the test runner must be signed with a development profile.

When tests are run in the App Center Test, they're re-signed before the tests start running. Re-signing is a necessary step to enable your app to run on our devices. The type of profile you used to sign the app doesn't matter, because it's re-signed with one of our development profiles.