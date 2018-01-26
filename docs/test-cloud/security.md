---
title: Test Cloud Security
description: Security information relating to devices used in Test Cloud
keywords: test cloud
author: glennwester
ms.author: glwest
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 10df164b-3834-4444-80ea-765df2cff9bb
ms.service: vs-appcenter
ms.custom: test
---

# Test Cloud Security

Devices in Test Cloud are part of a shared public cloud, meaning that many users will install their app and run their tests on the same physical devices. While Test Cloud prohibits uploading personally identifiable information (PII), measures are taken to ensure security across test runs by different users.

- Any apps installed during a test run are uninstalled
- All local storage is cleared from the device
- Devices are restored to their default settings

# Personal Data in tests
Do not use personal data in your tests, “personal data” means any information relating to an identified or identifiable natural person. An identifiable natural person is one who can be identified, directly or indirectly, in particular by reference to an identifier such as a name, an identification number, location data, an online identifier or to one or more factors specific to the physical, physiological, genetic, mental, economic, cultural or social identity of that natural person.