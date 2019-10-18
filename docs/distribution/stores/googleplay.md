---
title: Publish to Google Play Store
description: Simplify distribution of mobile applications to the Google Play store
keywords: distribution store
author: oddj0b
ms.author: vigimm
ms.date: 10/18/2019
ms.topic: article
ms.service: vs-appcenter
ms.custom: distribute
ms.assetid: 8c034e61-7fc5-4dea-9722-242a2d01ee1f
---

# Publish to Google Play Store

Publish an update to Google Play Store, including the Alpha and Beta tracks from App Center.

## Prerequisites

* Google requires the first version of your Google Play application to be published to production through the Google console.
* A Google Play Developer account. If you do not have one, you can sign up at the [Google developer account portal](https://play.google.com/apps/publish/signup).
* Ensure that you have an API project and a Service account for App Center to create a Google Store connection and to access Google APIs on your behalf.
* Review [prerequisites for Beta and Alpha](https://developer.android.com/distribute/best-practices/launch/beta-tests.html) for more information on these tracks.
* Set up App signing by Google to publish Android App bundles (AAB) files.

For more information, review [How to use the Google Play console](https://support.google.com/googleplay/android-developer/answer/6112435?hl=en).

## Linking your API Project

To access the Google API, you must link your Google Play Console to a Google API project. In most cases, we recommend that you create a new API project, although current API users can link to an existing API project. Keep in mind that each API project can only be linked to a single Google Play Console account.

**Creating a new API project**

* Go to the [Google API Access page](https://play.google.com/apps/publish/#ApiAccessPlace) on the Google Play Console.
* Accept the Terms of Service.
* Click on **Create new project**.
* An API project is automatically generated and linked to your Google Play Console.

**Using an existing API project**

* If you are already a user of the Google Play Developer API, you can link to your existing API project by following these steps. If the API project to link to is not listed, verify that your Google Play Console account is designated as an Owner, and the Google Play Developer API is enabled.
* Go to the [Google API Access page](https://play.google.com/apps/publish/#ApiAccessPlace) on the Google Play Console.
* Accept the API Terms of Service.
* Choose the project you would like to link.
* Click on **Link**.

## Setting Up API Access Clients

One of the added benefits of creating a [Google service account](https://developers.google.com/accounts/docs/OAuth2ServiceAccount) is access to the API from a build server without providing your personal user credentials, below is a step-by-step guide on how to set up Google service account:

Go to the [Google API Access page](https://play.google.com/apps/publish/#ApiAccessPlace) on the Google Play Console.

  ![Google Play: configuring API access](~/distribution/images/image1.png)

Under **Service Accounts**, click the **Create Service Account** button to begin the process.

  ![Google Play: Create a service account button highlighted](~/distribution/images/create-service-account.jpg)

In the instructions, click the link to the [Google API Console](https://play.google.com/apps/publish/#ApiAccessPlace).

  ![Google Play: Create Service Account instructions](~/distribution/images/image3.png)

Click the **CREATE SERVICE ACCOUNT** button, on the newly opened page.

  ![Google Play: Service Accounts](~/distribution/images/image4.png)

The **Create service account** page opens.

  ![Google Play: Create Service Account Dialog](~/distribution/images/image5.png)

Choose a name for the new Service Account, and click **Create**.

![Google Play: Choose Project -> Owner as role](~/distribution/images/image6.png)

Click the **Select a role** in the drop-down menu. Select **Project**, then **Owner**. Navigate to the next step by clicking **Continue**.

On the new page click **+ Create Key (optional)** and a modal appears.

![Google Play: Click + Create Key to generate a JSON file](~/distribution/images/image7.png)

Select **JSON** and click **CREATE** and a file with the `.json` extension will download to your system; this file will be used in App Center to establish the connection to Google Play.

![Google Play: Set key type as JSON](~/distribution/images/image8.png)

Once you've created the service account on the Google Developers Console, click **Done**. The [API Access](https://play.google.com/apps/publish/#ApiAccessPlace) page automatically refreshes, and your service account will be listed.

![Google Play: Service Account Created](~/distribution/images/image9.png)

Close the window and the new service account shows on the original page. Click the **Grant Access** button to complete the process. In the next section, you will learn how to connect App Center with Google Play.

![Google Play: Original screen with new service account](~/distribution/images/image10.png)

## Set up app signing by Google

1. Select your app in the [Google Play Developer Console](https://play.google.com/apps/publish/)
2. Expand **Release management** in the left-hand menu
3. Select **App signing**
4. You can choose between three options:
	1. Upload a key exported from Android Studio
	2. Export and upload a key from a Java keystore
	3. Export and upload a key (not using a Java keystore)

![Google Play: Set up app signing](~/distribution/images/image11.png)

5. Click **finish**

## Create a Google Play connection in App Center

1. Click on **Stores** under Distribution in the left menu.
2. In the middle of the page, click on the **Connect to Store** button.
3. Select **Google Play** store.
4. Click on **Next**.
5. Upload the **private key JSON** file, which you downloaded while creating the service account. If the JSON fields are edited to incorrect values, the store creation might fail. Make sure you have the service account linked to your Google Play Developer console as per the [prerequisite section above](#prerequisites).
6. Once the file is uploaded, click **Connect**.
7. A Google Play connection should now be visible with the three tracks, Production, Alpha, and Beta in the **Stores** home page. Setting up this connection is a one time process for an app in App Center.

## Publish your AAB to the Google Play Store

1. From the **Stores** home page, select any of the tracks created above.
2. Click on **Publish to Store** on the button in the upper-right corner.
3. Upload the app package. A few points to note:
   * [Application must be prepared for release](https://developer.android.com/studio/publish/#publishing-prepare) and signed with a valid key store before uploading.
   * Google Play Store supports android app bundles up to a maximum of 2 GB. Apks generated from the aab cannot exceed 150 MB. You can read more about [your options at Google's docs for AAB](https://developer.android.com/guide/app-bundle/).
   * The version of the .aab must be strictly greater than the current version in production.
   * If you have app versions in other tracks like Alpha and Beta, your release version should be strictly less than versions in Alpha and Beta track versions.
   * App Center currently does not support promoting an app from one track to another. You cannot promote a version from alpha to beta or beta to production.
   * If you have a draft release in the track you will publish to, that draft release will disappear in favor of the new release you publish.
4. After uploading your package, you can see some details of the application. Click **Next**.
5. Click on **Publish** to push the app to the **Google Play Store**. The status for this release on the Distribute Store Details page will show as **Submitted.**
6. Once App Center has completed the handover of the app to Google, the status of the app will change to **Published**. Google could take up to 24 hours to show the app in the Play store.
7. In case publishing by Google fails, the app owner receives a notification to the registered Google mail.

## Publish your APK to the Google Play Store

1. From the **Stores** home page, select any of the tracks created above.
2. Click on **Publish to Store** on the button in the upper-right corner.
3. Upload the app package. A few points to note:
   * [Application must be prepared for release](https://developer.android.com/studio/publish/#publishing-prepare) and signed with a valid key store before uploading.
   * Google Play Store supports application packages up to a maximum of 100 MB. If the application exceeds 100 MB, use the Expansion files to support the application package by uploading those directly in the Google Play Developer Console as we currently don't support Expansion files in App Center. Review [Expansion files](https://support.google.com/googleplay/android-developer/answer/2481797?hl=en).
   * The .apk must be [zipaligned](https://developer.android.com/studio/command-line/zipalign.html) during the app-building process.
   * The version of the .apk must be strictly greater than the current version in production.
   * If you have app versions in other tracks like Alpha and Beta, your release version should be strictly less than versions in alpha and Beta track versions.
   * App Center currently does not support promoting an app from one track to another. You cannot promote a version from alpha to beta or beta to production.
   * If you have a draft release in the track you will publish to, that draft release will disappear in favor of the new release you publish.
4. After uploading your package, you can see some details of the application. Click **Next**.
5. Click on **Publish** to push the app to the **Google Play Store**. The status for this release on the Distribution Store Details page will show as **Submitted.**
6. Once App Center has completed the handover of the app to Google, the status of the app will change to **Published**. Google could take up to 24 hours to show the app in the Play store.
7. In case publishing by Google fails, the app owner receives a notification to the registered Google mail.

## Publishing through the CLI
Using the CLI is an easy way to integrate the App Center's store connection as part of your CI/CD setup like Jenkins or Go CI.

Before you can use the CLI, you will need to establish a connection to a destination, i.e., Google Play, App Store, or Intune in the App Center. And compile a binary that complies with your destination.

You can list your stores by using the list command like this:
```
appcenter distribute stores list \
--app {app_owner}/{app_name} \
--output json
```

You will get a result like this:
```
[["Alpha","googleplay","alpha"],["Beta","googleplay","beta"],["Production","googleplay","production"]
```

And it's the Store column we will use in the final step.

The final step is to publish your app by running:
```
appcenter distribute stores publish \
--file /path/to/file.aab \
--store Production \
--app {app_owner}/{app_name} \
--release-notes "Some note."
```

You will need to fill in the blanks like the list command. Instead of having a static release note, it's possible to use the `--release-notes-file` instead. A release note file is plain text file encoded with UTF-8.
