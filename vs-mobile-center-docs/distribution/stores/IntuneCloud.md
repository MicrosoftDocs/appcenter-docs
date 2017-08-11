---
title: Publish applications to Intune cloud Company Portal
description: Simplify distribution of mobile applications to the Intune cloud Company Portal
keywords: distribution store
author: girish
ms.author: girish
ms.date: 08/15/2017
ms.topic: article
ms.service: mobile-center
ms.custom: distribute
---

# Intune Cloud Company Portal Distribution 

Publish a new and upgrade existing iOS and Android applications to your Intune cloud Company Portal from Mobile Center.

### Pre-requisites

* Your company has an Intune cloud subscription. If not, you could sign up for a [trial account](https://portal.office.com/Signup/Signup.aspx?OfferId=40BE278A-DFD1-470a-9EF7-9F2596EA7FF9&dl=INTUNE_A&ali=1#0%20).
* An Intune cloud admin and tenant account activated.
* Create a [DNS CNAME](https://docs.microsoft.com/intune/custom-domain-name-configure) to simplify and customize their logon experience. When your organization signs up for a Microsoft cloud-based service like Intune, you're given an initial domain.
* Manually [add users](https://docs.microsoft.com/intune/users-add) to your Intune subscription via the [Office 365 portal](https://www.office.com/signin) or the [Azure Intune portal](https://portal.azure.com/#blade/Microsoft_Intune_DeviceSettings/ExtensionLandingBlade/overview) and give users additional permissions including global administrator and service administrator permissions.
* You need to [create groups](https://docs.microsoft.com/intune/groups-add) to organize users or devices by geographic location, department or hardware characteristics.

For more information review the [introduction to Intune](https://docs.microsoft.com/intune/introduction-intune).

[Note:] Once Intune has been set up, Mobile Center makes it simple to publish applications to the Intune cloud Company Portal.


### Step 1: Create an Intune cloud Company Portal connection in Mobile Center

1. In the Distribution beacon select **Stores** and click on **Add Connection**.  
2. Select the store type as Intune Company Portal and click **Next**. 
3. You will be redirected to Microsoft login page where you must provide your initial domain name hosted in Azure Active Directory (AD) that looks like **your-domain.onmicrosoft.com**.
4. On successful login, you will be asked to enter a **Store name**.
5. **Select Category** of the app from the drop down. 
6. For **Audience**, provide the distribution list (email-id) for sharing this application.
7. Click **Connect**.
8. An Intune cloud company portal connection has now been set up. You should be able to see a store with the name provided on the **Stores** home page. Note that creating an Intune store connection is a one time process for a specific app in Mobile Center.

### Step 2: Publish your application to the Intune cloud Company Portal.

1. From the **Stores** home page select the Intune Store created above. 
2. Click on **Publish to Store**.
3. Upload the app package. 
4. Once the package has been uploaded you should be able to see some details of the application. Click **Next**.
5. Click on **Publish** to push the app to the **Intune cloud Company Portal**. The status for this release on the store details page will show as **Submitted.**
6. Once Mobile Center has completed the hand-over of the app to Intune cloud, the status of the app will change to **Published**.
7. In case of a failure while publishing, the status will change to failed with an appropriate error message. 

For any issues, you can contact us via Intercom. 