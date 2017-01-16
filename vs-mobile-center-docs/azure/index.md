---
title: Azure
description: Using Azure with Mobile Center
keywords: azure
author: adrianhall
---

# Azure

Azure Services implements a backend for providing cloud-based services to your mobile application.

These services currently include:

* [Identity] - Authentication and Authorization
    * Social Identity with [Facebook], [Google], [Microsoft] and [Twitter]
    * Enterprise Identity with [Azure AD]
* [Table Data Storage] and Offline Sync

## Key Features

Identity management allows you to authenticate the users of your mobile app with a social provider or Azure AD (which includes Office 365 users).  As
a developer, you can leverage the identity providers SDK to authenticate the user, then pass that authentication to your backend to authorize the
user to access information stored there.

Table Data Storage provides a SQL-like table storage capability.  Data is organized into tables, and tables into rows.  Data access can be controlled
using the Identity service.   The mobile client SDK for Azure Mobile Apps can be used to provide offline synchronization of the data.  A copy of the
data may be stored on the mobile device for performance and network resiliency.

## Getting Started

When you first access any Azure Service beacon for the first time, you will be asked to link your subscription.

Once the subscription is linked, Mobile Center will automatically create an Azure App Service in your subscription.  By default, the App Service is
created in the South Central US region and on the F1 Free plan.  In addition, a free SQL Azure instance (limited to 20Mb) is created to hold your
data.

[Identity]: identity/
[Facebook]: identity/facebook/
[Google]: identity/google/
[Microsoft]: identity/microsoft/
[Twitter]: identity/twitter/
[Azure AD]: identity/azuread/
[Table Data Storage]: tables/
