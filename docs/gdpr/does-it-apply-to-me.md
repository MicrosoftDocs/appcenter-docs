---
title: Does GDPR apply to me? 
description: How to assess GDPR issues
keywords: GDPR, DSR, privacy, EU
author: lucen-ms
ms.author: lucen
ms.date: 05/31/2018 
ms.topic: article 
ms.assetid: 5B070250-4DD6-4975-88E7-7ECD872A1C6D
ms.service: vs-appcenter
---

# Does GDPR apply to me?

[!INCLUDE [Retirement announcement for App Center](~/includes/retirement.md)]

## Overview
The goal of this guide is to help you determine whether and where you may have collected personal information about your end users using App Center. The document is divided by App Center service, mapped to scenarios.

If one of these scenarios applies, and one of your users requests to exercise a Data Subject Right, then you can look at the corresponding section to export or delete your end-user data.

### Scenario 1: I'm mapping the install IDs to user IDs
Install IDs aren't personal information on their own. However they can be when mapped to personal info, which can be used to identify an end user.

A common way to map IDs is to track users when they log in into your app, linking their credentials to their install ID.

### Scenario 2: Analytics - I added personal information in custom events
If you're using [Analytics Custom Events](~/analytics/event-metrics.md) in App Center Analytics, events are a potential place where you could have added personal information, including:
- Event name
- Event property key
- Event property value

#### Event property value
Personal information can be introduced via event property values. For example, you could create an event called "Login" that captures email addresses in the property value field.

```csharp
Map<String, String> properties = new HashMap<>();
properties.put("email_address", "blXXX@microsoft.com");
properties.put("phone_number","555-123-XXX");
Analytics.trackEvent("Login", properties);
```

#### Event name or event property key
These two cases are less probable because they're statically defined by the developer once. However, there are also places where you may have added personal information. See the examples below.

Event name:
```csharp
Analytics.trackEvent("blXXX@microsoft.com", properties);
```

Event property key:
```csharp
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
If you're using [App Center Errors](~/errors/index.md), error properties are a potential place where you may have added personal information.

#### Error property value
The most common scenario is having personal information in the Error Property Value. For example:

```csharp
try 
{
  // your code here.
} 
catch (Exception exception) 
{
    var properties = new Dictionary<string, string> 
    {
        { "email_address", "blXXX@microsoft.com"},
        { "phone_number", "555-123-XXX"}
    };
    Crashes.TrackError(exception, properties);
}
```

#### Error property key
This is a less common case because they're static, defined by the developer once.

Personal information in the error property key:

```csharp
try 
{
  // your code here.
} 
catch (Exception exception) 
{
    var properties = new Dictionary<string, string> 
    {
        { "blXXX@microsoft.com", "@microsoft.com" },
        { "555-123-XXX", "Washington number" }
    };
    Crashes.TrackError(exception, properties);
}
```