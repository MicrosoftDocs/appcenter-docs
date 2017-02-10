---
title: Azure Active Directory
description: Using Active Directory with Azure and Mobile Center
keywords: azure, identity
author: adrianhall
ms.author: adrianha
ms.date: 01/20/2017
ms.topic: article
ms.assetid: ef7b487b-6365-4882-b3a7-6fe84ffa9c14
ms.service: mobile-center
ms.custom: identity
---

# Configure Azure Active Directory

You will need:
* Your Mobile Center app secret, which you can find at by going to _Mobile Center_ > _your app_ > _Getting Started_ > _Manage app_ > _App secret_.

### Register your application with Azure Active Directory

1. Sign in to the [Azure classic portal], and go to _Active Directory_ > _your directory_ > _Applications_ tab.

2. Click _ADD_ at the bottom to create a new app registration, and click _Add an application my organization is developing_.

3. In the _Add Application Wizard_, use the following parameters to add the app:
    * _Name_: app name
    * _Type_: _Web Application And/Or Web API_
    * _Sign-on URL_: _https://mobile-{app id}.azurewebsites.net_
    * _App ID URI_: _https://mobile-{app id}.azurewebsites.net_

    The URI that is needed for the Sign-on URL and App ID URL is displayed in the Identity page.

4. Once the application has been added, click the _Configure_ tab. Edit the _Reply URL_ under _Single Sign-on_ to be _https://mobile-{app id}.azurewebsites.net/.auth/login/aad/callback_ (note the HTTPS).

5. Click _Save_. Then copy the _Client ID_ for the app.

6. In the bottom command bar, click _View Endpoints_, and then copy the _Federation Metadata Document URL_ and download that document or navigate to it in a browser.

7. Within the root _EntityDescriptor_ element, there will be an _entityID_ attribute of the form _https://sts.windows.net/_ followed by a GUID specific to your tenant (called a "tenant ID"). Copy this value - it will serve as your _Issuer URL_.

### Configure Identity for Azure Active Directory authentication

1. In [Mobile Center], go to _Identity_, and click on _Azure Active Directory_.

2. Enter the _Client ID_ and _Issuer URL_ that you've collected and _Save_.

Your configuration is now complete. You can check that your app is configured correctly by navigating to _https://mobile-{app id}.azurewebsites.net/.auth/login/aad_.

[Azure classic portal]: https://portal.azure.com
[Mobile Center]: https://mobile.azure.com/
