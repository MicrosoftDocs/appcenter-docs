---
title: Azure Facebook Authentication
description: Using Facebook authentication with Azure and Mobile Center
keywords: azure
author: adrianhall
ms.author: adrianhall
ms.date: 01/20/17
ms.topic: article
ms.assetid: c2ba2b0c-5589-4432-9daa-dfde07c8404e
ms.service: mobile-center
---

# Configure Facebook

You will need:
* A Facebook account with a verified email and a phone number.
* your Mobile Center app secret, which you can find at by going to _Mobile Center_ > _your app_ > _Getting Started_ > _Manage app_ > _App secret_.

### **Register your application with Facebook**

1. Go to the [Facebook Developers] site and sign-in with your Facebook  credentials. If you have not already registered, click _Apps > Register as a Developer_, then accept the policy and follow the registration steps.

2. Click _My Apps > Add a New App_. In _Display Name_, type a unique name for your app, type your _Contact Email_, choose a _Category_ for your app, then click _Create App ID_ and complete the security check. This takes you to the developer dashboard for your new Facebook app.

3. At _Facebook Login_, click _Get Started_. On the left navigation, click _Settings_, and add your application's Redirect URI, which is _https://mobile-{app id}.azurewebsites.net/.auth/login/facebook/callback_ to _Valid OAuth redirect URIs_, then click _Save Changes_.

4. In the left-hand navigation, click _Settings_. On the _App Secret_ field, click _Show_, provide your password if requested, then make a note of the values of _App ID_ and _App Secret_.

[Facebook Developers]:https://developers.facebook.com/

### **Configure Identity for Facebook authentication**

1. In [Mobile Center], go to _Identity_, and click on _Facebook_.

2. Enter the _App ID_ and _App Secret_ that you've collected, optionally enable any scopes needed by your app, and _Save_.

Your configuration is now complete. You can check that your app is configured correctly by navigating to _https://mobile-{app secret}.azurewebsites.net/.auth/login/facebook_.

[Mobile Center]: https://mobile.azure.com/
