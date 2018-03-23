---
title: Working With Gestures
description: Simulate the gestures users would make when using a mobile app.
keywords: uitest test cloud
author: glennwester
ms.author: glwest
ms.reviewer: crdun
ms.date: 01/10/2018
ms.topic: article
ms.assetid: 168B2E6C-086C-4CB3-A581-07B944669313
ms.service: vs-appcenter
ms.custom: test
---

# Working With Gestures

Gestures are an import part of user interaction in a mobile app. Taps, swipes, and flicks allow users multiple ways to interact with an application in creative and intuitive ways. This guide discusses the API's for calabash-android and calabash-ios. 

UITest provides a very large number of API's to simulate gestures or physical interactions with the device. Some (but not all) of these API's are listed below:

* **IApp.DoubleTap** &ndash; Performs two quick taps on the first matched view.
* **IApp.DragCoordinates** &ndash; This method simulates a continous drag between two points.
* **IApp.PinchToZoomIn** &ndash; This method will perform a pinch gesture on the matched view to zoom in.
* **IApp.PinchToZoomOut** &ndash; This method will perform a pinch gesture on the matched view to zoom out.
* **IApp.ScrollUp** / **IApp.ScrollDown** &ndash; Performs a touch gesture that scrolls down or up.
* **IApp.SwipeLeftToRight** / **IApp.RightToLeft** &ndash; This will simulate a left-to-right or a right-to-left gesture swipe.
* **IApp.Tap** &ndash; This will tap the first matched element.
* **IApp.TouchAndHold** &ndash; This method will continuously touch view.

These API's all take an [`AppQuery`](/api/type/Xamarin.UITest.Queries.AppQuery/) that is used to locate the view in question. If more than one view is located by the query, then the API will act on the first view found. For example, this code snippet will double tap 

```csharp
app.DoubleTap(c=>c.Marked("save_button"))
```     
Please see the [`AppQuery.Marked`](/api/member/Xamarin.UITest.Queries.AppQuery.Marked/) method for details about how `Marked` works.

Starting with UITest 0.8.0, it is possible to match elements using a `string` instead of an `AppQuery`. These overloaded methods will use the string as a `Marked` selector to locate the view. For example `app.DoubleTap(c=>c.Marked("save_button"))` can be written as:

```csharp
app.DoubleTap("save_button")
```

> [!NOTE]
> Due to a bug in the iOS simulator, `flick`/`swipe` does not work in scroll views such as `UITableView` or `UIScrollView`.

## Scrolling the Screen to Locate Views

UITest may only interact with views that are visible on the screen. It is possible to use `IApp.ScrollUp` or `IApp.ScrollDown` to programatically scroll the view onto the screen. This methods take an `AppQuery` or a *Marked string* to reference a specific view. UITest will then scroll until the view is visible on screen. The following snippet demostrates how to scroll down until a Save button is visible:

```csharp
app.ScrollDown("save_button")
``` 

`IApp.Scroll*` accepts a second optional parameter that will describe how UITest should simulate scrolling. The possible choices are encapsulated in the `ScrollStrategy` enum:

| Value | Description |
| --- | --- |
| `ScrollStrategy.Auto` | This is the default value. UITest will use either 
`Programmatically` or `Gesture` when trying to scroll. It
is biased towards `Programmatically`. |
| `ScrollStrategy.Programmatically` | UITest will scroll the screen as fast as 
possible until the view is displayed. |
| `ScrollStrategy.Gesture` | UITest will try to mimic how a user would scroll
 the screen, using a series of gestures. |