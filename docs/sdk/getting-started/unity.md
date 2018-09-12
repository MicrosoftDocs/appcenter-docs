---
title: Get Started with Unity
description: Get started
keywords: sdk
author: jwhitedev
ms.author: jawh
ms.date: 9/11/2018
ms.topic: get-started-article
ms.assetid: 9d6f5d86-f53f-43d1-bbaf-a6f01a74bdeb
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: unity
---

# Get Started with Unity

The App Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up the App Center Unity SDK in your app to use App Center Analytics and Crashes. To add App Center Distribute to your app, please have a look at the [documentation for App Center Distribute](~/sdk/distribute/unity.md).

## 1. Prerequisites

Before you begin, please make sure that your project is set up in Unity 2017.1 or later.

The App Center SDK for Unity supports the following platforms:

* iOS (9.0 or later)
* Android (5.0/API 21 or later)
* UWP (Build 10240 or later)

Please also note that the App Center SDK for Unity is only available in C#.

## 2. Create your app in the App Center Portal to obtain the App Secret

If you have already created your app in the App Center portal, you can skip this step.

1. Head over to [appcenter.ms](https://appcenter.ms).
2. Sign up or log in and click the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
3. Enter a name and an optional description for your app.
4. Select the appropriate OS and platform depending on your project as described above.
5. Click the **Add new app** button in the bottom-right of the page.

Once you have created an app, you can obtain its **App Secret** on the **Getting Started** or **Manage App** sections of the App Center Portal.

## 3. Add the App Center SDK to your project

The App Center SDK is integrated by importing Unity Packages into your project.

### 3.1 Download the package(s)

The App Center Unity packages are downloaded from the [App Center Unity SDK GitHub page](https://github.com/Microsoft/AppCenter-SDK-Unity/releases). Download the latest release of the package(s) that you want to use. Its name should be in the format **AppCenter{Analytics/Crashes/Distribute}-v{version}.unitypackage**.

### 3.2 Import the package

Now open your Unity project. Once it is open, simply open the Unity package you just downloaded. A pop-up window should appear in your Unity project containing a list of files. Select **Import**, and the SDK will be added to your project. Do this for each package you downloaded and plan to use with your project.

## 4. Enable the SDK

### 4.1 Create an empty Game Object

App Center works as a component that you attach to a game object in the scene that your game launches into. Navigate to this scene and add an empty game object. Give it a descriptive name, such as "App Center".

### 4.2 Attach the App Center script

In the **Project** window, navigate to the "AppCenter" folder that was added to your project. Locate the script whose icon is the App Center logo, named *AppCenterBehavior*, and drag it onto your newly created game object in the **Hierarchy** window.

> [!NOTE]
You do not need to add App Center to every scene in which you wish to use it. Adding it to the first loaded scene is enough.

### 4.3 Configure App Center settings

Click on this new "App Center" object and add your app secrets to the corresponding fields in the **Inspector** window. Make sure to also check the "Use {service}" boxes for each App Center service you intend to use

![App Center script configuration](images/unity_configuration.png "App Center configuration")

> [!NOTE]
If your project does not support one of the three platforms listed in the settings, simply leave the app secret field as-is; it will have no effect. If your project supports platforms that App Center does not support, the APIs and configuration will have no effect for those platforms.

---
Great, you are all set to visualize Analytics and Diagnostics (Crash and Error) data in the portal that the SDK collects automatically.

Look at the documentation for [App Center Analytics](~/sdk/analytics/unity.md) and [App Center Crashes](~/sdk/crashes/unity.md) to learn how to customize and use more advanced functionalities for both services.

To learn how to get started with in-app updates, read the documentation for [App Center Distribute](~/sdk/distribute/unity.md).