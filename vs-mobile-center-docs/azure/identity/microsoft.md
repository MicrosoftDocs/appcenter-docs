---
title: Azure Microsoft Authentication
description: Using Microsoft account authentication with Azure and Mobile Center
keywords: azure
author: adrianhall
ms.author: adrianha
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 16bbac0d-31a9-40d3-ad73-4a3aaf34108c
ms.service: mobile-center
---

# Configure Microsoft Account

You will need:
* Your Mobile Center app secret, which you can find by going to _Mobile Center_ > _your app_ > _Getting Started_ > _Manage app_ > _App secret_.

### Register your application with Microsoft Account

1. Navigate to the [My Applications] page in the Microsoft Account Developer Center, and log on with your Microsoft account, if required.

2. Click _Add an app_, then type an application name, and click _Create application_.

3. Make a note of the _Application ID_.

4. Under _Platforms_, click _Add Platform_ and select _Web_.

5. Under _Redirect URIs_ supply _https://mobile-{app id}.azurewebsites.net/.auth/login/microsoftaccount/callback_ as the endpoint for your application, then click _Save_.

6. Under _Application Secrets_, click _Generate New Password_. Make note of the value that appears. Once you leave the page, it will not be displayed again.

### Configure Identity for Microsoft Account authentication

1. In [Mobile Center], go to _Identity_, and click on _Microsoft Account_.

2. Enter the _Client ID_ and _Client Secret_ that you've collected, optionally enable any scopes your application requires, and _Save_.

Your configuration is now complete. You can check that your app is configured correctly by navigating to _https://mobile-{app id}.azurewebsites.net/.auth/login/microsoftaccount_.

[Azure classic portal]: https://portal.azure.com
[My Applications]: http://go.microsoft.com/fwlink/p/?LinkId=262039
[Mobile Center]: https://mobile.azure.com/
