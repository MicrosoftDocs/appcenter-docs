---
title: Build results for UWP apps
description: Build results explained in detail
keywords: build, windows
author: siminapasat
ms.author: siminap
ms.date: 05/10/2017
ms.topic: article
ms.assetid: c41b61bb-c405-4e69-9c03-b1ebc9a1c1fe
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: windows
---

# Build results

The build results give you rich information about the status of your build. You can download your successful build or only the symbols to use for crash reporting. In case of failure you can investigate the logs to solve build issues.

After a build has been triggered, it can be in the following states:

* **queued** -  the build is in a queue waiting for resources to be freed up
* **building** - the build is running and performing the predefined tasks
* **succeeded** - the build is completed and it has succeeded
* **failed** - the build has completed but it has failed; you can troubleshoot what went wrong by downloading and inspecting the build log
* **canceled** - the build has been canceled by a user action or it has timed out

### 1.1. The AppPackages

Building your app for Release will result in a folder called "AppPackages" that contains a `.appxupload` file for the store and the Test folder that contains the `.appxbundle` files for sideloading, one for each platform.

App Center always generates an app bundle. However, Debug builds are not meant to be used for sideloading. You won't get the `.appxupload` file and the provided `.appxbundle` files in the Test folder do not contain required dependencies.

### 1.2. The symbols files

The `.appxsym` files contain the debug symbols for the app. There is one symbols file for each platform your app supports.

### 1.3. Build logs

For a completed build (succeeded or failed), download the logs to understand more about how the build went. App Center provides an archive with the following files:

```NA
|-- 1_build.txt (this is the general build log)
|-- build (this folder contains a separate log file for each build step)
    |-- <build-step-1> (e.g. 2_Get Sources.txt)
    |-- <build-step-2> (e.g. 3_Pod install.txt)
    |--
    |-- <build-step-n> (e.g. n_Post Job Cleanup.txt)
```

The build step specific logs (located in the `build/` directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.