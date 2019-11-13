---
title: "Crashes"
author: derpixeldan
ms.author: daadam
ms.date: 07/16/2019
ms.topic: article
ms.assetid: D340D325-FB0A-4766-BCB3-5D702023D60C
ms.service: vs-appcenter
---

# Crashes

On App Center, Crashes are available under "Diagnostics" which combines crash reporting and handled errors for Xamarin and Unity.

## HockeySDK Crashes

Crash reports collected by the HockeySDK are also send to App Center. Also after the shutdown of HockeyApp App Center keeps receiving crash reports from the HockeySDK. The HockeyApp crashes forwarding is available for the following platforms:

* Android
* Android NDK
* iOS
* macOS
* React Native
* tvOS
* Xamarin
* UWP
* WinForms
* WPF

> [!NOTE]
> The actions you take in App Center, such as adding annotations or changing the status of a crash group, will not be reflected in HockeyApp.

## Retention

To ensure your GDPR compliance, we are keeping your HockeyApp crashes retention to 28 days. If you would like to have a higher retention, you can update your App Center retention settings up to 90 days. For unlimited retention in App Center, you can [export your Diagnostics data](~/analytics/export.md) to Blob Storage.

## What is coming in Diagnostics

The team is currently working hard to improve the current experience and covering the final gaps between HockeyApp and App Center. Please see our [roadmap](~/general/roadmap.md) for what is coming next.
