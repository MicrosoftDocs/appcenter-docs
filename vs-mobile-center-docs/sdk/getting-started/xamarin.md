# Xamarin Getting Started

> [!div class="op_single_selector"]
- [iOS](ios)
- [Android](android)
- [Xamarin](xamarin)
- [React Native](react-native)

Let's get started with setting up Mobile Center Xamarin SDK in your app to use Analytics and Crashes services.

Contents:

1. [Prerequisites](#1-prerequisites)
2. [Supported Platforms](#2-supported-platforms)
3. [Setup](#3-setup)
4. [Start the SDK](#4-start-the-sdk)

## 1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* A project setup in Xamarin Studio or Xamarin for Visual Studio.
* You are not using other crash services on the same mobile app.

## 2. Supported Platforms

We support the following platforms:

* Xamarin.iOS
* Xamarin.Android
* Xamarin.Forms (iOS and Android)

* Xamarin.iOS
  Choose this option if you want to use Xamarin only in iOS application. You need to create one app in Mobile Center portal with OS as `iOS` and platform as `Xamarin`.
* Xamarin.Android
  Choose this option if you want to use Xamarin only in Android application. You need to create one app in Mobile Center portal with OS as `Android` and platform as `Xamarin`.
* Xamarin.Forms (iOS and Android)
  Choose this option if you want to create cross platform app in iOS and Android. You need to create two apps in Mobile Center - one for each OS and select platform as `Xamarin`.

## 3. Setup

Mobile Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in. If you'd like to get started with just Analytics or Crashes, include their packages in your app. For each iOS, Android and Forms project, add the `Mobile Center Analytics` and `Mobile Center Crashes` packages.

### For Xamarin Studio

#### For Xamarin.iOS and Xamarin.Android

* Navigate to the Project -> 'Add NuGet Packages...'
* Search for 'Mobile Center' and select "Mobile Center Analytics" and "Mobile Center Crashes". Then Click 'Add Packages'

#### For Xamarin.Forms

Multiplatform Xamarin.Forms app has three projects in your solution - portable class library or shared library, project.Droid, project.iOS . You need to add NuGet packages to each of these projects.

* Navigate to the Project -> 'Add NuGet Packages...'
* Search for 'Mobile Center' and select "Mobile Center Analytics" and "Mobile Center Crashes". Then Click 'Add Packages'

### For Xamarin for Visual Studio

* Navigate Project -> Manage NuGet Packages...
* Search for 'Mobile Center' and select "Mobile Center Analytics" and "Mobile Center Crashes". Then Click 'Add Packages'

## Using Package Manager Console ##

* Make sure Package Manager Console is opened in either Xamarin Studio or Visual Studio. You will have to install an add-in for Xamarin Studio.
* Type the following commands:
   PM> Install-Package Microsoft.Azure.Mobile.Analytics
   PM> Install-Package Microsoft.Azure.Mobile.Crashes


Now that you've integrated the SDK in your application, it's time to start the SDK and make use of Mobile Center services.

## 4. Start the SDK

To start the Mobile Center SDK in your app, follow these steps:

1. **Add using statements:** Add the appropriate namespaces befor eyou get started with using our APIs.

    **Xamarin.iOS** - Open AppDelegate.cs file and add the lines below the existing using statements

    **Xamarin.Android** - Open MainActivity.cs file and add the lines below the existing using statements

    **Xamarin.Forms** - Open App.xaml.cs file in your shared project and add these using statements

        using Microsoft.Azure.Mobile;
        using Microsoft.Azure.Mobile.Analytics;
        using Microsoft.Azure.Mobile.Crashes;

2. **Start the SDK:** Mobile Center provides developers with two modules to get started – Analytics and Crashes. In order to use these modules, you need to opt in for the module(s) that you'd like, meaning by default no module is started and you will have to explicitly call each of them when starting the SDK.

    **Xamarin.iOS**

    Open AppDelegate.cs file and add the Start API in FinishedLaunching() method

        MobileCenter.Start("{Your Xamarin iOS Secret}", typeof(Analytics), typeof(Crashes));

    **Xamarin.Android**

    Open MainActivity.cs file and add the Start API in OnCreate() method

        MobileCenter.Start("{Your Xamarin Android App Secret}", typeof(Analytics), typeof(Crashes));

    **Xamarin.Forms**

     For creating a cross platform Forms app targeting both iOS and Android platform, you need to create two applications in Mobile Center portal - one for each platform. Creating two apps will give you two AppSecrets - one for iOS and another for Android. Therefore, Start SDK call is split into two methods for Xamarin.Forms. Open App.xaml.cs file in your shared project and add the API below in the `App()` constructor.

        MobileCenter.Start(typeof(Analytics), typeof(Crashes));

     In the iOS project of the Forms app, open AppDelegate.cs and add the API in `FinishedLaunching()` method. Make sure you call the API before `LoadApplication()` method is called.

        MobileCenter.Configure("{Your Xamarin iOS App Secret}");

     In the Droid project of the Forms app, open MainActivity.cs and add the API in `OnCreate()` method. Make sure you call the API before `LoadApplication()` method is called.

        MobileCenter.Configure("{Your Xamarin Android App Secret}");

    You can also copy paste the code from the Getting Started page on Mobile Center portal once your app is selected. It already includes the App Secret so that all the data collected by the SDK corresponds to your application. Make sure to replace {Your App Secret} text with the actual value for your application.

    The example above shows how to use the Start() method and include both the Analytics and Crashes module. If you wish not to use Analytics, remove the parameter from the method call above. Note that, unless you explicitly specify each module as parameters in the start method, you can't use that Mobile Center service. Also, the Start() API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the modules included in the first call will be available.
