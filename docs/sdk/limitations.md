---
title: SDK Limitations & Known Issues
description: Limitations and known issues with the App Center SDK
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 09/18/2019
ms.topic: article
ms.assetid: e1e427f3-6949-4266-b1cd-13da703fc132
ms.service: vs-appcenter
ms.custom: sdk
---

# SDK Limitations & Known Issues

## React Native

1. The React Native SDK does not support In-App-Updates through Distribution. Instead, use the [CodePush service](https://microsoft.github.io/code-push/) to distribute application updates without creating a new build.

## Xamarin

1. Crashes caused by `StackOverflowException` are not reported. This is a limitation of the Xamarin runtime.
2. You can't use most AppCenter SDK APIs in a Xamarin Forms application constructor if you want to use the previewer. The Xamarin previewer does not support native code.
3. You cannot deploy an application using the AppCenter SDK to the Xamarin Live Player as the SDK contains native code.

## UWP, WPF, and WinForms

1. Crashes caused by `StackOverflowException` are not reported. This is a limitation of the .NET runtime.
2. Only crashes caused by .NET exceptions are reported, not C/C++ crashes.
