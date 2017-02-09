---
title: Upload a Build to Distribute via Mobile Center
description: Distribute a completed build to users
keywords: distribution
author: JoshuaWeber
ms.author: JoshuaWeber
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 41c4b085-c6a1-4f82-9b70-9bc36a3b0422
ms.service: mobile-center
---

# Release a Build

In order to distribute a release via Mobile Center, you must first upload your application binary package to Mobile Center. Mobile Center supports both .ipa and .apk package uploads for iOS and Android, respectively.

## Generating an application binary package

### iOS

You will need to use the following steps to generate an IPA package for your application. For full details of this process please see the official [Apple documentation][apple-ipa].

1. [Register UDIDs][apple-devices] for all hardware devices in your provisioning profile.
2. Archive your application. In Xcode go to **Product > Archive**
3. Export the archive using the proper provisioning profile. Make sure to remember where the IPA file was placed on disk.

### Android

For Android you will need to produce a properly signed apk file. For full details of this process please see the official [Google documentation][google-apk].

1. Ensure you have [updated the manifest][android-manifest] and have a properly [configured Gradle build][gradle-config].
2. Build the APK. From Android Studio select the build variant and then execute command **Build > Build APK**.

> [!NOTE]
> Android studio places built APKs in *project-name*/*module-name*/build/outputs/apk/

## Uploading the package

To upload a package to Mobile Center, use the navigation bar on the left to navigate to Distirbution. Then select "Distribute new release" button. Drag and drop or click to open a file dialog to upload your package. Optionally fill in some release notes. Select next and select a Distribution Group. This release will only be available to the users that have been added to that specific Distribution Group. Click next and review the release, then click distribute to release. On clicking the distribute button the release will be made available via Mobile Center and an email notification of the new version will be sent to all users of this application. Congrats, you have successful distributed a release via Mobile Center.

![](images/new_release_button.png "new release button top right")

[apple-ipa]: https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/TestingYouriOSApp/TestingYouriOSApp.html#//apple_ref/doc/uid/TP40012582-CH8-SW1
[apple-devices]: https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingProfiles/MaintainingProfiles.html#//apple_ref/doc/uid/TP40012582-CH30-SW10
[google-apk]: https://developer.android.com/studio/publish/preparing.html
[gradle-config]: https://developer.android.com/studio/build/build-variants.html
[android-manifest]: https://developer.android.com/guide/topics/manifest/manifest-intro.html
