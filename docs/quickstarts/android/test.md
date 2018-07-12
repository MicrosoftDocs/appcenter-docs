---
# required metadata

title: Run Included Tests with App Center | Android Sample App Tutorials
description: Tutorial to run a test using Android sample app with App Center.
keywords: app center
author: sshibu
ms.author: t-shshib
ms.topic: article
ms.service: vs-appcenter
ms.date: 07/26/2017
---

# Run Included Tests with App Center

### Prerequisite
- Follow the [getting started tutorial](getting-started.md) to set up the sample app.

## Install App Center Command Line Interface

1. Install [Node.js](https://nodejs.org/en/) version 6.3 or later.
2. Open the terminal and run the command below to install the App Center CLI:

   ```shell
   npm install -g appcenter-cli
   ```

3. Run the command below and follow the directions to log in to App Center:

   ```shell
   appcenter login
   ```  

## Build the project and test APK files
1. Open terminal and go to the project directory.
2. Run each of the following commands:

   ```
   ./gradlew assembleDebug
   ./gradlew assembleDebugAndroidTest
   ```

## Prepare to run tests in App Center

1. Go to the **Test** service in [App Center](https://appcenter.ms/apps).

2. Click on **Start testing your app**.

3. Select the first device, the **Google Pixel XL**, and press **Select one device** at the bottom.

4. Choose **Espresso** as the Test framework.

5. Click **Next**.  
  

## Run the tests

1. In the **Submit** step, copy the custom command under **Running tests**.

2. Paste it into terminal while in the project directory.

3. Navigate into **sampleapp-android/app/build/outputs/apk**.

4. Copy the pathname and replace the placeholder text `pathToEspressoBuildFolder` in the custom command with the pathname text.

5. Copy the pathname to **app-debug-androidTest.apk** and replace the placeholder text `pathToFile.apk` in the custom command with the pathname text.

6. Run the command. You will see the tests begin to run.

7. In App Center, click **Done** to close the panel.  
