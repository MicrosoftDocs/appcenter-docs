---
title: App Center Cloud Build Machines
description: Software used on build machines
keywords: build
author: lucen-ms
ms.author: lucen
ms.date: 11/19/2021
ms.topic: article
ms.assetid: 1d1f2f48-1e6c-45da-8cad-0e25200abd98
ms.service: vs-appcenter
ms.custom: build
---

# App Center Cloud Build Machines

[!INCLUDE [Retirement announcement for App Center](../includes/retirement.md)]

Each build runs on a separate, clean virtual machine (VM) no one else has access to. Once the build completes, App Center discards the virtual machine, and all files removed. The artifacts resulting from the build (log files, application files, symbol files) are stored on App Center servers.

## Operating System

Builds for iOS and Android apps (including Xamarin and React Native platforms) are run on macOS VMs running the following configuration. (If the specification maps to both VMs, then the newer one is used):

- [macOS 11.7 **Big Sur**](https://github.com/actions/runner-images/blob/main/images/macos/macos-11-Readme.md)
  - **iOS** (Xcode >= 11.7)
  - **Xamarin** (Mono >= 6.12.0)
- [macOS 12.7 **Monterey**](https://github.com/actions/runner-images/blob/main/images/macos/macos-12-Readme.md)
  - **iOS** (Xcode >= 13.1)
  - **Xamarin** (Mono >= 6.12.0)
- [macOS 13.6 **Ventura**](https://github.com/actions/runner-images/blob/main/images/macos/macos-13-Readme.md)
  - **iOS** (Xcode >= 14.3)
  - **Xamarin** (Mono >= 6.12.0)

Builds for UWP apps are run on [Hosted Windows Agents](https://www.visualstudio.com/docs/build/concepts/agents/hosted) using [Windows Server 2019 & Visual Studio 2019](https://github.com/actions/virtual-environments/blob/master/images/win/Windows2019-Readme.md).
