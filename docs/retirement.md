---
title: Visual Studio App Center Retirement  
description: Visual Studio App Center is scheduled for retirement
author: fattoh-saidov
ms.author: v-absaidov
ms.date: 03/12/2024
ms.topic: article
# ms.assetid: bf1e5147-2f23-4ba6-a245-9ecae8a6543a
ms.service: vs-appcenter
---

# Visual Studio App Center Retirement  
Visual Studio App Center is scheduled for retirement on <u>March 31, 2025</u>.  After that date it will not be possible to sign in with your user account nor make API calls. App Center will continue to be supported until March 31, 2025, with critical bug fixes and technical support. 

## Alternative solutions 
The following notes outline alternative solutions to migrate off App Center.  Our support team will be available to address any additional questions at [support@appcenter.ms](mailto:support@appcenter.ms).

| App Center capability                 | Recommended alternative solution|
|:--------------------------------------|:-------------------------------|
| <b>Build</b>                          | We recommend migrating your <b>builds</b> from App Center to [Azure Pipelines](https://azure.microsoft.com/products/devops/pipelines/), leveraging the [Export App Center Build feature](~/build/export-to-azure-pipelines.md).<br /><br />[EAS Build](https://docs.expo.dev/build/introduction/) provides first-class support for building React Native mobile apps.                 |
| <b>Test</b>                           | For app device <b>testing</b>, we recommend [BrowserStack App Automate](https://www.browserstack.com/microsoft-browserstack). BrowserStack provides access to 20,000+ real iOS and Android devices.  BrowserStack has developed the Device Testing CLI to support migrating from Microsoft App Center to BrowserStack App Automate. <br/> <br/>You can find the full guidance for migration to BrowserStack [here](https://www.browserstack.com/microsoft-browserstack).   |
| <b>Distribution</b>                       | We recommend Apple’s [AppStore](https://www.apple.com/app-store/) for iOS app production releases and [Apple’s  TestFlight](https://developer.apple.com/testflight/) for iOS app test releases. For Android applications we recommend [Google Play](https://play.google.com/) for production releases and [Google Play Console](https://play.google.com/console/about/guides/releasewithconfidence/) for test releases. <br/><br/>[Azure Pipelines](https://azure.microsoft.com/products/devops/pipelines/) tasks can be used for <b>distributing</b> to [AppStore/TestFlight](https://marketplace.visualstudio.com/items?itemName=ms-vsclient.app-store) and [Google Play](https://marketplace.visualstudio.com/items?itemName=ms-vsclient.google-play).<br /><br />For React Native mobile apps, [EAS Submit](https://docs.expo.dev/submit/introduction/) supports submitting to both the Apple App Store, including TestFlight, and Google Play Store.<br /><br />For Microsoft Store applications, we recommend using [Package Flights](/windows/apps/publish/package-flights) feature available in Partner Center. |
| <b>CodePush</b>           | We have prepared a special version of <b>CodePush</b> to integrate into your app and run independently from App Center. If you’d like to get access to the codebase of this CodePush standalone version, please reach out to our support team at [support@appcenter.ms](mailto:support@appcenter.ms) for more information.<br /><br />For React Native mobile apps, [EAS Update](https://docs.expo.dev/eas-update/introduction/) is a hosted service with similar capabilities and has a [migration guide](https://docs.expo.dev/eas-update/codepush/). |
| <b>Analytics & diagnostics</b> | We recommend one of the Azure Native ISV services which provide rich capabilities for mobile <b>analytics and diagnostics</b>. By leveraging these Azure Native ISV services, you will be able to monitor your complete stack from device to your backend infrastructure on Azure. <br/><br/>Click on each link below to see the documentation for Azure Native ISV service of your choice. <br/><br/>[Azure Native ISV Services:](/azure/partner-solutions/) <ul><li>[Datadog](/azure/partner-solutions/datadog/overview)</li><li>[Dynatrace](/azure/partner-solutions/dynatrace/dynatrace-overview)</li><li>[New Relic](/azure/partner-solutions/new-relic/new-relic-overview)</li></ul>Microsoft Store app developers can access analytics & diagnostics data through [Partner Center Dashboard](https://partner.microsoft.com/dashboard). Additionally, UWP applications published in Microsoft Store can log custom events through the [Microsoft Store Services SDK](/windows/uwp/monetize/log-custom-events-for-dev-center). | 


## Get support
If you have any questions please reach out to our support team from the App Center portal directly by clicking <b><i>? > Contact support</i></b> in the upper-right corner or send an email to [support@appcenter.ms](mailto:support@appcenter.ms).

![App Center Support Form](~/images/app-center-support-form.png)
