---
# required metadata

title: Getting Started | Sample App Tutorials
description: Getting started prerequisites to onboard an Android application in Mobile Center
keywords: mobile-center
authors: sshibu
ms.author: t-shshib
ms.date: 07/26/2017
ms.topic: article
ms.service: mobile-center
ms.custom: samples
ms.prod: .net-core
ms.assetid: fe5544b6-b243-4e9b-90db-09911e0557c6

# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]

---


# Getting Started by Creating App and Codesigning

In this tutorial, you will learn how to set up a sample Android app with Mobile Center.

### Prerequisite Steps
- Create [GitHub account](https://github.com/join).
- [Download Android Studio](https://developer.android.com/studio/index.html) and [install it on your local machine](https://developer.android.com/studio/install.html).

## Login to Github and fork the repository
1. Login to your [GitHub account](https://github.com/join).
2. Access the [sample app's GitHub repository](https://github.com/MobileCenter/sampleapp-android).
3. Click **Fork** at the top right hand corner of the page.


## Sign in to Mobile Center
1. Open the [Mobile Center portal](https://mobile.azure.com).
2. Click **Connect with GitHub** and log in, or use another provider.

## Create a new app in Mobile Center
1. Click **Add new app**.
2. Name the app **Sample Android App**.
3. Choose **Android** and **Java** respectively.
4. Click **Add new app**.  
  ![Make a new app](images/MakeAndroidApp.gif)

## Replace the App Secret

In order for the sample app to send information to Mobile Center, the app secret must be changed to match the one provided for your specific Mobile Center project.

1. Navigate to **Settings** in Mobile Center.
2. Copy the **App Secret** at the top of the page.
  ![Make a new app](images/AppSecret.jpg)
3. Go into the **sampleapp_android** repository and navigate into **MainActivity.java**, located in /app/src/main/java/com/example/mobilecenter/sampleapp_android.
4. In **MainActivity.java**, locate the following:
```
@Override
protected void onCreate(Bundle savedInstanceState) {
        MobileCenter.start(getApplication(), "<APP SECRET HERE>",
                Analytics.class, Crashes.class);
```
*Note: You can locate the code snippet above on the Getting Started page in the Mobile Center portal.* 
5. Replace  `<APP SECRET HERE>` with your unique app secret.
6. **Add, commit, and push changes to your forked repository.** This can be done from the terminal, or a tool of your choice.

## Sign the Android Package Kit (APK)

*This section is optional, but recommended.*

In order to run tests, distribute the app to users, and send push notifications, the APK must be digitally signed with a certificate. After creating an App ID for the sample app, follow the steps below to manually sign the APK. To learn what a digital certificate is, or for signing options other than the one outlined below, refer to the [Android Developer Documentation](https://developer.android.com/studio/publish/app-signing.html#sign-auto).

  1. Open Android Studio and click **Open an existing Android Studio project**.
  2. Navigate to the forked sample app repository location on your machine and upload it to Android Studio.
  3. Go to **Build Variants** in the leftmost panel and click it.
  4. Make sure that the build variant is set to release.
  3. Go to **Build > Generate Signed APK** from the menu bar.
  4. Leave **Module: app** and click Next.
  5. In **Key store path**, click **Create new...** and create the keystore as per the following image from the [Android Developer Documentation](https://developer.android.com/studio/publish/app-signing.html#sign-auto):
      ![Make a new app](images/newKeystore.png)
  6. Click **OK**. The **Key store password**, **Key alias** and **Key password** should automatically fill in with the information from your new keystore. Click Next.
  7. Select a destination for the signed APK, make sure **Build Type** is set to **release**, and select both signature versions **V1** and **V2**. Click Finish.
  8. Gradle should automatically begin to build. After everything syncs up, you should find your signed APK in the specified destination folder.
  8. **Add, commit, and push changes to your forked repository.**
