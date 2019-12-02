---
author: asb3993
ms.service: vs-appcenter
ms.topic: include
ms.date: 12/02/2019
ms.author: amburns
---

#### Visual Studio for Mac

* Open Visual Studio for Mac.
* Click **File** > **Open** and choose your solution.
* In the solution navigator, right click the **Packages** section, and choose **Add NuGet packages...**.
* Search for **App Center**, and install **App Center Push**.
* Click **Add Packages**.

#### Visual Studio for Windows

* Open Visual Studio for Windows.
* Click **File** > **Open** and choose your solution.
* In the solution navigator, right-click **References** and choose **Manage NuGet Packages**.
* Search for **App Center**, and install **Microsoft.AppCenter.Push**.

#### Package Manager Console

* Open the console in [Visual Studio](https://visualstudio.microsoft.com/vs/). To do this, choose **Tools** > **NuGet Package Manager** > **Package Manager Console**.
* If you're working in **Visual Studio for Mac**, make sure you have **NuGet Package Management Extensions** installed. For this, choose **Visual Studio** > **Extensions**, search for **NuGet** and install, if necessary.
* Type the following command in Package Manager Console:

```shell
Install-Package Microsoft.AppCenter.Push
```

> [!NOTE]
> If you use the App Center SDK in a portable project (such as **Xamarin.Forms**), you must install the packages in each of the projects: the portable, Android, and iOS ones. To do that, you should open each sub-project and follow the corresponding steps described in [Visual Studio for Mac](#visual-studio-for-mac) or [Visual Studio for Windows](#visual-studio-for-windows) sections.

> [!NOTE]
> If your Android project does not target the Mono framework version 9.0 or higher, you will not be able to install the package.
> You can safely bump this version in **Options > General > Target framework** as this has no impact on minimum API level or target API level fields.
