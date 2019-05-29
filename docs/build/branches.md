---
title: Branches and Build configurations
description: How to configure your branch
keywords: build, branches, build configuration, build definition
author: ranterle
ms.author: matwen
ms.date: 05/28/2019
ms.topic: article
ms.service: vs-appcenter
ms.custom: build
ms.assetid: 392b1718-cdb2-4831-a20a-d7d6eccc0e96
---

# Branches and build configurations

After you [connect your repository](~/build/connect.md), you will be able to configure continuous integration for any of your repository's branches.
In App Center Build, your branches are the origin of setting up a build. For every branch you can configure whether you want to build on every push, or only when you manually queue a build.

You can see the respective instructions to configure your build for [iOS](~/build/ios/index.md), [Android](~/build/android/index.md), [Windows](~/build/windows/index.md), [macOS](~/build/macos/index.md), [Xamarin](~/build/xamarin/index.md), and [React Native](~/build/react-native/index.md).

## Cloning build configurations

You may face a situation where you already have a branch configured in your repository and you have a similar branch for which you want to apply the same configuration. In this case, you can clone the existing configuration: You can either click on the **more** dropdown when hovering over an unconfigured branch in the list and select "Clone build configuration", or select the branch and on the overview select "Clone build configuration" on the **Configure** menu.

From there, you can select the configured branch from which to clone the definition.

A clone copies:
- The configuration from your origin branch to your target branch, such as the selected project and configuration, the trigger to build (automatic or manual)
- All signing configurations and credentials
- All [environment variables](~/build/custom/variables/index.md) and [build scripts](~/build/custom/scripts/index.md)

If you want to use your source branch only as a template and edit individual settings, you can always edit the cloned build configuration after creating it.

> [!NOTE]
> App Center does not mirror changes between the original and cloned build configurations. When cloning the build configuration of a branch, you will end up with a new build configuration for your target branch that is independent from the original. 