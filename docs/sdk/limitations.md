---
title: App Center SDK Limitations & Known Issues
description: Limitations and known issues with the App Center SDK
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 11/30/2018
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
2. You can't use most AppCenter SDK APIs in Xamarin Forms application constructor if you want to use the previewer because the Xamarin previewer does not support native code.
3. An application using the AppCenter SDK cannot be deployed to the Xamarin Live Player as the SDK contains native code.
