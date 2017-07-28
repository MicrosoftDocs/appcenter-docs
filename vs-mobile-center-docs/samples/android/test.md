---
# required metadata

title: Test| Sample App Tutorials
description: Tutorial to test the sample Android app with Mobile Center.
keywords: mobile-center
authors: sshibu
ms.author: t-shshib
ms.date: 07/26/2017
ms.topic: article
ms.service: mobile-center
ms.custom: samples
ms.prod: .net-core
ms.assetid: 04ea1c0e-2cb1-4b55-accb-2b36066dd70c

# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]

---

# Run Included Tests with Mobile Center

### Prerequisites
 - Follow the [getting started tutorial](getting-started.md) to set up the sample app.

## Install Mobile Center Command Line Interface

1. Install [Node.js](https://nodejs.org/en/) version 6.3 or later.
2. Open the terminal and run the command below to install the Mobile Center CLI:

  ```shell
  npm install -g mobile-center-cli
  ```

3. Run the command below and follow the directions to log in to Mobile Center:

  ```shell
  mobile-center login
  ```  

## Build the project and test APK files
1. Open terminal and go to the project directory.
2. Run each of the following commands:

  ```
  ./gradlew assembleDebug
  ./gradlew assembleDebugAndroidTest
  ```

## Prepare to run tests in Mobile Center
1. Go to the **Test** service in [Mobile Center](https://mobile.azure.com/apps).
2. Click on **Start testing your app**.
3. Select the first device, the **Google Pixel XL**, and press **Select one device** at the bottom.  
4. Choose **Espresso** as the Test framework.   
5. Click **Next**.  
  ![SetUpTests](images/testSetUp.gif)


## Run the tests
1. In the **Submit** step, copy the custom command under **Running tests**.
2. Paste it into terminal while in the project directory.
3. Navigate into **sampleapp-android/app/build/outputs/apk**.
4. Copy the pathname and replace the placeholder text ```pathToEspressoBuildFolder``` in the custom command with the pathname text.
5. Copy the pathname to **app-debug-androidTest.apk** and replace the placeholder text ```pathToFile.apk``` in the custom command with the pathname text.
6. Run the command. You will see the tests begin to run.
7. In Mobile Center, click **Done** to close the panel.  
