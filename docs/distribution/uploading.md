---
title: Upload a Build to Distribute via App Center
description: Distribute a completed build to users
keywords: distribution
author: JoshuaWeber
ms.author: JoshuaWeber
ms.date: 03/20/2019
ms.topic: article
ms.assetid: 41c4b085-c6a1-4f82-9b70-9bc36a3b0422
ms.service: vs-appcenter
ms.custom: distribute
---

# Release a Build

Upload your application binary package to App Center to release it. App Center supports package uploads for iOS, Android, UWP, and macOS.

## Generating an application binary package

### iOS

For iOS, you must produce an IPA package for your application. For full details of this process, see the official [Apple documentation][apple-ipa].

1. [Register UDIDs][apple-devices] for all hardware devices in your provisioning profile
2. Archive your application. In Xcode go to **Product > Archive**
3. Export the archive using the proper provisioning profile

### Android

For Android, you must produce a properly signed apk file. For full details of this process, see the official [Google APK documentation][google-apk].

1. Ensure you have [updated the manifest][android-manifest] and have a properly [configured Gradle build][gradle-config]
2. Build the APK. From Android Studio, select the build variant and then execute command **Build > Build APK**

> [!NOTE]
> Android studio places built APKs in *project-name*/*module-name*/build/outputs/apk/

### UWP

For UWP, you must produce an app package. For full details of this process, see the official [Microsoft UWP documentation][uwp-package]

### macOS 

For macOS, you must produce an app.zip file. For full details of this process, see the official [Apple MacOS documentation][apple-macos]

1. Register all hardware devices in your developer account.
2. Archive your app. In Xcode go to **Product > Archive**
3. Export the archive using the proper provisioning profile. 

## Uploading the package

To upload a package to App Center, navigate to the app, go to **Distribute -> New release -> Upload your package**. 
![Distributing a new release](~/distribution/images/distribution_new-release-button.png)

You can include optional release notes as a part of your release. Both plain text and markdown formats are supported. 
Your release can be targeted to multiple [groups][groups] or testers. This release will only be available to the users are a part of the selected groups and testers. 

![Setting release destinations](~/distribution/images/releaseDestination.jpg)

If you are releasing an iOS app, you have the option to [automatically provision your tester's devices][auto-provisioning].
Click next and review the release. If you integrated with the [distribute SDK][sdk], you can make releases mandatory. 

When releases are distributed, App Center will send an email notification of the new version to all testers set in the destinations. You can choose to not notify testers in the review tab. 


### Uploading using the App Center Command Line Interface

As an alternative to uploading from the App Center site, you can also upload your release using the `appcenter distribute release` command in the [App Center CLI][appcenter-cli].

### Uploading using the APIs

One other alternative for uploading releases is using the public App Center APIs.

1. Pre-req: [Obtain an API token][api-token-docs]. An API Token is used for authentication for all App Center API calls.
2. Identify the `{owner_name}` and `{app_name}` for the app that you wish to upload to. These will be used in the URL for the API calls. For an app owned by a user, the URL in App Center might look like: https://appcenter.ms/users/JoshuaWeber/apps/APIExample. Here, the `{owner_name}` is `JoshuaWeber` and the `{app_name}` is `ApiExample`. For an app owned by an org, the URL might be <https://appcenter.ms/orgs/Microsoft/apps/APIExample> and the `{owner_name}` would be `Microsoft`.
3. Upload a new release. This is done using 3 sequential API calls.

    a. Create an upload resource and get an `upload_url` (good for 24 hours) — [POST /v0.1/apps/{owner_name}/{app_name}/release_uploads][POST_releaseUpload]

    ```shell
    curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' 'https://api.appcenter.ms/v0.1/apps/JoshuaWeber/APIExample/release_uploads'
    ```

    b. Copy the `upload_url` (will be a rink.hockeyapp.net URL) from the response in the previous step, and also save the `upload_id` for the step after this one. Upload to `upload_url` using a POST request. Use `multipart/form-data` as the Content-Type, where the `key` is `ipa` (key is always IPA even when uploading Android APKs) and the `value` is `@/path/to/your/build.ipa`.

    ```shell
     curl -F "ipa=@Versions_1_1_0_12.ipa" https://rink.hockeyapp.net/api/sonoma/apps/cacf9867-87f7-4649-a400-632a775dde2d/app_versions/upload\?upload_id\=c18df340-069f-0135-3290-22000b559634
     ```

    c. After the upload has finished, update upload resource's status to committed and get a `release_url`, save that for the next step — [PATCH /v0.1/apps/{owner_name}/{app_name}/release_uploads/{upload_id}][PATCH_updateReleaseUpload]

    ```shell
    curl -X PATCH --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -d '{ "status": "committed"  }' 'https://api.appcenter.ms/v0.1/apps/JoshuaWeber/APITesting/release_uploads/c18df340-069f-0135-3290-22000b559634'
    ```

4. Distribute the uploaded release to a distribution group — [PATCH /v0.1/apps/{owner_name}/{app_name}/releases/{release_id}][PATCH_updateRelease]

    ```shell
    curl -X PATCH --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -d '{ "destination_name": "QA Testers", "release_notes": "Example new release via the APIs" }' 'https://api.appcenter.ms/v0.1/apps/JoshuaWeber/APITesting/releases/2'
    ```

## Re-Release a build

To release a build to another distribution group, navigate to the release details page either through the Releases tab on the distribution group page, or from the Releases page in the left sidebar menu. Click on the **Distribute** button in the upper right-hand corner of the screen to initiate the re-release process. After selecting the destinations and reviewing the release details, click the **Distribute** button to send the release to testers.  

## Mandatory Updates

There are often cases when you want a set of users all running the same version of your app. In order to do so, you can elect to make a release mandatory. Doing so automatically installs the selected update on all tester devices.

To make a release mandatory, the app must integrate with the App Center distribute SDK. Once you've integrated with the distribute SDK, you can make a release mandatory via API or checking the mandatory checkbox in the review stage of distributing a release. 

For mandatory releases, you will see a red dot next to the release icon in your releases table under a selected distribution group.

[apple-ipa]: https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/TestingYouriOSApp/TestingYouriOSApp.html#//apple_ref/doc/uid/TP40012582-CH8-SW1
[apple-devices]: ./auto-provisioning.md
[google-apk]: https://developer.android.com/studio/publish/preparing.html
[gradle-config]: https://developer.android.com/studio/build/build-variants.html
[android-manifest]: https://developer.android.com/guide/topics/manifest/manifest-intro.html
[api-token-docs]: ~/api-docs/index.md
[appcenter-cli]: https://github.com/Microsoft/appcenter-cli
[POST_releaseUpload]: https://openapi.appcenter.ms/#/distribute/releaseUploads_create
[PATCH_updateReleaseUpload]: https://openapi.appcenter.ms/#/distribute/releaseUploads_complete
[PATCH_updateRelease]: https://openapi.appcenter.ms/#/distribute/releases_update
[uwp-package]: https://docs.microsoft.com/en-us/windows/uwp/packaging/
[apple-macos]: https://help.apple.com/xcode/mac/current/#/dev295cc0fae
[groups]: https://docs.microsoft.com/en-us/appcenter/distribution/groups
[auto-provisioning]: https://docs.microsoft.com/en-us/appcenter/distribution/auto-provisioning
[sdk]: https://docs.microsoft.com/en-us/appcenter/sdk/
