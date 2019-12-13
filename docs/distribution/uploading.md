---
title: Distribute a build via App Center
description: Distribute a completed build to users
keywords: distribution
author: botatoes
ms.author: bofu
ms.date: 12/12/2019
ms.topic: article
ms.assetid: 41c4b085-c6a1-4f82-9b70-9bc36a3b0422
ms.service: vs-appcenter
ms.custom: distribute
---

# Release a Build

Upload your application binary package to App Center to distribute it. App Center supports package distribution for Android, iOS, macOS, Windows, and custom operating system apps. You can distribute releases to groups of testers or individual testers. For iOS and Android applications, you can also release to the stores like Google Play, the App Store and Intune. See [Publish to consumer and enterprise stores](stores/index.md).

On this page you can learn how to generate the binary for release, and how to upload and release it to groups using the portal, the command-line interface (CLI), and the application programming interface (API).

## Generating an application binary package

First you have to package your application into a binary file for release. You can create this file manually, or use [App Center Build](../build/index.md). You can configure Build to distribute automatically in the build configuration of a branch.

The following sections explain how to create the files for all app types App Center supports for distribution.

### Android

For Android, you must produce a signed app bundle or APK file. For full details of this process, see the official [Google documentation on preparing an app for release][google-prepare-for-release].

1. Ensure you have [updated the manifest][android-manifest] and have a correctly [configured Gradle build][gradle-config].
2. In Android Studio, choose **Build** > **Generate Signed Bundle / APK** and follow the steps in the wizard to build the app bundle or APK.

Android Studio places built app bundles in *project-name*/*module-name*/build/outputs/bundle/ and APKs in *project-name*/*module-name*/build/outputs/apk/.

> [!NOTE]
> You can only distribute Android app bundles to the Google Play Store, not to groups or individual testers.

### iOS

For iOS, you must produce an IPA package for your application. For full details of this process, see the official [Apple documentation][apple-ipa].

1. [Register UDIDs][auto-provisioning] for all hardware devices in your provisioning profile.
2. In Xcode, go to **Product** > **Archive** to archive your app.
3. Export the archive using the proper provisioning profile.

### macOS

For macOS, you must produce an app package. App Center supports releasing app packages of type .app.zip, .pkg or .dmg. For full details of this process, see the official [Apple MacOS documentation][apple-macos].

1. [Register a single device][apple-register-single-device] or [register multiple devices][apple-register-multiple-devices] in your Apple developer account.
2. In Xcode, go to **Product** > **Archive** to archive your app.
3. Export the archive using the proper provisioning profile.

### Windows

App Center supports releasing Windows app packages of type .appx, .appxbundle, .appxupload, .msi, .msix, .msixbundle, .msixupload, or .zip. For full details on how to package your app in AppX or MSIX formats, see the official [Microsoft UWP documentation][uwp-package].

### Custom operating system

Archive your build for apps with a custom operating system in .zip format.

## Distributing the package

To distribute a package with App Center, go to [App Center][app-center-home], go to your app, then go to **Distribute** > **Groups** and select **New release**. Follow the steps in the wizard.
![Distributing a new release](~/distribution/images/distribution_new-release-button.png)

In the first step, choose the **Release** area to browse for the file you want to upload, or drag and drop the file onto the area. Depending on the operating system of your app and the file extension, App Center may ask you to enter a version and build number for your release. Enter the information and choose **Next**.

You can include release notes as a part of your release, both in plain text or Markdown format. Choose **Next**.

You can target your release at multiple [distribution groups][groups] or testers. App Center makes this release available to those testers and the users who are part of the selected groups. Choose **Next**.

![Setting release destinations](~/distribution/images/releaseDestination.jpg)

When releasing an iOS app, you can [automatically provision your testers' devices][auto-provisioning]. Choose **Next**.

Review the release. If your app uses the [Distribute SDK][sdk], then you can configure App Center to make the release mandatory. When App Center distributes a release, it sends an email notification of the new version to all testers set in the destinations. You can choose not to notify testers in the review tab. Finally, choose **Distribute** to release the file to your testers.

### Distributing using the App Center command-line interface

Distribute your release using the `appcenter distribute release` command in the [App Center CLI][appcenter-cli]. The following example command distributes a file called `~/releases/my_app-23.ipa` to the group `Beta testers` of the app `My-App` owned by `David`.

```shell
appcenter distribute release --app David/My-App --file ~/releases/my_app-23.ipa --group "Beta testers"
```

### Distributing using the APIs

You can call the App Center API to distribute a release.

1. Prerequisite: [Obtain an API token][api-token-docs]. An API Token is used for authentication for all App Center API calls.
2. Identify the `{owner_name}` and `{app_name}` for the app that you wish to distribute a release for. These will be used in the URL for the API calls. For an app owned by a user, the URL in App Center might look like: <https://appcenter.ms/users/JoshuaWeber/apps/APIExample.> Here, the `{owner_name}` is `JoshuaWeber` and the `{app_name}` is `APIExample`. For an app owned by an org, the URL might be <https://appcenter.ms/orgs/Microsoft/apps/APIExample> and the `{owner_name}` would be `Microsoft`.
3. Upload a new release using three sequential API calls:
    1. Create an upload resource and get an `upload_url` (good for 24 hours). This call takes three body parameters:
        - `release_id` is optional and normally not needed. You can only use this to specify the ID of an already existing release, to change that release its binary. This value must be a number, so don't use quotes or it will be a string.
        - `build_version` is only used for certain releases. At the time of writing, these are macOS .pkg and .dmg files, and Windows or custom operating system .zip or .msi files. It becomes the version of your release for macOS, or the build number of your release for Windows and custom operating system apps.
        - `build_number` is only used for certain releases. At the time of writing, these are macOS .pkg and .dmg files. It becomes the build number of your release.

        The endpoint to call is [POST /v0.1/apps/{owner_name}/{app_name}/release_uploads][POST_releaseUpload]

        ```shell
        curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' 'https://api.appcenter.ms/v0.1/apps/JoshuaWeber/APIExample/release_uploads'
          ```

    2. Copy the `upload_url` (it will be a rink.hockeyapp.net URL) from the response in the previous step, and also save the `upload_id` for the step after this one. Upload to `upload_url` using a POST request. Use `multipart/form-data` as the Content-Type, where the `key` is always `ipa` (even when uploading other file types) and the `value` is `@/path/to/your/build.ipa`.

        ```shell
          curl -F "ipa=@Versions_1_1_0_12.ipa" https://rink.hockeyapp.net/api/sonoma/apps/cacf9867-87f7-4649-a400-632a775dde2d/app_versions/upload\?upload_id\=c18df340-069f-0135-3290-22000b559634
        ```

    3. After the upload has finished, update the upload resource's status to `committed` and get a `release_id`. Save that for the next step.

        The endpoint to call is [PATCH /v0.1/apps/{owner_name}/{app_name}/release_uploads/{upload_id}][PATCH_updateReleaseUpload]

        ```shell
        curl -X PATCH --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -d '{ "status": "committed"  }' 'https://api.appcenter.ms/v0.1/apps/JoshuaWeber/APIExample/release_uploads/c18df340-069f-0135-3290-22000b559634'
        ```

4. Distribute the uploaded release to testers, groups, or stores. You can't see the release in the App Center portal until you do this. The three endpoints are:

    - [POST /v0.1/apps/{owner_name}/{app_name}/releases/{release_id}/testers][POSTtesters]
    - [POST /v0.1/apps/{owner_name}/{app_name}/releases/{release_id}/groups][POSTgroups]
    - [POST /v0.1/apps/{owner_name}/{app_name}/releases/{release_id}/stores][POSTstores]

    An example for groups:

    ```shell
    curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header 'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -d '{ "id": "10d82aa2-8449-499f-b6d3-44a855058eca", "mandatory_update": false, "notify_testers": false }' 'https://api.appcenter.ms/v0.1/apps/JoshuaWeber/APIExample/releases/2/groups'
    ```

    You can find the distribution group ID on that group's settings page.

The request to distribute to multiple destinations is referenced here for more complex scenarios  — [PATCH /v0.1/apps/{owner_name}/{app_name}/releases/{release_id}][PATCH_updateRelease]

## Re-Release a build

To release a build to another distribution group, from any place in App Center go to **Distribute** > **Releases** and then select the release you want to distribute again. The release details page opens. Select the **Distribute** button in the upper right-hand corner of the screen and select the destination to start the re-release process. Follow the steps in the wizard and finally select **Distribute** to send the release to groups/testers or the store.

## Mandatory Updates

Make a release mandatory to force all users to run the same version of your app. When you do this, App Center will install the selected update on all tester devices.

You can only make a release mandatory if your app uses the App Center Distribute SDK. Make a release mandatory via the API or by selecting the **Mandatory update** checkbox in the review stage of distributing a release.

For mandatory releases, App Center displays a red dot next to the release icon in your releases table under a selected distribution group.

[apple-ipa]: https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/TestingYouriOSApp/TestingYouriOSApp.html#//apple_ref/doc/uid/TP40012582-CH8-SW1
[google-prepare-for-release]: https://developer.android.com/studio/publish/preparing.html
[gradle-config]: https://developer.android.com/studio/build/build-variants.html
[android-manifest]: https://developer.android.com/guide/topics/manifest/manifest-intro.html
[api-token-docs]: ~/api-docs/index.md
[appcenter-cli]: https://github.com/Microsoft/appcenter-cli
[POST_releaseUpload]: https://openapi.appcenter.ms/#/distribute/releaseUploads_create
[POSTtesters]: https://openapi.appcenter.ms/#/distribute/releases_addTesters
[POSTgroups]: https://openapi.appcenter.ms/#/distribute/releases_addDistributionGroup
[POSTstores]: https://openapi.appcenter.ms/#/distribute/releases_addStore
[PATCH_updateReleaseUpload]: https://openapi.appcenter.ms/#/distribute/releaseUploads_complete
[PATCH_updateRelease]: https://openapi.appcenter.ms/#/distribute/releases_update
[uwp-package]: https://docs.microsoft.com/windows/uwp/packaging/
[apple-macos]: https://help.apple.com/xcode/mac/current/#/dev295cc0fae
[groups]: https://docs.microsoft.com/appcenter/distribution/groups
[auto-provisioning]: ./auto-provisioning.md
[sdk]: https://docs.microsoft.com/appcenter/sdk/
[app-center-home]: https://appcenter.ms/apps
[apple-register-single-device]: https://help.apple.com/developer-account/#/dev40df0d9fa
[apple-register-multiple-devices]: https://help.apple.com/developer-account/#/devebd34abb1
