---
title: App Center GDPR Frequently Asked Questions
description: Answer frequently asked customer questions
keywords: app center, gdpr, faq
author: lucen-ms
ms.author: lucen
ms.date: 01/26/2021
ms.topic: article
ms.assetid: d2e8613c-afb1-423f-9bdf-949524ef426e
ms.service: vs-appcenter
ms.custom: gdpr
---
# App Center GDPR Frequently Asked Questions
The following content is a list of frequently asked questions for GDPR. If you have additional questions that aren't answered here, contact us.  

### To meet our GDPR obligations, we've created a DPA. Can you sign it and send it back to us?
For operational reasons, we aren't signing agreements sent to us by our customers. The terms and agreements of our product are here: [Azure Legal Information](https://azure.microsoft.com/support/legal/). GDPR-specific terms are near the end of the Azure Online Service Terms.

### What personal information does your service store?
The information stored by HockeyApp or App Center depends on several factors including how you've configured the SDK, what data your application handles, and so on. For example, if your application transmits crashes back, our services can't determine what personal information is in the stack trace or crash dump. 

### GDPR - what type of data does App Center collect? 
You can see the data App Center collects by [turning on verbose logging](https://docs.microsoft.com/appcenter/sdk/other-apis/react-native#adjust-the-log-level). (Although the article is specific to React Native, you can use the API for all app platforms). Then look at the HTTP logs, which contain headers and JSON payload to see the data type. 

For HockeyApp and App Center SxS users, the data that HockeyApp collects can be found at [https://hockeyapp.net/blog/2016/05/09/user-metrics-and-privacy.html](https://hockeyapp.net/blog/2016/05/09/user-metrics-and-privacy.html).

### How to submit GDPR DSR (Data Subject Right) Delete and Export requests for App Center
App Center customers can exercise their rights as data subjects by submitting DSR requests using GDPR-specific API methods. You can find more information on how to submit a DSR Delete and Export request at [https://docs.microsoft.com/appcenter/gdpr/your-data](https://docs.microsoft.com/appcenter/gdpr/your-data). 

### App Store privacy report
Here you can find answers to questions for the App Store privacy report. Please notice, that we do not filter the information you send us in the logs and custom exception messages. So if you are sending some personal data or user ids in analytic events, you should mention it in a privacy report. The answers below only apply to data that App Center collects itself, provided that you do not send us analytics events or custom exceptions.

#### Data collection
App Center collects only diagnostic data such as crash data and performance data. We collect and store crash stack traces and analytics information: the number of app starts and restarts.

#### Data use
We use data for "Analytics" and "Other Purposes". "Other Purposes" means collecting crash reports to improve the stability of the app.

#### Data linked to the user
The data collected by App Center is not linked with a user and does not contain any personal information.

#### Tracking
App Center only collects information about the country of use of the device based on cellular data (for all platforms except Windows). This information is stored without reference to the user and is only used to display usage statistics in different regions. For Windows, App Center does not collect any geo location tracking by default.


