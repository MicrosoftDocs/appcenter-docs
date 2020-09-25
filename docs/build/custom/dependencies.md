---
title: Custom Dependency Handling
description: How to custom-handle dependencies in App Center Build
keywords: build, pre, post, custom, scripts
author: king-of-spades
ms.author: kegr
ms.date: 09/22/2020
ms.topic: article
ms.assetid: 3603ae8a-8adc-49df-9eee-f078008691af
ms.service: vs-appcenter
ms.custom: build
---

# Custom Build Dependency Handling
The App Center Build service typically automatically handles restoring your app's dependencies neccessary for the build. 

However, there are scenarios where custom handling of those dependencies might be required in order to handle the tasks properly. For example:

- Dependencies that need extra time beyond the defaults used in App Center.
- Dependencies that are hosted in non-public resources. 

## Dependency handling options
There's several options available for restoring your dependencies:

- Default Automatic restoration - Typical for NuGet packages and similar workflows
- Customized Automatic restoration - Including files like NuGet.config in your project that modify the normal automatic process.
- Restoration in a Post-Clone script - allows full control of the restoration process. 
- Including packages in the repository itself - guarantees the packages are available, but can considerably increase the size of the repository. 

