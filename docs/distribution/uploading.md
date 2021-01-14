---
title: Distribute a build via App Center
description: Distribute a completed build to users
keywords: distribution
author: king-of-spades
ms.author: kegr
ms.date: 06/30/2020
ms.topic: article
ms.assetid: 41c4b085-c6a1-4f82-9b70-9bc36a3b0422
ms.service: vs-appcenter
ms.custom: distribute
---

# Release a Build

Upload your application binary package to App Center to distribute it. App Center supports package distribution for Android, iOS, macOS, Windows, and custom operating system apps. You can distribute releases to individual testers or groups of testers. For iOS and Android applications, you can also release to the stores like Google Play, the App Store, and Intune. See [Publish to consumer and enterprise stores](stores/index.md).

On this page you can learn how to generate the binary for release, and how to upload and release it to groups using the portal, the command-line interface (CLI), and the application programming interface (API).

## Generating an application binary package

First you must package your application into a binary file for release. You can create this file manually, or use [App Center Build](../build/index.md). You can configure Build to distribute automatically in the build configuration of a branch.

The following sections explain how to create the files for all app types App Center supports for distribution.

### Android

For Android, you must produce a signed app bundle or APK file. For full details of this process, see the official [Google documentation on preparing an app for release][google-prepare-for-release].

1. Ensure you've [updated the manifest][android-manifest] and have a correctly [configured Gradle build][gradle-config].
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

For macOS, you must produce an app package. App Center supports releasing app packages of type .app.zip, .pkg or .dmg. For full details of this process, see the official [Apple macOS documentation][apple-macos].

1. [Register a single device][apple-register-single-device] or [register multiple devices][apple-register-multiple-devices] in your Apple developer account.
2. In Xcode, go to **Product** > **Archive** to archive your app.
3. Export the archive using the proper provisioning profile.

### Windows

App Center supports releasing Windows app packages of type `.appx`, `.appxbundle`, `.appxupload`, `.msi`, `.msix`, `.msixbundle`, `.msixupload`, or `.zip`. For full details on how to package your app in AppX or MSIX formats, see the official [Microsoft UWP documentation][uwp-package].

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

### Distributing using the API
You can call the App Center API to distribute a release. The approach below is intended to describe a minimal working approach, many of the tasks can be further customized or automated.

#### Prerequistes
- The App package to upload and distribute.
- [Obtain an API token][api-token-docs]. An API Token is used for authentication for all App Center API calls.
- The Distribution Group ID
- Identify the `{owner_name}` and `{app_name}` for the app that you wish to distribute a release for. These will be used in the URL for the API calls. For an app owned by a user, the URL in App Center might look like: <https://appcenter.ms/users/Example-User/apps/Example-App>. Here, the `{owner_name}` is `Example-User` and the `{app_name}` is `Example-App`. For an app owned by an org, the URL might be <https://appcenter.ms/orgs/Example-Org/apps/Example-App> and the `{owner_name}` would be `Example-Org`.
 
#### Upload New Release
1. Upload a new release using three sequential API calls:
    1. Create an upload resource and get an `upload_url` (good for 24 hours):
        The endpoint to call is [POST /v0.1/apps/{owner_name}/{app_name}/uploads/releases][POST_releaseUpload]

        ```shell
        OWNER_NAME="Example-Org"
        APP_NAME="Example-App"
        
        curl -X POST "https://api.appcenter.ms/v0.1/apps/$OWNER_NAME/$APP_NAME}/uploads/releases" -H  "accept: application/json" -H  "X-API-Token: $API_TOKEN" -H  "Content-Type: application/json"
        ```
        
        The result will look something like this, with `{VARIABLE_NAME}` replacing data unique to each use:
        ```json
        {
            "id": "{RELEASES_ID}",
            "package_asset_id": "{PACKAGE_ASSET_ID}",
            "upload_domain": "https://file.appcenter.ms",
            "token": "{TOKEN}",
            "url_encoded_token": "{URL_ENCODED_TOKEN}"
        }
        ```
        
    2. Copy the parameters from the response in the previous step, as most of them are used in the next step, including the `package_asset_id`, `upload_domain` & `url_encoded_token`. 

    You must also determine the `MIME Type` for the `content_type` based on your app:
        - **Android** uses vendor type `application/vnd.android.package-archive`
        - **iOS** uses general type `application/octet-stream`

    You also must determine the filesize of your app package in bytes. It's recommended to use a command such as `wc -c ExampleApp.ipa` to get an accurate byte count.

    The final command should look something like this:
    
    ```shell
    FILE_SIZE_BYTES=(wc -c "ExampleApp.apk" | awk '{print $1}')
    APP_TYPE=`application/vnd.android.package-archive` # Android
    # APP_TYPE=`application/octet-stream`   # iOS
    
    $METADATA_URL="https://file.appcenter.ms/upload/set_metadata/$PACKAGE_ASSET_ID?file_name=$FILE_NAME&file_size=$FILE_SIZE_BYTES&token=$URL_ENCODED_TOKEN&content_type=$APP_TYPE"

     curl -s -d POST -H "Content-Type: application/json" -H "Accept: application/json" -H "X-API-Token: $API_TOKEN" "$METADATA_URL"
     ```
    
    The output returned should look something like this:
    ```json
    {
        "error":false,
        "id":"{UPLOAD_ID}",
        "chunk_size":4194304,
        "resume_restart":false,
        "chunk_list":[1,2,3,4,5],
        "blob_partitions":1,
        "status_code":"Success"
    }
    ```


    3. Using the `chunk_size` value, you can split your app upload into sequential chunks for upload to Distribute. For example, you can use the `split` utility like so:
    ```bash
        split -b $CHUNK_SIZE $APP_PACKAGE temp/split
    ```

    This command generates sequential files in the `temp` directory named `splitaa`, `splitab` and so on, so that each file is within the `chunk_size` limit. 

    4. Next you need to upload each chunk of the split app package with the respective block:

    ```shell
    BLOCK_NUMBER=0
    
    for i in temp/*
    do
        BLOCK_NUMBER=$(($BLOCK_NUMBER + 1))
        CONTENT_LENGTH=(wc -c i | awk '{print $1}')
        
        $UPLOAD_CHUNK_URL="https://file.appcenter.ms/upload/upload_chunk/$PACKAGE_ASSET_ID?token=$URL_ENCODED_TOKEN&block_number=$BLOCK_NUMBER"
    
        curl -X POST $UPLOAD_CHUNK_URL --data-binary "@$i" -H "Content-Length: $CONTENT_LENGTH" -H "Content-Type: $CONTENT_TYPE"
    done
    ```
    
    5. After the upload has finished, update the upload resource's status to `committed` and get a `release_id` for the next step.
        ```shell
        FINISHED_URL="https://file.appcenter.ms/upload/finished/$PACKAGE_ASSET_ID?token=$URL_ENCODED_TOKEN"
        
        curl -d POST -H "Content-Type: application/json" -H "Accept: application/json" -H "X-API-Token: $API_TOKEN" "$FINISHED_URL"
        
        COMMIT_URL="https://api.appcenter.ms/v0.1/apps/$OWNER_NAME/$APP_NAME/uploads/releases/$UPLOAD_ID"
        curl -H "Content-Type: application/json" -H "Accept: application/json" -H "X-API-Token: $API_TOKEN" \
        --data '{"upload_status": "uploadFinished","id": "$ID"}' \
        -X PATCH \
        $COMMIT_URL
        ```
        
    6. Finally, release the build. The endpoint to call is [PATCH /v0.1/apps/{owner_name}/{app_name}/release_uploads/{upload_id}][PATCH_updateReleaseUpload]
        
        ```shell
        RELEASE_STATUS_URL="https://api.appcenter.ms/v0.1/apps/$OWNER_NAME/$APP_NAME/uploads/releases/$UPLOAD_ID"
        
        curl -s -H "Content-Type: application/json" -H "Accept: application/json" -H "X-API-Token: $API_TOKEN" $RELEASE_STATUS_URL
        ```
        
        
        
2. Distribute the uploaded release to testers, groups, or stores. You can't see the release in the App Center portal until you do this. The three endpoints are:
    - [POST /v0.1/apps/{owner_name}/{app_name}/releases/{release_id}/testers][POSTtesters]
    - [POST /v0.1/apps/{owner_name}/{app_name}/releases/{release_id}/groups][POSTgroups]
    - [POST /v0.1/apps/{owner_name}/{app_name}/releases/{release_id}/stores][POSTstores]

    An example for groups:

    ```shell
    curl -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "X-API-Token: $API_TOKEN" -d "{ \"id\": "$DISTRIBUTION_GROUP_ID", \"mandatory_update\": false, \"notify_testers\": false}" 
    ```
    You can find the distribution group ID on that group's settings page.

The request to distribute to multiple destinations is referenced here for more complex scenarios: [PATCH /v0.1/apps/{owner_name}/{app_name}/releases/{release_id}][PATCH_updateRelease]

## Re-Release a build
To release a build to another distribution group, from any place in App Center go to **Distribute** > **Releases** and then select the release you want to distribute again. The release details page opens. Select the **Distribute** button in the upper right-hand corner of the screen and select the destination to start the re-release process. Follow the steps in the wizard and finally select **Distribute** to send the release to groups/testers or the store.

## Mandatory Updates

Make a release mandatory to force all users to run the same version of your app. When you do this, App Center will install the selected update on all tester devices.

You can only make a release mandatory if your app uses the App Center Distribute SDK. Make a release mandatory via the API or by selecting the **Mandatory update** checkbox in the review stage of distributing a release.

For mandatory releases, App Center displays a red dot next to the release icon in your releases table under a selected distribution group.

## Link to Releases

Once you've released successfully, your testers can access the release through email, logging in to App Center, or through a direct link.

You can find links to specific releases on the release page for private destinations.
![Install button](~/distribution/images/installButton.png)

You can find links to specific releases to public destinations on the releases tab in public groups.
![Public deep link](~/distribution/images/publicDeepLink.png)

[apple-ipa]: https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/TestingYouriOSApp/TestingYouriOSApp.html#//apple_ref/doc/uid/TP40012582-CH8-SW1
[google-prepare-for-release]: https://developer.android.com/studio/publish/preparing.html
[gradle-config]: https://developer.android.com/studio/build/build-variants.html
[android-manifest]: https://developer.android.com/guide/topics/manifest/manifest-intro.html
[api-token-docs]: ~/api-docs/index.md
[appcenter-cli]: https://github.com/Microsoft/appcenter-cli
[POST_releaseUpload]: https://openapi.appcenter.ms/#/distribute/releases_createReleaseUpload
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
