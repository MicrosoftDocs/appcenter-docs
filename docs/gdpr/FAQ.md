---
title: App Center GDPR Frequently Asked Questions
description: Answer frequently asked customer questions
keywords: app center, gdpr, faq
author: jeom
ms.author: jeom
ms.date: 10/08/2019
ms.topic: article
ms.assetid: d2e8613c-afb1-423f-9bdf-949524ef426e
ms.service: vs-appcenter
ms.custom: gdpr
---
# App Center GDPR Frequently Asked Questions
In the following we collected a list of frequently asked questions for GDPR. If you are missing anything, please reach out to us. 

### In order to meet our GDPR obligations, we have created a DPA. Can you sign it and send it back to us?
For operational reasons we aren't signing agreements sent to us by our customers. The terms and agreements associated with usage of our product can be found here and GDPR specific terms can be found near the end of the Azure Online Service Terms.

### What personal information does your service store?
The information stored by HockeyApp or App Center depends on several factors including how you have configured the SDK, what data your application handles, etc. For example, if your application transmits crashes back there is no realistic way for our services to determine what personal information resides in a stack trace or crash dump. We have several features under development to help you find data associated with your customers; please check our [roadmap](https://docs.microsoft.com/en-us/appcenter/general/roadmap) frequently for updates and details.

### GDPR - what type of data does App Center collect 
You can see the data that App Center collects by [turning on verbose logging](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/react-native#adjust-the-log-level) (note: although this article is specific to React Native, you can use this API for all app platforms). Then, look at the HTTP logs which contain headers and JSON payload to see the data type. 

For HockeyApp and App Center SxS users, here is the [data](https://hockeyapp.net/blog/2016/05/09/user-metrics-and-privacy.html) that HockeyApp collects.

If you have any additional/specific questions on the data, feel free to message us in the blue  chat button at the bottom right of the screen.

### GDPR DSR Delete and Export Requests

**How to submit DSR Delete and Export requests for App Center**

App Center customers who wish to exercise their rights as data subjects may do so by submitting DSR (Data Subject Right) requests using GDPR specific API methods created for this purpose. You can find more information on how to submit a DSR Delete and Export request at [https://docs.microsoft.com/en-us/appcenter/gdpr/your-data](https://docs.microsoft.com/en-us/appcenter/gdpr/your-data). 