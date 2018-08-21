---
title: Publish to Google Play Store
description: Simplify distribution of mobile applications to the Google Play store 
keywords: distribution store
author: oddj0b
ms.author: vigimm
ms.date: 08/21/2018
ms.topic: article
ms.service: vs-appcenter
ms.custom: distribute
---

# Publish to Google Play Store

Publish an update to Google Play Store, including the Alpha and Beta tracks from App Center. 

## Prerequisites

* Google requires the first version of your Google Play application to be published to production through the Google console.
* A Google Play Developer account. If you do not have one, you can sign-up at the [developer account portal](https://play.google.com/apps/publish/signup).
* For App Center to create a Google Store connection and to access Google API's on your behalf, you will need to make sure that you have an API project and a Service account, a one time process.
* Review [prerequisites for Beta and Alpha](https://developer.android.com/distribute/best-practices/launch/beta-tests.html) for more information on these tracks.

For more information, review [How to use the Google Play console](https://support.google.com/googleplay/android-developer/answer/6112435?hl=en).

## Linking your API Project

Before you can access the API, you must link your Google Play Console to an API project. In most cases, we recommend that you create a new API project, although current API users can link to an existing API project. Keep in mind that each API project can only be linked to a single Google Play Console account.

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

**Using a service account**

You can also create a [Google service account](https://developers.google.com/accounts/docs/OAuth2ServiceAccount) to access the API from a build server without providing your personal user credentials:

Go to the [Google API Access page](https://play.google.com/apps/publish/#ApiAccessPlace) on the Google Play Console.

  ![Google Play: configuring API access](~/distribution/images/image1.png)
 
Under **Service Accounts**, click the **Create Service Account** button.

  ![Google Play: Create a service account button highlighted](~/distribution/images/image2.png)
 
Follow the instructions on the dialog to create your service account.

  ![Google Play: Create Service Account instructions](~/distribution/images/image3.png)
 
In the instructions, click the link to the [Google API Console](https://play.google.com/apps/publish/#ApiAccessPlace). On the page, the opens, click the **CREATE SERVICE ACCOUNT** button.

  ![Google Play: Service Accounts](~/distribution/images/image4.png)

The **Create service account** dialog opens.

  ![Google Play: Create Service Account Dialog](~/distribution/images/image5.png)
 
Choose a name for the new Service Account, and click the **Select a role** drop-down menu. Select **Project**, then **Owner** (full access to the integration).
 
  ![Google Play: Service Account Role Selection](~/distribution/images/image6.png)
 
Select (check) **Furnish a new private key**, then select the **JSON Key Type** option.

  ![Google Play: Furnish Private Key](~/distribution/images/image7.png)

Click the **Create** button to complete the service account creation. Since you have chosen a JSON Key Type, a file with a `.json` extension downloaded on your system; this file is required to publish your application.

Once you've created the service account on the Google Developers Console, click **Done**. The [API Access](https://play.google.com/apps/publish/#ApiAccessPlace) page automatically refreshes, and your service account will be listed.

  ![Google Play: Service Account Created](~/distribution/images/image8.png)

Click **Grant Access** to provide the service account the necessary rights to perform actions. You should now be able to access the API through the service account. For more information on OAuth 2.0, review [Using OAuth 2.0 for Server to Server Applications](https://developers.google.com/accounts/docs/OAuth2ServiceAccount).

The following steps explain how to set up the connection between App Center and Google Play.

## Step 1: Create a Google Play connection in App Center

1. Click on **Stores** under Distribution in the left-hand menu. 
2. Click on **Add Connection** in the upper right-hand corner.
3. Select **Google Play** store.
4. Click on **Next**.
5. Upload the **private key JSON** file which you downloaded while creating the service account. If the JSON fields are edited to incorrect values, the store creation might fail. Make sure you have the service account linked to your Google Play Developer console as per the [prerequisite section above](#prerequisites).
6. Once the file is uploaded, click **Connect**.
7. A Google Play connection should now be visible with the three tracks, Production, Alpha, and Beta in the **Stores** home page. Setting up this connection is a one time process for an app in App Center.

## Step 2: Publish your APK to the Google Play Store

1. From the **Stores** home page select any of the tracks created above.
2. Click on **Publish to Store** on the button in the upper right-hand corner.
3. Upload the app package. A few points to note:
   * Application type should be correct and signed with a valid key store before uploading.
   * Google Play Store supports application packages up to a maximum of 100 MB. If the application exceeds 100 MB, use the Expansion files to support the application package by uploading those directly in the google play developer console as we currently don't support Expansion files in App Center. Review [Expansion files](https://support.google.com/googleplay/android-developer/answer/2481797?hl=en).
   * The .apk must be [zipaligned](https://developer.android.com/studio/command-line/zipalign.html) during the app-building process.
   * The version of the .apk must be strictly greater than the current version in production.
   * If you have app versions in other tracks like Alpha and Beta, your release version should be strictly less than versions in alpha and Beta track versions.
   * Google API currently does not support promoting an app from one track to another. Hence App Center does not support promoting a version from alpha to beta or beta to production.
4. After uploading your package, you should be able to see some details of the application. Click **Next**.
5. Click on **Publish** to push the app to the **Google Play Store**. The status for this release on the store details page will show as **Submitted.**
6. Once App Center has completed the hand-over of the app to Google, the status of the app will change to **Published.** Note that Google could take up to 24 hours to show up the app on the Play store.
7. In case of a failure with publishing by Google, app owner will receive a notification to the registered google mail.
