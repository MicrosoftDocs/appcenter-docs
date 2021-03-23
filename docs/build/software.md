---
title: App Center Cloud Build Machines
description: Software used on build machines
keywords: build
author: lucen-ms
ms.author: lucen
ms.date: 04/28/2020
ms.topic: article
ms.assetid: 1d1f2f48-1e6c-45da-8cad-0e25200abd98
ms.service: vs-appcenter
ms.custom: build
---

# App Center Cloud Build Machines

Each build runs on a separate, clean virtual machine (VM) no one else has access to. Once the build completes, App Center discards the virtual machine, and all files removed. The artifacts resulting from the build (log files, application files, symbol files) are stored on App Center servers.

## Operating System

Builds for iOS and Android apps (including Xamarin and React Native platforms) are run on macOS VMs running the following configuration. (If the specification maps to both VMs, then the newer one is used):
- [macOS 10.14 **Mojave**](https://github.com/actions/virtual-environments/blob/main/images/macos/macos-10.14-Readme.md)
   - **iOS** (Xcode < 11.0)
   - **Xamarin** (Mono < 6.4) 
- [macOS 10.15 **Catalina**](https://github.com/actions/virtual-environments/blob/main/images/macos/macos-10.15-Readme.md)
   - **iOS** (Xcode >= 11.0)
   - **Xamarin** (Mono >= 6.4)
   - **Android Native**
   - **React Native Android**

Builds for UWP apps are run on [Hosted Windows Agents](https://www.visualstudio.com/docs/build/concepts/agents/hosted) using [Windows Server 2019 & Visual Studio 2019](https://github.com/actions/virtual-environments/blob/master/images/win/Windows2019-Readme.md).
