---
title: Publish applications to Intune Company Portal
description: Simplify distribution of line of business mobile applications to the Company Portal on Intune
keywords: distribution store
author: oddj0b
ms.author: vigimm
ms.date: 11/05/2018
ms.topic: article
ms.service: vs-appcenter
ms.custom: distribute
---

# Intune Company Portal Distribution

Publish new and upgrade existing line of business(LOB) iOS and Android applications from App Center into Company Portal on your Intune Cloud instance.

## Pre-requisites

* Your organization has an Intune Cloud subscription. If not, you could sign up for a [trial account](https://docs.microsoft.com/en-us/intune/free-trial-sign-up).
* An Intune admin and tenant account activated. 
* Create a [DNS CNAME](https://docs.microsoft.com/intune/custom-domain-name-configure) to simplify and customize the logon experience. When your organization signs up for a Microsoft cloud-based service like Intune, you're given an initial domain.
* Manually [add users](https://docs.microsoft.com/intune/users-add) to your Intune subscription via the [Office 365 portal](https://www.office.com/signin) or the [Azure Intune portal](https://portal.azure.com/#blade/Microsoft_Intune_DeviceSettings/ExtensionLandingBlade/overview) and give users additional permissions including global administrator and service administrator permissions.
* You need to [create groups](https://docs.microsoft.com/intune/groups-add) to organize users or devices by geographic location, department or hardware characteristics.
* It is important to note that Azure Active Directory for a tenant acts as a security broker to enable access to sites. [Visual Studio App Center](https://appcenter.ms) will require access to the Intune graph API to enable a particular tenant's user to publish apps to the Intune Company Portal. This requires a consent to be given by the tenants Azure Active Directory (AD) global admin. To provide this consent, the global admin of your company's Azure Active Directory global admin will need to go to this [consent page](https://login.microsoftonline.com/common/adminconsent?client_id=9aa18e05-1deb-4254-98a8-fab3591a3ad3&redirect_uri=https://appcenter.ms) and agree to grant access for Visual Studio App Center to access the Intune Graph API's. The admin will then be navigated to [Visual Studio App Center](https://appcenter.ms). This is a one-time activity for a company's Active Directory global admin. Once completed, any user with the Intune app manager role, for this company, should be able to navigate to [Visual Studio App Center](https://appcenter.ms) and publish apps to the Intune Company Portal.
* For more information review the [introduction to Intune](https://docs.microsoft.com/intune/introduction-intune).

## Step 1: Create an Intune connection in App Center

1. Select **Stores** under Distribution.
2. In the middle of the page, click on the **Connect to Store** button.
3. Select the store type as Intune Company Portal and click **Next**.
4. You will be redirected to Microsoft login page where you must provide your initial domain name hosted in Azure Active Directory (AD) that looks like **your-domain.onmicrosoft.com**.
5. On successful login, you will be asked to enter a **Store name**.
6. **Select Category** of the app from the drop down.
7. For **Audience**, provide the Azure AD group (security or O365) name to distribute this application to. The early version of this feature requires the developer to know the Azure AD group that the app is being distributed to. The InTune administrator that connected App Center to the InTune Graph API in step 1.3 must be a member of the group for it to be eligible and appear in the auto-complete drop down.
8. Click **Connect**.
9. A connection to Intune Company Portal has now been set up. You should be able to see a store with the name provided on the **Stores** home page. This is a one time process for an application in App Center.

## Step 2: Publish your application to the Intune Company Portal

1. From the **Stores** home page select the Intune Store created above.
2. Click on **Publish to Store**.
3. Upload the app package.
4. Once the package has been uploaded you should be able to see some details of the application. Click **Next**.
5. Click on **Publish** to push the app to the **Intune Company Portal**. The status for this release on the store details page will show as **Processing**.
6. Once App Center has completed the hand-over of the app to Intune, the status of the app will change to **Submitted**.
7. In case of a failure while publishing, the status will change to failed with an appropriate error message.

For any issues, contact us via the [blue chat icon](https://intercom.help/appcenter/getting-started/getting-help-with-app-center) in the lower-right corner of any App Center page.
