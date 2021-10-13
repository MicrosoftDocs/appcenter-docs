---
author: lucen-ms
ms.author: lucen
ms.date: 09/13/2021
ms.topic: include
ms.tgt_pltfrm: ios
---

If you don't want to use Cocoapods, you can integrate the modules by copying the binaries into your project. Follow the steps below:

[!INCLUDE [xcframework support](../../getting-started/includes/xcframeworks.md)]

1. Download the [App Center SDK](https://github.com/Microsoft/AppCenter-SDK-Apple/releases) frameworks provided as a zip file.

2. Unzip the file and you'll see a folder called **AppCenter-SDK-Apple/iOS** that contains different frameworks for each App Center service. The framework called `AppCenter` is required in the project as it contains code that's shared between the different modules.

3. [Optional] Create a subdirectory for 3rd-party libraries.
   * As a best practice, 3rd-party libraries are usually inside a subdirectory, often called **Vendor**. If your project isn't organized with a subdirectory for libraries, create a **Vendor** subdirectory now.
   * Create a group called **Vendor** inside your Xcode project to mimic the file structure on disk.

4. Open Finder and copy the unzipped **AppCenter-SDK-Apple/iOS** folder into your project's folder at the location where you want it.

5. Add the SDK framework to the project in Xcode:
   * Make sure the Project Navigator is visible (⌘+1).
   * Now drag and drop **AppCenter.framework**, **AppCenterDistribute.framework**, and **AppCenterDistributeResources.bundle** from the Finder (the ones inside the **Vendor** folder) into Xcode's Project Navigator. **AppCenter.framework** is required to start the SDK. Make sure it's added to your project, otherwise the other modules won't work, and your project won't compile successfully.
   * A dialog will appear, make sure your app target is checked. Then click **Finish**.