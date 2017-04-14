---
title: Getting Started
description: Getting Started
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 01/20/2017
ms.topic: get-started-article
ms.assetid: 8c185dee-ae25-4582-bd7c-14163e6fe392
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: react-native
---

# React Native Getting Started

> [!div class="op_single_selector"]
> * [iOS](ios.md)
> * [Android](android.md)
> * [Xamarin](xamarin.md)
> * [React Native](react-native.md)

Let's get started with setting up the Mobile Center React Native SDK in your app to use Analytics and Crashes services.

Contents:

1. [Prerequisites](#1-prerequisites)
2. [Add Mobile Center SDK modules](#2-add-Mobile-Center-sdk-modules)
3. [Start the SDK](#3-start-the-sdk)
4. [Manually link the iOS SDK](#4-troubleshooting)
5. [List of available libraries](#5-list-of-available-libraries)

## <a name="1-prerequisites"></a>1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* An React Native project
* A device running Android Version 4.0.3 or API level 15 or higher, or iOS version 8.0 or higher.
* A project running React Native version 0.34 or higher.

## <a name="2-add-Mobile-Center-sdk-modules"></a>2. Add Mobile Center SDK modules

The Mobile Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

Below are the steps on how to integrate the each seperate SDK library with your application from npm.

### 2.1. Add the Crashes SDK

1. In a terminal window opened at the root of a React Native project, enter the following lines to add the Crashes SDK to the app:

    ```
    npm install mobile-center-crashes --save
    ```

2. Link the plugin to the React Native app using the react-native link command.

    ```
    react-native link mobile-center-crashes
    ```

    A dialogue will ask for the Android app secret, which will enable Mobile Center to map this app to the right user account. The secret may already be pre-populated, showing up beside the question. If the pre-filled secret is correct, press enter to continue.

    ```
    What is the Android app secret? (00000000-0000-0000-0000-000000000000)
    ```

    The SDK will then ask whether or not to send crash reports automatically. [Learn more about user processing on crash reports.](~/sdk/crashes/react-native.md#process-javascript)

        For the Android app, should crashes be sent automatically, or processed in javascr
        ipt before being sent? (Use arrow keys)
        ❯ Automatically
        Processed in JavaScript by user

    There will be the same set of questions for iOS.

        What is the iOS app secret? (11111111-1111-1111-1111-111111111111)

        For the iOS app, should crashes be sent automatically, or processed in javascr
        ipt before being sent? (Use arrow keys)
        ❯ Automatically
        Processed in JavaScript by user

    > **Note:** Linking the iOS SDK requires CocoaPods. If you do not have CocoaPods installed, [follow these steps](#4-troubleshooting) to link the SDK manually.

### 2.1. Add the Analytics SDK

1. In a terminal window opened at the root of a React Native project, enter the following lines to add the Crashes SDK to the app:

    ```
    npm install mobile-center-analytics --save
    ```

2. Link the plugin to the React Native app using the react-native link command.

    ```
    react-native link mobile-center-analytics
    ```

    A dialogue will ask for the Android app secret, which will enable Mobile Center to map this app to the right user account. The secret may already be pre-populated, showing up beside the question. If the pre-filled secret is correct, press enter to continue.

    ```
    What is the Android app secret? (00000000-0000-0000-0000-000000000000)
    ```

    The SDK will then ask whether or not to send user events automatically. [Learn more about manually sending user events.](~/sdk/analytics/react-native.md#enable-javascript)

        For the Android app, should user tracking be enabled automatically ? (Use arrow keys)
        ❯ Enable Automatically
        Enable in JavaScript

    There will be the same set of questions for iOS.

        What is the iOS app secret? (11111111-1111-1111-1111-111111111111)

        For the iOS app, should user tracking be enabled automatically ? (Use arrow keys)
        ❯ Enable Automatically
        Enable in JavaScript

    > **Note:** Linking the iOS SDK requires CocoaPods. If you do not have CocoaPods installed, [follow these steps](#4-troubleshooting) to link the SDK manually.

## <a name="3-start-the-sdk"></a>3. Use the SDK

Great, you are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically. Look at [Analytics](~/sdk/analytics/react-native.md) and [Crashes](~/sdk/crashes/react-native.md) section for APIs guides and walkthroughs to learn what Mobile Center can do.

## <a name="4-troubleshooting"></a>4. Manually link the iOS SDK

1. Download the [Mobile Center iOS SDK](https://github.com/Microsoft/MobileCenter-SDK-iOS/releases) and the [ReactNative Mobile Center iOS SDK](https://github.com/Microsoft/MobileCenter-SDK-React-Native/releases) frameworks provided as two zip files. Unzip the files and you will see different frameworks for each Mobile Center services and the ReactNative Mobile Center framework. 
2. Add the SDK frameworks to the project in Xcode: 
    1. Make sure the Project Navigator is visible `(⌘+1)`. Click and drag the frameworks to your project to add them to the top level within your project.
    2. A dialog will appear. Select “Create groups” and set the checkmark for “Add to targets” for your target. Then click Finish.

> **Note:** `MobileCenter.framework` is required to start the SDK. So make sure it’s added to your project, otherwise the other modules won’t work and your app won’t compile.

## <a name="5-list-of-available-libraries"></a>5. List of available libraries

 npm package name                       | Service
 --------------------------------------- | ---------------
 mobile-center-analytics        | Analytics
mobile-center-crashes          | Crashes
