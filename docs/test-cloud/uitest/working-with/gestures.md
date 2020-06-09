---
title: Working with gestures
description: Simulate the gestures users would make when using a mobile app.
keywords: uitest test cloud
author: oddj0b
ms.author: vigimm
reviewer: king-of-spades
ms.date: 06/08/2020
ms.topic: article
ms.assetid: 168B2E6C-086C-4CB3-A581-07B944669313
ms.service: vs-appcenter
ms.custom: test
---

# Working with gestures
Gestures are an important part of user interaction in a mobile app. Taps, swipes, and flicks allow users multiple ways to interact with an application in creative and intuitive ways. This guide discusses the APIs for Xamarin.UITest for Android and iOS. 

UITest provides a large number of APIs to simulate gestures or physical interactions with the device. Some (but not all) of these APIs are listed below:

* **IApp.DoubleTap** - does two quick taps on the first matched view.
* **IApp.DragCoordinates** - This method simulates a continuous drag between two points.
* **IApp.PinchToZoomIn** - This method will do a pinch gesture on the matched view to zoom in.
* **IApp.PinchToZoomOut** - This method will do a pinch gesture on the matched view to zoom out.
* **IApp.ScrollUp** / **IApp.ScrollDown** - Does a touch gesture that scrolls down or up.
* **IApp.SwipeLeftToRight** / **IApp.RightToLeft** - This will simulate a left-to-right or a right-to-left gesture swipe.
* **IApp.Tap** - This will tap the first matched element.
* **IApp.TouchAndHold** - This method will continuously touch view.

These APIs all take an [`AppQuery`](https://docs.microsoft.com/dotnet/api/Xamarin.UITest.Queries.AppQuery) that is used to locate the view in question. If more than one view is located by the query, then the API will act on the first view found. For example, this code snippet will double tap:

```csharp
app.DoubleTap(c=>c.Marked("save_button"))
```

See the [`AppQuery.Marked` method](https://docs.microsoft.com/dotnet/api/Xamarin.UITest.Queries.AppQuery) for details about how `Marked` works.

It's possible to match elements using a `string` instead of an `AppQuery`. These overloaded methods will use the string as a `Marked` selector to locate the view. For example `app.DoubleTap(c=>c.Marked("save_button"))` can be written as:

```csharp
app.DoubleTap("save_button")
```

> [!NOTE]
> Due to a bug in the iOS simulator, `flick`/`swipe` does not work in scroll views such as `UITableView` or `UIScrollView`.

## Scrolling the Screen to Locate Views
UITest may only interact with views that are visible on the screen. It's possible to use `IApp.ScrollUp` or `IApp.ScrollDown` to programatically scroll the view onto the screen. This methods take an `AppQuery` or a *Marked string* to reference a specific view. UITest will then scroll until the view is visible on screen. The following snippet demonstrates how to scroll down until a Save button is visible:

```csharp
app.ScrollDown("save_button")
``` 

`IApp.Scroll*` accepts a second optional parameter that will describe how UITest should simulate scrolling. The possible choices are encapsulated in the `ScrollStrategy` enum:



| Value  | Description |
|---|---|
| `ScrollStrategy.Auto`  | This is the default value. UITest will use either `Programmatically` or `Gesture` when trying to scroll. It's biased towards `Programmatically`. |
| `ScrollStrategy.Programmatically` | UITest will scroll the screen as fast as possible until the view is displayed. |
| `ScrollStrategy.Gesture` | UITest will try to mimic how a user would scroll the screen, using a series of gestures. |

