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

- Default Automatic restoration - Typical for NuGet packages and similar workflows.
- Customized Automatic restoration - Including files like NuGet.config in your project that modify the normal automatic process.
- Restoration in a [Post-Clone script](~/build/custom/scripts/) - Allows full control of the restoration process. 
- Including packages in the repository itself - Guarantees the packages are available, but can considerably increase the size of the repository. 

## Common Examples
These examples aren't intended to list every possible scenario, but show options for dealing with restoring dependencies in a customized manner.

#### Using CocoaPods with some, not all, pods checked-in to the repository
Normally if your project uses CocoaPods, the main App Center Build task will automatically restore them using `pod install`. However, if you have a `/pods` folder checked-in your repo, our system assumes the pods are checked-in and skips this step. 

Potential workarounds include:
- Including all CocoaPods.
- Remove the `/pods` folder. 
- Add `pod install` to a Post-Clone build script to add missing pods.

#### Yarn packages needing extra time reliably restore
Currently Yarn packages have 30 seconds to complete the Yarn restore task during the main build step. Ths can cause intermittent failures like this:
> error An unexpected error occurred: "https://registry.yarnpkg.com/[PKG-NAME]/-/[PKG-NAME]-[VERSION].tgz: ESOCKETTIMEDOUT

When Yarn [times out restoring packages](https://stackoverflow.com/a/51508426/3757150), it can throw this error message, so you may need other approaches for the problematic packages in order to ensure they're reliably available for the build. 

Potential workarounds include:
- Supplying the packages in your repository.
- Restoring in a Post-Clone script with an increased timeout: https://classic.yarnpkg.com/en/docs/cli/config
