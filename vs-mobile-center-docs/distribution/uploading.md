---
title: Upload a Build to Distribute via App Center
description: Distribute a completed build to users
keywords: distribution
author: JoshuaWeber
ms.author: JoshuaWeber
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 41c4b085-c6a1-4f82-9b70-9bc36a3b0422
ms.service: vs-appcenter
ms.custom: distribute
---

# Release a Build

In order to distribute a release via App Center, you must first upload your application binary package to App Center. App Center supports both .ipa and .apk package uploads for iOS and Android, respectively.

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

To upload a package to App Center, use the navigation bar on the left to navigate to Distirbution. Then select "Distribute new release" button. Drag and drop or click to open a file dialog to upload your package. Optionally fill in some release notes. Select next and select a Distribution Group. This release will only be available to the users that have been added to that specific Distribution Group. Click next and review the release, then click distribute to release. On clicking the distribute button the release will be made available via App Center and an email notification of the new version will be sent to all users of this application. Congrats, you have successful distributed a release via App Center.

![](images/new_release_button.png "new release button top right")

### Uploading using the APIs

1. Pre-req: [Obtain an API token][api-token-docs]. API Token is used for authentication for all App Center API calls.
2. Upload a new release. This is 3 or more API calls. 
    
    a. Create an upload resource and get an `upload_url` (good for 24 hours) — [POST /createReleaseUpload][POST_releaseUpload]
    
    ` curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' 'https://api.mobile.azure.com/v0.1/apps/JoshuaWeber/APIExample/release_uploads' `
    
    b. Upload to upload_url (will be a rink.hockeyapp.net URL). Use `multipart/form-data` where the `key` is ipa (key is always ipa even when uploading APKs)
    
    ` curl -F "ipa=@Versions_1_1_0_12.ipa" https://rink.hockeyapp.net/api/sonoma/apps/cacf9867-87f7-4649-a400-632a775dde2d/app_versions/upload\?upload_id\=c18df340-069f-0135-3290-22000b559634 `
    
    c. After upload has finished, update upload resource's status to committed and get a `release_url` — [PATCH /updateReleaseUpload][PATCH_updateReleaseUplolad]
    
    ` curl -X PATCH --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -d '{ "status": "committed"  }' 'https://api.mobile.azure.com/v0.1/apps/JoshuaWeber/APITesting/release_uploads/c18df340-069f-0135-3290-22000b559634' `

3. Distribute the uploaded release to a distribution group — [PATCH /updateRelease][PATCH_updateRelease]
    
    ` curl -X PATCH --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -d '{ "destination_name": "QA Testers", "release_notes": "Example new release via the APIs" }' 'https://api.mobile.azure.com/v0.1/apps/JoshuaWeber/APITesting/releases/2' `

[apple-ipa]: https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/TestingYouriOSApp/TestingYouriOSApp.html#//apple_ref/doc/uid/TP40012582-CH8-SW1
[apple-devices]: ./auto-provisioning.md
[google-apk]: https://developer.android.com/studio/publish/preparing.html
[gradle-config]: https://developer.android.com/studio/build/build-variants.html
[android-manifest]: https://developer.android.com/guide/topics/manifest/manifest-intro.html
[api-token-docs]: ~/api-docs/index.md
[POST_releaseUpload]: https://docs.mobile.azure.com/api/#!/distribute/createReleaseUpload
[PATCH_updateReleaseUplolad]: https://docs.mobile.azure.com/api/#!/distribute/updateReleaseUpload
[PATCH_updateRelease]: https://docs.mobile.azure.com/api/#!/distribute/updateRelease
[GET_DGs]: https://docs.mobile.azure.com/api/#!/account/distributionGroups_list
