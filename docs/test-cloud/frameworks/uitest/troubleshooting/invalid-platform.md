---
title: Wrong platform tests are executed in App Center
description: Sometimes the App Center Test report shows results for both platforms
keywords: Xamarin.UITest, Android, iOS, troubleshooting invalid tests, running tests
author: lucen-ms
ms.author: lucen
ms.date: 07/28/2020
ms.topic: article
ms.assetid: 989e17c5-b933-49f2-9a5f-59bc5375d9b4
---

# Wrong platform tests are executed in App Center
[!INCLUDE [Retirement announcement for App Center](../../../../includes/retirement.md)]
When you submit an App Center Test with Xamarin.UITest, you can include an Android app, or an iOS app, not both. Sometimes the App Center Test report will show results for both platforms even though only one could possibly *actually* execute.

When Xamarin.UITests are run in App Center, the framework may execute for both platforms. But, it short-circuits in a known way (by throwing a special exception) when trying to run on the "wrong" platform. This "short-circuit" is fast and happens without invoking any device interaction. We intercept that short-circuit and exclude those test results from the test report.

This all happens when you invoke the `ConfigureApp` statement, which is typically in your NUnit `[Setup]` or `AppInitializer` code. If you prevent that `ConfigureApp` statement from being executed (maybe by skipping the statement for the "wrong" platform), or surround it with a try-catch block, we won't see the special exception and will continue running the test, which probably fails immediately.

If you're having this issue, make sure your `ConfigureApp` statements are executed once for each platform, and that you're not hiding exceptions with a try-catch around it. 