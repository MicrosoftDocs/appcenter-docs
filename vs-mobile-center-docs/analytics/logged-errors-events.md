---
title: Understanding Mobile Center Events Metrics
description: Help using the Events Metrics on Mobile Center
keywords: mobile center, analytics, exceptions
author: blparr
ms.author: blparr
ms.date: 03/22/2017
ms.topic: article
ms.assetid: 8F9AE70D-9153-4EFE-8173-BA1749F4BB0D
ms.service: mobile-center
ms.custom: analytics
---


> [!IMPORTANT]
> Logged Errors are not available yet as part of the Crashes service in Mobile Center. Therefore, we would like to propose a workaround using Custom Events. This is not how "Logged Errors" are intended to be supported and it is not the main purpose of Events either. However, we would like to give you some advice on how to best leverage Events to get counts on your logged errors.


# How to Use Events for Logged Errors  
In this section, you will learn how to use events to get information about your logged errors. Such events for logged errors are helpful if you are interested in counting the number of times an error has happened. You will get six different measures per event: count, count change, users, user change, count per user and count per session. 
 
## Event name: 
We recommend giving the event a name that provides some contextual information. Logged errors can be very generic, so it’s necessary to provide some extra information that will identify an error in a more distinct way. An example of contextual information is the file/method name where the error is logged. 

*Example*:

Let’s imagine a situation where you want to understand how often your users fail connecting to the WiFi. 
“UnknownHostException:ConnectWiFi”, where “UnknownHostException” is the generic name of the exception and “ConnectWiFi” is the method name. 
  
## Event properties: 
If you’d like to understand more about the distribution of these logged errors for different characteristics (e.g. device type, OS version, build number, or manufacturer), you can use the properties and property values. 

*Example*: 

Property Key: OS Version 

Property Value 1: 10.2.1 

Property Value 2: 10.3 

Property Value 3: 9.3.5 

  
Depending on your specific use case, you might want to include these as part of the event name instead. However, note that the number of event names is limited to 200. It is important to know what you want to answer to get the most value from using events for logged errors. 
If you would like to filter by version, you don't need to include that as part of the property, as you can use the dropdown provided on top right of the event page. 


![](~/analytics/images/version-filtering.PNG)
  

If you'd like to include the exception message, you can include it as another property. 

*Example*: 

Property Key: Exception Message 
Property Value: Exception in thread "main" java.lang.RuntimeException 
 
Note however, that the number of characters in the property values is limited to 64 characters so you will most likely need to truncate or filter the string. Finally, you should not include the stack trace as part of the event name or property values for the same reason. 
 