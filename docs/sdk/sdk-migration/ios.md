---
title: App Center SDK Documentation
description: Migration to App Center SDK
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 11/15/2017
ms.topic: article
ms.assetid: 278e0ad2-2616-4a3c-907a-092b57c81e96
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: ios
dev_langs:  
 - swift
 - objc 
---

# Migrate to App Center iOS SDK v1.0.0

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)

Follow these steps to update your current preview SDK to the App Center iOS SDK v1.0.0:

## If you have integrated frameworks manually:

1. Open Finder and delete all the Mobile Center frameworks files. If they reside in their own folder, delete the whole folder. In case you have a **Vendor** folder, you can keep that.
 
2. Download the [App Center frameworks](https://github.com/Microsoft/AppCenter-SDK-Apple/releases) that are provided as a zip file.

3. Unzip the file and you will see a folder called **AppCenter-SDK-Apple/iOS** that contains different frameworks for each App Center service.

4. Copy the SDK frameworks to the folder that contained old Mobile Center frameworks in your project or workspace for all the services that you are interested in, e.g. if you had **MobileCenter.framework** and **MobileCenterCrashes.framework** inside a **Vendor** folder, the folder should now contain **AppCenter.framework** and **AppCenterCrashes.framework**.

5. Open Xcode and open the Project Navigator. It will still reference the Mobile Center framework files that you just moved to the trash. Delete the references.

6. Drag and drop the App Center frameworks from Finder into Xcode's Project Navigator where you removed the Mobile Center frameworks).

7. A dialog will appear, make sure your app target is checked. Then, click **Finish**.

8. Select your project in the Project Navigator and select the Build Settings tab. Search for the entry `Framework Search Paths`. Verify that `Framework Search Paths` does not reference the deleted Mobile Center frameworks. Delete them if they are present. Make sure the newly added App Center frameworks are referenced correctly.

## If you have integrated frameworks using Cocoapods:

1. Change the Pods in your Podfile that specifies Mobile Center to App Center. For example, replace:

    ```ruby
    pod 'MobileCenter'
    pod 'MobileCenter/Distribute'
    pod 'MobileCenter/Push'
    ```
    
    with

    ```ruby
    pod 'AppCenter'
    pod 'AppCenter/Distribute'
    pod 'AppCenter/Push'
    ```

2. Running `pod install` will remove MobileCenter Pods and install AppCenter Pods to your workspace. In case Cocoapods displays an error that says it cannot find the pods for AppCenter, run `pod repo update` before `pod install`.

## Change your SDK setup code:

This step can be done easily by globally searching for `MobileCenter` and replacing it with `AppCenter`.

1. Remove the old import statements for Mobile Center and update them with below:

    Open your **AppDelegate.m** file for Objective-C or **AppDelegate.swift** file for Swift and add the following import statements:

    ```objc
    @import AppCenter;
    @import AppCenterAnalytics;
    @import AppCenterCrashes;
    @import AppCenterDistribute;
    @import AppCenterPush;
    ```
    ```swift
    import AppCenter
    import AppCenterAnalytics
    import AppCenterCrashes
    import AppCenterDistribute
    import AppCenterPush
    ```
    
2. Remove the imports for `MobileCenter` and its modules. Replace them with their `AppCenter` equivalents.
3. Replace the `start` method API signature in your app's code:
	
    ```objc
    [MSMobileCenter start: ...]; 
    ```
    ```swift
    MSMobileCenter.start("....")
    ```
    
    with
    
    ```objc
    [MSAppCenter start: ...];
    ```    
    ```swift
    MSAppCenter.start("...")
    ```

    Do the same class name replacement for any other method call from `MSMobileCenter` that you might have.

4. Build your application in Xcode and make sure that you don’t see any compile or build time errors. Your application should now build locally.

## If you have been using Mobile Center Distribute for in-app updates

### Replace the URL scheme in your app

1. Find the key for `URL types` or `CFBundleURLTypes`(in case Xcode displays your *Info.plist* as source code) in your *Info.plist* file .
2. Find the key of the first child item for `URL Schemes` or `CFBundleURLSchemes`.
3. Replace `mobilecenter-${APP_SECRET}` with `appcenter-${APP_SECRET}` for URL scheme. `${APP_SECRET}` is the App Secret of your app.

### Remove the resource bundle

1. In the project's Project Navigator, select the resource bundle **MobileCenterDistributeResources.bundle** and delete it.
2. The folder that contains the App Center SDK also contains the new resource bundle **AppCenterDistributeResources.bundle**. Drag-n-drop it into your project's Project Navigator. A dialog pops up. Make sure that your app's target is selected.
3. Select your project in the Project Navigator, select the build phases tab and make sure the new bundle is included in the *Copy Bundle Resources* build phase. If the previously deleted **MobileCenterDistributeResources.bundle** is still part of the *Copy Bundle Resources* build phase, remove the reference. 

### If you have disabled the automatic forwarding of your application delegate's methods

If you have disabled the automatic forwarding of your application delegate's methods, you need to perform the additional steps:

1. Open your project's **Info.plist**.
2. Look for the following key: `MobileCenterAppDelegateForwarderEnabled` in **Info.plist**.
3. Change the key to `AppCenterAppDelegateForwarderEnabled`. Leave the value as is (the value should be `0`).


## If you have been using Mobile Center Push

If you haven't customized the usage of Mobile Center Push, no additional steps are necessary.

### If you have disabled the automatic forwarding of your application delegate's methods

If you have disabled the automatic forwarding of your application delegate's methods, you need to perform the additional steps:

1. Open your project's **Info.plist**.
2. Look for the following key: `MobileCenterAppDelegateForwarderEnabled` in **Info.plist**.
3. Change the key to `AppCenterAppDelegateForwarderEnabled`. Leave the value as is (the value should be `0`).
