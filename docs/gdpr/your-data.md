---
title: GDPR 
description: How to manage your personal information. 
keywords: GDPR, DSR, privacy, EU
author: iageoghe
ms.author: iageoghe
ms.date: 01/02/2018 
ms.topic: article 
ms.assetid: A044F6C1-A7BC-4F68-AD0F-6170EA55F08A
ms.service: vs-appcenter
---

# GDPR 

App Center customers who wish to exercise their rights as data subjects may do so by submitting DSR (Data Subject Right) requests using GDPR specific API methods created for this purpose. 

## Delete

The right to be forgotten differs from typical account closure in that we must delete your personal information within thirty days of your request. It also differs in that we provide you with a mechanism to programmatically and anonymously validate that your request has been serviced; even after your account has been closed.

To call the delete API, you must first have an API token from Visual Studio App Center with which to call the API method. If you don't have an API token, follow the steps to [get an App Center API Token](https://docs.microsoft.com/en-us/appcenter/api-docs/). The delete endpoint can be found here:

```TEXT
https://appcenter.ms/api/v0.1/user/dsr/delete
```

A raw request in Postman or Fiddler to submit a delete will look like this:

```TEXT
POST https://api.appcenter.ms/v0.1/user/dsr/delete HTTP/1.1
X-API-Token: <your api key here>
Host: api.appcenter.ms
```

When you POST to the `delete` method, it returns a receipt token you'll pass as a query string variable along with the email associated with your defunct account to check the progress of the request. Once the request has completed, subsequent GET calls to this endpoint will anonymously confirm execution. 

```TEXT
https://appcenter.ms/api/v0.1/user/dsr/delete
```

A raw request in Postman or Fiddler to check or validate execution will look like this:

```TEXT
GET https://api.appcenter.ms/v0.1/user/dsr/delete/<your receipt token>  HTTP/1.1
Host: api.appcenter.ms
```

To cancel your deletion request, use the cancellation endpoint:

```TEXT
https://appcenter.ms/api/v0.1/user/dsr/delete/<your receipt token>/cancel
```

A raw request in Postman or Fiddler to make a cancellation request will look like this:

```TEXT
POST https://api.appcenter.ms/v0.1/user/dsr/delete/<your receipt token>/cancel  HTTP/1.1
X-API-Token: <your api key here>
Host: api.appcenter.ms
```

You can cancel the deletion of your data for up to seven days.

## Export

The personal information of yours we collect, we collect in order to maintain your ability to use our development tools. If at any point you would like to view, access, or take that data with you; the [App Center API](https://openapi.appcenter.ms/) provides access to GET methods that return it. However, we incidentally collect some data that doesn't really fit in our standard methods, so to cover this additional data we have added an export method.

```TEXT
https://appcenter.ms/api/v0.1/user/dsr/export
```

A raw request in Postman or Fiddler to request an export will look like this:

```TEXT
POST https://api.appcenter.ms/v0.1/user/dsr/export HTTP/1.1   
X-API-Token: <your api key here>  
Host: api.appcenter.ms
```

Like the DSR delete method, posting to the DSR export method returns a token that can be used to get the status of the request. To check the status, issue a GET to the endpoint passing the token in the query string.

```TEXT
https://appcenter.ms/api/v0.1/user/dsr/export/<your receipt token>
```

Some of App Center's services may take a while to execute an export. For long running operations, calls to check export status may initially return an error code specifying that work is in progress. Once the work has completed, a successful response from the method will indicate the Azure storage location from which the information may be [retrieved securely using a returned SAS token](https://docs.microsoft.com/en-us/azure/storage/common/storage-dotnet-shared-access-signature-part-1#sas-examples). 

To cancel your export request, use the cancellation endpoint:

```TEXT
https://appcenter.ms/api/v0.1/user/dsr/delete/<your receipt token>/cancel
```

A raw request in Postman or Fiddler to make a cancellation request will look like this:

```TEXT
POST https://api.appcenter.ms/v0.1/user/dsr/export/<your receipt token>/cancel  HTTP/1.1
X-API-Token: <your api key here>
Host: api.appcenter.ms
```
