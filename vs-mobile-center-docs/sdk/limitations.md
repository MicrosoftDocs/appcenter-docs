---
title: App Center SDK Limitations & Known Issues
description: Limitations and known issues with the App Center SDK
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 03/15/2017
ms.topic: article
ms.assetid: e1e427f3-6949-4266-b1cd-13da703fc132
ms.service: vs-appcenter
ms.custom: sdk
---

# SDK Limitations & Known Issues

## Limitations

### React Native

1. The React Native SDK currently does not support In-App-Updates. The reason for this is that one of React Native’s main features is that it allows to deploy apps using [CodePush](https://microsoft.github.io/code-push/) without the need to distribute a new build.

### Xamarin

1. Crashes caused by `StackOverflowException` are not reported. This is a limitation of the Xamarin runtime.
