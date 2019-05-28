---
title: Branches and Build configurations
description: How to configure your branch
keywords: build, branches, build configuration, build definition
author: matwen
ms.author: matwen
ms.date: 05/28/2019
ms.topic: article
ms.service: vs-appcenter
ms.custom: build
ms.assetid: 392b1718-cdb2-4831-a20a-d7d6eccc0e96
---

# Branches and build configurations

After you [connect your repository](./connect.md), you will be able to configure continuous integration for any of your repository's branches.
In App Center Build, your branches are the origin of setting up a build. For every branch you can configure whether you want to build on every push, or only when you manually queue a build.

You can see the respective instructions to configure your build for [iOS](./ios/), [Android](./android/), [Windows](./windows/), [macOS](./macos/), [Xamarin](./xamarin/) and [React Native](./react-native/).

## Cloning build configurations

If you already have a branch configured in your repository and you have a similar branch that you want to apply the same configuration for, you can clone the existing configuration. To do this, you can either click on the "more" dropdown when hovering over an un-configured branch in the list and select "Clone build configuration", or select the branch and on the overview select "Clone build configuration" on the "Configure" menu.

From there, you can select which configured branch to clone the definition from.

A clone will copy:
- the configuration from your origin branch to your target branch, such as the selected project and configuration, the trigger to build (automatic or manual)
- all signing configurations and credentials
- all [environment variables](./custom/variables/) and [build scripts](./custom/scripts)

If you want to use your source branch only as a template and edit individual settings, you can always edit the cloned build configuration after creating it.

> [!NOTE]
> When cloning the build configuration of a branch, you will end up with a new build configuration for your target branch that is distinct from the originating configuration. Any changes in the cloned and original build configurations are not mirrored.


<!-- Optional: Add screenshot of the UI here - pending on final UI -->