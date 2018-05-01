---
title: Working With - Web Views
description: Describes how to use the Xamarin.UITest APIs to interact with web views in a mobile app.
keywords: uitest test cloud
author: glennwester
ms.author: glwest
ms.reviewer: crdun
ms.date: 04/26/2018
ms.topic: article
ms.assetid: B9DEA1B2C-ED45-40F4-BA00-D46F982ECC5A
ms.service: vs-appcenter
ms.custom: test
---

# Working with Web Views

Xamarin.UITest provides API's for locating and interaction with views in native mobile applications. However, some mobile apps are hybrid apps that use web views to display HTML to the user. Android provides the `android.webkit.WebView`, while iOS applications may use either [UIWebView](https://developer.xamarin.com/api/type/UIKit.UIWebView/) or [WKWebView](https://developer.xamarin.com/api/type/WebKit.WKWebView/). UIWebKit is older and compatible with all versions of iOS, while WKWebKit is for iOS 8 and higher.
  
Interacting with web views is a bit more involved as UITest must first obtain a reference to the web view, and then to the DOM elements it contains.

## Web View APIs in UITest

There are two APIs to obtain a reference to a webview control in UITest:
 
* **[AppQuery.WebView](https://developer.xamarin.com/api/member/Xamarin.UITest.Queries.AppQuery.WebView()/)**  is used for `UIWebView` controls.
* **[AppQuery.Class](https://developer.xamarin.com/api/member/Xamarin.UITest.Queries.AppQuery.Class/p/System.String/)** is used for `WKWebView` controls.

Each of these will be discussed in more detail below. 

## Locating the `UIWebView` control with AppQuery.WebView
 
UITest provides the [AppQuery.WebView](https://developer.xamarin.com/api/member/Xamarin.UITest.Queries.AppQuery.WebView()/) method to obtain a reference to a `UIWebView` control.  The following snippet is an example:

```text
>>> app.Query(c=>c.WebView())       
```

If there is only one web view on the screen, then `WebView` will default to that one web view. If there are multiple web views on the screen, the [`WebView(Int32)`](https://developer.xamarin.com/api/member/Xamarin.UITest.Queries.AppQuery.WebView(System.Int32)/) can be used to isolate one by passing a zero-based index.


## Locating the `WKWebView` control

UITest provides the [AppQuery.Class](https://developer.xamarin.com/api/member/Xamarin.UITest.Queries.AppQuery.Class/p/System.String/) method to obtain a reference to a `WKWebView` control.  The following snippet is an example:

```text
>>> app.Query(c=>c.Class("WKWebView"))
```                

## Interacting with DOM Elements in a web view control

Once the web view has been isolated, there are two main API's for interacting with DOM elements:

* **CSS** &ndash; This API uses CSS selectors to locate DOM elements displayed by the web view.
* **XPath** &ndash; UITest can use XPath expressions to locate DOM elements in the web view.

The XPath API, which more powerful is also more complicated to use. In general, preference should be given to the CSS API, and the XPath API used when necessary.

### CSS

It is possible to match HTML elements using the [AppQuery.Css](https://developer.xamarin.com/api/member/Xamarin.UITest.Queries.AppQuery.Css(System.String)/) method. This method takes a CSS selector and will return an array of all HTML elements that match. Functionally, this API is the same on Android and iOS.

For example, the following Android activity contains an [`android.webkit.WebView`](https://developer.xamarin.com/api/type/Android.Webkit.WebView/):


[ ![WebView on an Android device](./images/working-with-webviews-android-01-sml.png)](./images/working-with-webviews-android-01.png#lightbox)

This snippet shows how to locate all H1 DOM elements in the web view:

```text
>>> app.Query(c=>c.Css("H1"))                                                                                
Query for Css("H1") gave 1 results.
[
    [0] {
        Id => "",
        NodeType => "ELEMENT_NODE",
        NodeName => "H1",
        Class => "",
        Html => "<h1>H1 Header!</h1>",
        Value => null,
        WebView => "webView1",
        TextContent => "H1 Header!",
        Rect => {
            Width => 1032,
            Height => 117,
            CenterX => 540,
            CenterY => 408,
            Top => 44,
            Bottom => 83,
            Left => 8,
            Right => 352,
            X => 24,
            Y => 351
        }
    }
]
```

If there is more than one web view on a given screen, then UITest will automatically default to the first web view. If there are multiple web views, then it is necessary to explicitly identify the web view using [`IApp.WebView(Int32)`](https://developer.xamarin.com/api/member/Xamarin.UITest.Queries.AppQuery.WebView(System.Int32)/). For example, if a screen had two web views and we want to find all the H1 elements in the second web view:

```text
>>> app.Query(c=>c.WebView(1).Css("H1"))                                                                                
Query for WebView().Css("H1") gave 1 results.
[
    [0] {
        Id => "",
        NodeType => "ELEMENT_NODE",
        NodeName => "H1",
        Class => "",
        Html => "<h1>H1 Header!</h1>",
        Value => null,
        WebView => "webView1",
        TextContent => "H1 Header!",
        Rect => {
            Width => 1032,
            Height => 117,
            CenterX => 540,
            CenterY => 408,
            Top => 44,
            Bottom => 83,
            Left => 8,
            Right => 352,
            X => 24,
            Y => 351
        }
    }
]
```

If more than one HTML element matches the CSS query, the `Index` method can be used to access an individual element in the result set. For example, the following snippet shows how to access the third element of HTML elements with the `.user` style:

```text
>>> app.Tap(c => c.Css(".user").Index(2));
```

### XPath

XPath is a very powerful API for searching the DOM, but can be a bit more difficult to use compared to the CSS API. UITest can locate DOM elements by an XPath selector passed to the [AppQuery.XPath](https://developer.xamarin.com/api/member/Xamarin.UITest.Queries.AppQuery.XPath(System.String)/) method. This API is the same on Android and iOS.

The following snippet is an example of how to match the H1 DOM element from the previous section using XPath:

```text
>>> app.Query(c=>c.XPath("//h1"))
Query for XPath("//h1") gave 1 results.
[
    [0] {
        Id => "",
        NodeType => "ELEMENT_NODE",
        NodeName => "H1",
        Class => "",                                                                                                   
        Html => "<h1>H1 Header!</h1>",
        Value => null,
        WebView => "webView1",
        TextContent => "H1 Header!",
        Rect => {
            Width => 1032,
            Height => 117,
            CenterX => 540,
            CenterY => 408,
            Top => 44,
            Bottom => 83,
            Left => 8,
            Right => 352,
            X => 24,
            Y => 351
        }
    }
]
```

## Invoking JavaScript

It is also possible to locate webviews using the [`AppQuery.InvokeJS`](https://developer.xamarin.com/api/member/Xamarin.UITest.Queries.AppQuery.InvokeJS/p/System.String/) method. This method takes a query in the form of, and invokes Javascript on the view elements matched by the query. If view elements other than WebViews are encountered, the execution will halt and an Exception will be thrown.

### InvokeJS on Android

Generally speaking Android requires that the Javascript `returns` the value; otherwise the query will return `null`:

```text
>>> app.Query (w => w.WebView ().InvokeJS ("document.getElementById('lastname').value"))
[
[0] "null"
]
>>> app.Query (w => w.WebView ().InvokeJS ("return document.getElementById('lastname').value"))
[
[0] "Smith"
]
```

### InvokeJS on iOS

Generally speaking, on iOS the `return` is not used:

```text
>>> app.Query (w => w.WebView ().InvokeJS ("return document.getElementById('lastname').value"))
[
[0] ""
]

>>> app.Query (w => w.WebView ().InvokeJS("document.getElementById('lastname').value"))
[
[0] "Smith"
]
```

## Examples

This section will cover some common use cases that may be encountered when writing Calabash tests involving web views.

### Scrolling

It is possible to scroll within an web view to bring DOM elements on to the screen. This is accomplished using the `IApp.ScrollDownTo` or `IApp.ScrollUpTo` methods.  The signature of these methods is very similar:

```csharp
IApp.ScrollDownTo(Func<AppQuery, AppWebQuery> toQuery,
                  string withinMarked,
                  ScrollStrategy strategy,
                  Nullable<TimeSpan> timeout)
```

Here is a quick description of the parameters:

* `toQuery` &ndash; this is a UITest web query that will locate a DOM element in the web view.
* `withinMarked` &ndash; this is a string that will located the web view on the screen. This parameter is optional if there is only one web view on the screen. This string will used by `IApp.Marked` to locate the web view on the screen.
* `strategy` &ndash; this optional parameter tells UITest how to scroll within the web view. `ScrollStrategy.Gesture` will try to emulate how a user would scroll, by dragging the screen. `ScrollStrategy.Programatic` frees up UITest to scroll in the quickest way possible. `ScrollStrategy.Auto` tells UITest to use any combination of `Gesture` and `Programatic` to scroll (with a preference to `Programatic`).
* `timeout` &ndash; an optional parameter that specifies how long UITest should wait before timing out the query.

As a example of using these API's consider the screenshots of a web view embedded in an Android application:


[ ![Screenshot showing the the WebView used in the following example.](./images/working-with-webviews-android-02-sml.png)](./images/working-with-webviews-android-02.png#lightbox)

If we examine the view hierarchy of this Activity in the REPL, we can see the following:

```text
>>> tree                                                                                                                
[[object CalabashRootView] > PhoneWindow$DecorView]                                                                     
  [ActionBarOverlayLayout] id: "decor_content_parent"
    [FrameLayout > LinearLayout] id: "content"
      [WebView] id: "webView1",  label: "Web View"
        [dom] id: "show_secret"
        [dom] id: "firstname"
        [dom] id: "lastname"
    [ActionBarContainer] id: "action_bar_container"
      [Toolbar] id: "action_bar"
        [TextView] text: "TestingWebviews.Droid"
  [View] id: "statusBarBackground"
  [View] id: "navigationBarBackground"
```

The output from the `tree` command tells us that the web view has an the ID `webView1`, and contains three DOM elements:

  * an HTML button called `show_secret` with the markup `<button id="show_secret">Toggle the Secret</button>`
  * an HTML input field `firstname`, with the markup `<input type="text" name="firstname" id='firstname'>`
  * an HTML input field `lastname`, with the markup `<input type="text" name="lastname" id='lastname'>`

The `show_secret` button is visible on the screen, but `firstname` and `lastname` are not. Before a UITest may interact with those DOM elements, it is necessary to use the scrolling API's to bring those fields into view. The following snippet from the REPL shows how to can scroll the HTML input elements into view using the `ScrollDownTo` API:

```text
>>> app.ScrollDownTo(c=>c.Css("#firstname"))                              
Scrolling down to Css("#firstname")
```

### Entering Text

To enter text into HTML input element is accomplished by providing an `AppWebQuery` and the text to enter using the [`AppQuery.EnterText`](https://developer.xamarin.com/api/member/Xamarin.UITest.IApp.EnterText(System.Func%7BXamarin.UITest.Queries.AppQuery,Xamarin.UITest.Queries.AppQuery%7D,System.String)/) API . Given the following screenshot of a web view in an Android application:


[ ![Screenshot showing the WebView used in the following example](./images/working-with-webviews-android-03-sml.png)](./images/working-with-webviews-android-03.png#lightbox)

The following code snippet will show to enter text into the `firstname` HTML input element:

```csharp
[Test]
public void ScrollDownAndEnterName()
{
  app.ScrollDownTo(c => c.Css("input#firstname"), );
  app.EnterText(c => c.Css("input#firstname"), "Monkey");		

  // A more verbose way to enter text, explicitly identifying the web view and ScrollStrategy
  app.ScrollDownTo(c => c.Css("input#lastname"), "webView1", ScrollStrategy.Gesture);
  app.EnterText(c => c.Css("input#lastname"), "Chimpanzee");

}
```
