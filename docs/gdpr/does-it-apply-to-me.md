---
title: Does GDPR apply to me? 
description: How your GDPR Data Subject Rights are covered by App Center. 
keywords: GDPR, DSR, privacy, EU
author: blparr
ms.author: blparr
ms.date: 05/31/2018 
ms.topic: article 
ms.assetid: 5B070250-4DD6-4975-88E7-7ECD872A1C6D
ms.service: vs-appcenter
---

# Does it apply to me?

## Overview

The goal of this section is to help you determine whether and where you may have collected personal information about your end-users using App Center. The document is split by App Center service, mapped to scenarios.

If one of these scenarios apply, and should one of your users request to exercise a Data Subject Right, then you can look at the corresponding documentation section to export or delete your end-user data.

### Scenario 1: I am mapping the install IDs to user IDs. 

Install IDs are not personal information on their own however they can be when mapped to personal information that can be used to uniquely identify an end-user. 

A common way to do this is to track users when they login into your app, mapping their credentials to their install ID.

### Scenario 2: Analytics - I added personal information in custom events

If you are using [Custom Events](~/analytics/event-metrics.md) in App Center Anaytics, events are a potential place where you could have added personal information, these are: 
- Event name 
- Event property key 
- Event property value 

#### Event property value

Personal information can be introduced via event property values. For example, you could create an event called "Login" that captures email addresses in the property value field. 

```
Map<String, String> properties = new HashMap<>(); 
properties.put("email_address", "blXXX@microsoft.com"); 
properties.put("phone_number","555-123-XXX"); 
Analytics.trackEvent("Login", properties); 
```

#### Event name or event property key

These two cases are less probable because they are static defined by the developer just once. However, they are also potential places where you may have added personal information. See the examples below. 

Event name: 

```
Analytics.trackEvent("blXXX@microsoft.com", properties); 
```

Event property key: 

```
Map<String, String> properties = new HashMap<>(); 
properties.put("blXXX@microsoft.com", "microsoft_address"); 
properties.put("555-123-XXX", "washington_state"); 

Analytics.trackEvent("Origin", properties); 
```

### Scenario 3: Crashes - I added personal information in Crashes

#### Crash Attachments

If you use the SDK to transmit crash information, you may have added your user’s data in a text attachment for a crash.

#### Exception Message

When throwing an exception, you may have included a user's personal information in the exception message.

#### Annotation

When writing an annotation on the portal or via API, you may have written a user’s personal information in annotations.

### Scenario 4: Errors - I added personal information in error properties

If you are using App Center [Errors](~/errors/index.md), error properties are a potential place where you may have added personal information.

#### Error property value

The most common scenario is to have personal information in the Error Property Value. An example of how this could happen is as follows: 

Error property value:

```Csharp
try { 
  // your code here. 
  
} catch (Exception exception) { 
    var properties = new Dictionary<string, string>() { 
        { "email_address", "blXXX@microsoft.com"}, 
        { "phone_number", "555-123-XXX"} 
    }; 
    Crashes.TrackError(exception, properties); 
} 
```

#### Error property key

This is a less common case because they are static defined by the developer just once.  

Personal information in the error property key:

```Csharp
try { 
  // your code here. 
  
} catch (Exception exception) { 
    var properties = new Dictionary<string, string>() { 
        { "blXXX@microsoft.com", "@microsoft.com" }, 
        { "555-123-XXX", "Washington number" } 
    }; 
    Crashes.TrackError(exception, properties); 
} 
```
### Scenario 5: Push - I added personal information in Push

#### Custom Properties used to define your audience 

If you are using Custom Properties in App Center Analytics, every device registered for push notifications is associated to a number of custom properties. Other device related information is associated as well like language, country, etc. More about custom properties and how to use it in Push can be found here.
    
#### Audience definition and description 

This is only if you are using an audience to send your push notifications, if you are pushing directly to Install Ids, you don’t have to worry about this.

The scenario here is the rare case where you may have put personal information in an audience name or description in the portal or via API.
    
#### Push Notification: message details, or the campaign description

This data is stored for every Push Notification you make, regardless if you are using an Audience or device Ids. This data includes the Push Notification title, body, and any custom data you have added to customize your Push Notification. 
