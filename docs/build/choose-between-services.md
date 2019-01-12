---
title: Choose the right service for app builds
description: Helps user choose between Visual Studio AppCenter and Azure DevOps Pipelines for Building their mobile Apps.  
keywords: build
author: manb-msft
ms.author: manb
ms.date: 12/17/2018
ms.topic: article
ms.assetid: c7d77240-3a2c-4e0f-9724-20f67dbba6c6
ms.service: vs-appcenter
---

# Choose the right service for app builds

The choice on whether to use [Visual Studio App Center](https://visualstudio.microsoft.com/app-center/) or [Azure DevOps Pipelines](https://azure.microsoft.com/en-in/services/devops/pipelines/) requires some thought. There are some scenarios where one service might suit your needs better than the other.  
 
The following questions should help you make an informed decision on which service works best for you. 
 
## <a name="app-center"/> App Center

If you answer “Yes” to these questions, App Center is a good choice for you.   

**1. Do you want to set-up quick builds for your app, skip configuring build servers locally, avoid complicated configurations and code that builds on a coworker's machine but not yours?**

To [get started](https://docs.microsoft.com/en-us/appcenter/build/),

1. Log into App Center at [https://appcenter.ms](https://appcenter.ms).
2. Select the application project you want to build.
3. Open build settings, and connect the App Center app to a cloud-hosted source control system (Azure DevOps, GitHub, Bitbucket).
4. Select the repository where the app's source code is located.
5. Set up the desired branch to be built. 
  
**2. Is your app fairly simple, without many customizations, and is the build pretty straightforward?**

In App Center, if your app follows the usual standard layout on the respective platform and does not rely on a lot of external build steps, App Center finds the app automatically in your repository and builds it right away. We take care of creating the steps/tasks that builds the app on [Cloud Build Machines](https://docs.microsoft.com/en-us/appcenter/build/software). 

All we need to know is the app you want us to build, from the repositories hosted on Azure DevOps, Bitbucket or GitHub.
 
> [!TIP]
> We still offer you a way to do some customizations during build, using [Build Scripts!](https://docs.microsoft.com/en-us/appcenter/build/custom/scripts/) 

**3. Do you want to have a true/continuous Build,Test and Distribute flow from a Single Service?**
 
App Center lets you not only build the app, but can also execute [launch tests](https://docs.microsoft.com/en-us/appcenter/build/build-test-integration) and distribute to Alpha/Beta Testers and [App Stores](https://docs.microsoft.com/en-us/appcenter/build/build-to-store) as part of the build. 
 
**4. Do you use the [App Center Diagnostics](https://docs.microsoft.com/en-us/appcenter/diagnostics/) SDK in your app (especially for iOS apps?)**
 
When building your app using the App Center Build service, the corresponding debug symbol files (`dSYM` and source map `.zip` files, for iOS apps) will already be forwarded to the App Center Diagnostics service, so you don't need to manually obtain the symbol files and upload them to the diagnostics service as detailed in the [App Center Diagnostics documentation](https://docs.microsoft.com/en-us/appcenter/diagnostics/symbolication#uploading-symbols). 
  
**5. Do you want to manage all things related to your App in one central place?**
 
App Center brings together multiple services commonly used by mobile developers into an integrated cloud solution. Developers use App Center to Build, Test, and Distribute applications. Once the app's deployed, developers monitor the status and usage of the app using the Analytics and Diagnostics services and engage with users using the Push service. 

> [!NOTE]
> If you feel we are missing something critical from App Center Build, you can always reach out and let us know by using the blue chat icon in the lower-right corner of every App Center page.

## <a name="azure-devops"/>Azure DevOps

If you answer “Yes” to these questions, Azure DevOps Pipelines may be the best tool for you. 

**1. Did you want to Build other apps (Web apps, non – UWP apps, for instance)?**
  
You should stick to Azure DevOps. App Center only supports the OS/Platforms and services as mentioned in our [Platform Service Matrix page](https://docs.microsoft.com/en-us/appcenter/general/platform-service-matrix)

**2. Are you ready to [create your own Build Pipeline](https://docs.microsoft.com/en-us/azure/devops/pipelines/get-started/pipelines-get-started?toc=/azure/devops/pipelines/toc.json&bc=/azure/devops/boards/pipelines/breadcrumb/toc.json&view=vsts), create/use existing [tasks](https://github.com/Microsoft/azure-pipelines-tasks) specific to your Mobile app/Platform/Framework?**
  
If your app is fairly complex, with a lot of customizations, and/or uses a framework that’s not supported by App Center, or if you have any special requirements currently not served by App Center, such as special signing considerations for your Android app, for instance, Azure DevOps Pipelines will work out best for you.
  
> [!NOTE]
> If you feel App Center should be supporting a Platform/framework, don’t hesitate to reach out to us, and let us know by using the blue chat icon in the lower-right corner of every App Center page.

**3. Have you invested already in Azure DevOps Pipelines for your Build needs in your Organization?**
 
If you already have a billing plan set for Azure DevOps Pipelines, because your organization is already using it for other application needs (like Web apps) you should probably continue using Azure DevOps for Build.  
 
Billing is not shared between Azure DevOps and App Center. The pipelines you purchased for Azure DevOps cannot be used with App Center. 
  
Your team might also be used to Azure DevOps Pipelines, and would like to continue using the service for builds, in this case, Azure DevOps might be better for you.   

> [!TIP]
> If you still want to use App Center Features as part of Build, you can use [Distribute](https://docs.microsoft.com/en-us/appcenter/distribution/vsts-deploy) and [Test](https://docs.microsoft.com/en-us/appcenter/test-cloud/vsts-plugin) tasks created for Azure DevOps Pipelines! 


