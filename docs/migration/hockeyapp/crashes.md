---
title: "Diagnostics"
author: blparr
ms.author: blparr
ms.date: 10/30/2018
ms.topic: article
ms.assetid: D340D325-FB0A-4766-BCB3-5D702023D60C
ms.service: vs-appcenter
---

# Diagnostics

App Center Diagnostics is a Generally Available service that will provide insights into issues with your apps, whether they are crashes for any platforms or errors for Xamarin and Unity as well.

## HockeyApp forwarded crashes

As you might have seen, we forwarded your crashes from HockeyApp to App Center, for you to visualize them in both places. Note that the actions you take in App Center, such as adding annotations or changing the status of a crash group, will not be reflected in HockeyApp.

### Platforms supported

The HockeyApp crashes forwarding is available for the following platforms: Android, Android NDK, iOS, macOS, React Native and tvOS.

## Retention

To ensure your GDPR compliance, we are keeping your HockeyApp crashes retention to 28 days. If you would like to have a higher retention, you can update your App Center retention settings up to 90 days. For unlimited retention in App Center, you can [export your Diagnostics data](~/analytics/export.md) to Blob Storage.

## What is coming in Diagnostics

The team is currently working hard to improve the current experience and covering the final gaps between HockeyApp and App Center. These are the features that we are working on and are coming very soon:

- Search within your crash group and crash instances.
- Add a user identifier to your crashes and errors that you can search by.

If there are any HockeyApp features you are missing in App Center today that are not on this list, please, reach out to us using the blue button in the App Center portal and ask for it! Your feedback is greatly appreciated.
