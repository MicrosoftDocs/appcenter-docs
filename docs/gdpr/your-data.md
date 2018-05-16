---
title: GDPR 
description: How to manage your personal information. 
keywords: GDPR, DSR, privacy, EU
author: iageoghe
ms.author: iageoghe
ms.date: 05/15/2018 
ms.topic: article 
ms.assetid: A044F6C1-A7BC-4F68-AD0F-6170EA55F08A
ms.service: vs-appcenter
---

App Center customers who wish to exercise their rights as data subjects may do so by submitting DSR (Data Subject Right) requests using GDPR specific API methods created for this purpose. 

## Delete

The right to be forgotten differs from typical account closure in that we must delete your personal information within thirty days of your request. It also differs in that we provide you with a mechanism to programmatically and anonymously validate that your request has been serviced; even after your account has been closed.

To call the delete API, you must first have an API token from Visual Studio App Center with which to call the API method. If you don't have an API token, we have [steps](https://docs.microsoft.com/en-us/appcenter/api-docs/) you can follow to get one. The delete endpoint can be found here:

```
https://appcenter.ms/api/v0.1/user/dsr/delete
```

A raw request in Postman or Fiddler will look like this:

```
POST https://api.appcenter.ms/v0.1/user/dsr/delete HTTP/1.1  
X-API-Token: <your api key here>  
Host: api.appcenter.ms
```

When you POST to the delete method, it returns a token that can be used to check the progress of your request. Once the request has been executed, this token can be used to anonymously validate and confirm this execution in the future. After you submit the delete request you will no longer be able to authenticate against our APIs so this method is public. To check execution return the returned token as a query string parameter to the endpoint here:

```
https://appcenter.ms/api/v0.1/user/dsr/delete
```

A raw request in Postman or Fiddler will look like this:

```
POST https://api.appcenter.ms/v0.1/user/dsr/delete/<your receipt token>  HTTP/1.1
Host: api.appcenter.ms
```

## Export

The personal information of yours we collect, we collect in order to maintain your ability to use our development tools. If at any point you would like to view, access, or take that data with you; our [API](https://openapi.appcenter.ms/) provides access to GET methods that return this data. However, we incidentally collect some data that doesn't really fit in our standard methods, so to cover this remainder we have added an export GET method.

```
https://appcenter.ms/api/v0.1/user/dsr/export
```

A raw request in Postman or Fiddler will look like this:

```
POST https://api.appcenter.ms/v0.1/user/dsr/export HTTP/1.1   
X-API-Token: <your api key here>  
Host: api.appcenter.ms
```

Like delete, export also returns a token that can be used to check the status of the request. 

```
https://appcenter.ms/api/v0.1/user/dsr/export/<your receipt token>
```

Some of App Center's services may take a while to execute an export. For long running operations, calls to check export status may initially return an error code specifying that work is in progress. Once the work has completed, a successful response from this method will indicate the location from which the information may be retrieved securely.
