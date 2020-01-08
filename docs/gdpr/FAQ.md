---
title: App Center GDPR Frequently Asked Questions
description: Answer frequently asked customer questions
keywords: app center, gdpr, faq
author: wisdeom
ms.author: jeom
ms.date: 01/08/2020
ms.topic: article
ms.assetid: d2e8613c-afb1-423f-9bdf-949524ef426e
ms.service: vs-appcenter
ms.custom: gdpr
---
# App Center GDPR Frequently Asked Questions
The following is a list of frequently asked questions for GDPR. If you have additional questions that aren't answered here, reach out to us.  

### In order to meet our GDPR obligations, we have created a DPA. Can you sign it and send it back to us?
For operational reasons, we aren't signing agreements sent to us by our customers. The terms and agreements for usage of our product are here. GDPR-specific terms are near the end of the Azure Online Service Terms.

### What personal information does your service store?
The information stored by HockeyApp or App Center depends on several factors including how you have configured the SDK, what data your application handles, and so on. For example, if your application transmits crashes back, our services can't determine what personal information resides in the stack trace or crash dump. We have several features under development to help you find data associated with your customers. You can check our [roadmap](https://docs.microsoft.com/appcenter/general/roadmap) for updates and details.

### GDPR - what type of data does App Center collect 
You can see the data that App Center collects by [turning on verbose logging](https://docs.microsoft.com/appcenter/sdk/other-apis/react-native#adjust-the-log-level) (note: although this article is specific to React Native, you can use this API for all app platforms). Then look at the HTTP logs, which contain headers and JSON payload to see the data type. 

For HockeyApp and App Center SxS users, the data that HockeyApp collects can be found at [https://hockeyapp.net/blog/2016/05/09/user-metrics-and-privacy.html](https://hockeyapp.net/blog/2016/05/09/user-metrics-and-privacy.html).

### How to submit GDPR DSR (Data Subject Right) Delete and Export requests for App Center
App Center customers who wish to exercise their rights as data subjects may do so by submitting DSR requests using GDPR-specific API methods created for this purpose. You can find more information on how to submit a DSR Delete and Export request at [https://docs.microsoft.com/appcenter/gdpr/your-data](https://docs.microsoft.com/appcenter/gdpr/your-data). 
