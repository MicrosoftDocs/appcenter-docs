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

## Known Issues

### Xamarin

1. If you are using the Xamarin IDE alpha release, there is an issue causing the forms previewer not to work when working on a Xamarin.Forms application that integrates App Center. The exact error is: `Invalid XAML: Could not create an native instance of the type 'Microsoft.Azure.Mobile.iOS.Bindings.MSWrapperSdk': the native class hasn't been loaded`
