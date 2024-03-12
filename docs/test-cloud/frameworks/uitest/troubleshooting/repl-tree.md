---
title: REPL Tree command fails to give output and becomes unresponsive on complex views
description: Failure may occur when too many queryable elements are on-screen
keywords: Xamarin.UITest, REPL, writing tests
author: lucen-ms
ms.author: lucen
ms.date: 07/28/2020
ms.topic: article
ms.assetid: 089742e5-1344-4730-8699-cd9ccab01062
---

# REPL Tree command fails to give output and becomes unresponsive
[!INCLUDE [Retirement announcement for App Center](../../../../includes/retirement.md)]
This problem most frequently occurs when using WebViews. Depending on the particular page being loaded by a WebView, there may be a large number of elements for the `Repl()` tool to attempt to query. Rarely it can occur on other types of views too.

The general workaround for this scenario is to identify the main view or parent element you need more information on, and target that using AppQuery to list the details of the view's child elements. 

For example:
> app.Query(c => c.WebView()); // for a webview

If the Repl() is still unresponsive or displays too many elements, you can narrow the query through the use of either index values or targeting a different parent element.

> app.Query(c => c.WebView().Index(0));
> app.Query(c => c.SomeOtherView());