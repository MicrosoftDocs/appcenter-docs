---
title: Mobile App Testing Frameworks Overview
description: "Mobile App Testing Frameworks Overview"
keywords: testcloud
author: glennwester
ms.author: glwest
ms.date: 04/30/2018
ms.topic: article
ms.assetid: 9cdf95db-1ad5-4541-a21c-c20492d4607f
ms.service: vs-appcenter
ms.custom: test
---
# Mobile App Testing Frameworks Overview 

## Introduction

After delivering support for next major release of the iOS and Android operating systems, Microsoft will discontinue our contributions to developing Calabash, the open-source mobile app testing tool. We hope that the community will continue to fully adopt and maintain it. 

As part of our transition on the development of Calabash, we've provided an overview of mobile app UI and end-to-end testing frameworks as a starting point for teams who are looking to re-evaluate their testing strategy. This document is written to aid such an evaluation.

## The Future of Calabash

Microsoft is committed to ensuring that Calabash works up until and including the next minor releases of the iOS and Android OS versions, that is, iOS 11.x and Android O / Android 8.x. After securing those releases, we will discontinue dedicated engineering contributions. Given the open source nature of Calabash, we hope the community will step up and continue to maintain and develop the tool. If you're interested in staying with Calabash, you'll want to take note to see if an individual or group steps up to take over maintenance. You may also see this as an opportunity to take matters into your own hands and devote engineering resources to maintain Calabash. If you're interested in taking over Calabash stewardship, please contact <appcentertest@microsoft.com>.

Calabash will continue to be supported in Visual Studio App Center and Xamarin Test Cloud up until and including iOS 11.x and Android 8.x. At this time, the tool will become a 3rd party testing framework supported in Test Cloud.

Still have questions about how it works? Read on for our FAQ:

**Q: Will we be able to continue to use Calabash to run tests on my devices and simulators? Will Calabash continue to be supported in Xamarin Test Cloud & Visual Studio App Center?**

**A:** Yes, you can continue to use Calabash. There is a risk that the community will not find a maintainer and that Calabash might not support OS versions greater than iOS 11.x and Android 8.x.

**Q: Will Microsoft release the entire Calabash stack to the OSS community?**

**A:** Microsoft will release the source code to DeviceAgent.iOS and iOSDeviceManager as open source, so that Calabash can be considered fully open source.

**Q: Xamarin.UITest is based on Calabash – what does Calabash deprecation mean for Xamarin.UITest?**

**A:** While it is correct that Xamarin.UITest uses some components from the Calabash tool-chain, it's important to stress that Xamarin.UITest is still fully maintained and actively being developed. Xamarin.UITest aspires to be the de-facto UI-testing solution for Xamarin apps and a great testing solution for all apps even if they don't leverage the Xamarin development platform. Microsoft will continue to support and develop the sub-components that Xamarin.UITest depends on. The deprecation of Calabash has no implications for the viability of Xamarin.UITest as a testing option. 

## The Tools Landscape beyond Calabash

The landscape of good mobile UI & app testing frameworks has expanded over the last few years. In addition to Calabash, there are 6 major app testing frameworks available for iOS and Android: 
*	**Espresso**
*	**XCUITest** 
*	**Xamarin.UITest** 
*	**Appium** 
*	**EarlGrey**
*	**KIF**

Below you can find a brief description of the tools, a tabular overview and finally some general advice to help inform your test framework and tooling selection.

>Note: this guide was written in the fall of 2017. It still provides a valid overview, but the space may have changed, and more data would be available. For example, in the React Native community, the [detox testing framework](https://github.com/wix/detox) has been gaining popularity.

#### Espresso

Espresso is an Android-only UI testing framework supported by Google. It's fast, based on Java, integrated in Android Studio and has a Test Recorder which aids in getting started. Similar to Calabash, it's based on the Android instrumentation framework. Since it's Android-only and Java-based there is no support for cross-platform testing.

The natural target audience is Android native developers.

#### XCUITest 

XCUITest (or UI Testing with XCTest and Xcode) is Apple's official UI Testing framework for iOS. It was announced with iOS 9 and supports iOS 9 and higher. Tests can be written in Swift or Objective-C. 

Similar to Apple's UIAutomation is based on the iOS accessibility system, e.g., identifying buttons via accessibility traits, identifiers and labels. XCUITest is integrated in Xcode and has a Test Recorder. 

XCUITest is a powerful framework and is much easier to use than the predecessor UIAutomation, but still suffers a bit from lack of maturity. It's is, however, being actively updated and improved. 
Since it's iOS-only and based on Swift/Objective-C there is no support for cross-platform testing.

The natural target audience is iOS native developers.

#### Xamarin.UITest 

Xamarin.UITest is a cross-platform UI testing framework for iOS and Android. It is based on the same software-infrastructure as Calabash (the Calabash servers and DeviceAgent). 
It's important to note that even though Calabash is deprecated, Xamarin.UITest will continue to be fully supported and developed by the Xamarin team at Microsoft. Just like Calabash, Xamarin.UITest works with any app regardless of what technology was used to build it (i.e. Xcode/Swift/Objective-C, Android/Java, Cordova, Xamarin are all supported). 

Xamarin.UITest has the same feature-set as Calabash, and is just as easy to use. It also has added benefits of auto-completion in IDEs due to the strong typing of C#, and supports automatically injecting the Calabash server component. There is also IDE support for Xamarin.UITest via templates in Visual Studio and Visual Studio for Mac.
The natural target audience is Xamarin platform developers. 
#### Appium 

Appium is a cross-platform UI testing framework for iOS, Android, and Windows. Appium uses a client-server architecture which enables use of multiple "client" languages and test frameworks to author tests. For each supported language there is an Appium client library which is used to write tests in the programming language. The API architecture and APIs are based on Selenium: the popular open-source browser testing tool. 

While Appium does have a test recorder, it does not appear to be actively maintained. There are no specific IDE integrations for Appium. There is an inspector tool which helps the development process productivity.

The natural target audience for Appium is test engineers which have experience writing tests using the Selenium API. 

#### EarlGrey

EarlGrey can be considered Google's attempt to write "an Espresso for iOS". With EarlGrey, tests are written in Objective-C or Swift and run via Xcode using XCTest. Similarly to Calabash on iOS, EarlGrey uses an in-process framework which requires linking a framework into the application under test. 

Since it's iOS-only and based on Swift/Objective-C there is no cross-platform testing options. 

The natural target audience is iOS developers, particularly for teams that use Espresso on Android and want something similar on iOS. EarlGrey 2.0 is coming soon and, like Calabash and Xamarin.UITest, will leverage XCUITest. 
#### KIF

KIF, is architecturally very similar to EarlGrey in that it uses an in-process framework which requires linking a framework into the application under test. Since it's iOS-only and based on Swift/Objective-C there is no cross-platform testing options. 
The natural target audience is iOS developers, particularly for teams that use Espresso on Android and want something similar on iOS.

Below you can find a tabular overview of these tools in terms of features and traits: Platform support, Programming languages, Open source/proprietary, Stewardship, BDD runner support. 

|         | Espresso           | XCUITest  |  Xamarin.UITest   | Appium  | EarlGrey  |
| ------------- |:-------------:| :-----:|:-------------:| :-------------:|:-------------:|
| **Platforms**      | Android |  iOS | Android, iOS | Android, iOS (Windows) | iOS |
| **Languages**      | Java & JVM based    |   Objective-C, Switf | C# | Java, Javascript, Ruby, Python (and more) | Objective-C & Swift |
| **Open Source** | Yes      |    No | No | Yes | Yes |
| **Steward** | Google      |   Apple  | Microsoft | jQuery Foundation | Google |
| **BDD Options** | [Cucumber](https://github.com/sebaslogen/espresso-cucumber) [JVM](https://github.com/sebaslogen/espresso-cucumber)      |   [XCFit](https://shashikant86.github.io/XCFit/) [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish) | SpecFlow | Yes (depends on client test framework) | Unknown |

## Recommendations

We recommend asking yourself the questions:
* **Dev vs QA:** Do we want developers to write tests, or do we have a QA engineering team writing tests? 
*	**Cross-Platform:** Do we want to write cross-platform tests, sharing Test logic across iOS and Android platforms, or do we want more autonomy for iOS and Android teams.
*	**Languages:** Do we have strict requirements for supported programming languages and test frameworks?
*	**Selenium:** Can prior Selenium/WebDriver knowledge be leveraged to ease migration?
*	**BDD:** Do we want to use Behavior Driven Development (BDD)? 
*	**Calabash:** are you using the more advanced features in Calabash like backdoors, invoking methods on objects, keychain interactions, and spoofing the device location, intent mocking, … This would also be technically supported by Espresso/EarlGray, however not through their API.

#### When to migrate to Xamarin.UITest

[Xamarin.UITest](~/test-cloud/uitest/index.md), being based on the same software infrastructure as Calabash, is very mature. It's a good fit for Calabash users, who are not intimately linked to the Ruby programming language. Xamarin.UITest also works well with SpecFlow which provides a way to leverage the '.feature' specifications in a Calabash project. (Xamarin.UITest also works with just NUnit so BDD-style testing is not a requirement.).
*	**Dev vs QA:** For Xamarin developers, it's an excellent choice, but basic usage of C# is enough. Can work for both Dev and QA, assuming the team is comfortable with C#.
*	**Cross-Platform:** Supported.
*	**Languages:** C#
*	**Selenium:** No.
*	**BDD:** Optional, but fully supported with SpecFlow
*	**Calabash:** If you like and leverage the Calabash feature set (e.g. backdoors, invoking methods, keychain, ...), Xamarin.UITest supports them.

#### When to migrate to Appium

[Appium](http://appium.io/), is a strong open-source player which is quite mature. Being based on the Selenium/WebDriver APIs and architecture and supporting the same programming languages, it attaches to the large set of Selenium QA engineers and the Selenium ecosystem. Appium is unopinionated about programming language and test runner. However, on-boarding is hard, particularly if you're not already familiar with Selenium. Recently Appium has transitioned away from SauceLabs and onto the jQuery foundation.
*	**Dev vs QA:** Best suited for QA teams as mobile app developers, unless already familiar and comfortable with the Selenium API tend to feel that it's unproductive and hard to learn (anecdotally).
*	**Cross-Platform:** Supported.
*	**Languages:** Most every language is supported, for example, Java, Ruby, Python and JavaScript. 
*	**Selenium:** Yes.
*	**BDD:** Optional, depends of choice of language and framework.
*	**Calabash:** If you're not leveraging the advanced Calabash feature set (e.g. backdoors, invoking methods, keychain, etc).
Appium provides flexibility and standardization, but it might be hard to engage developers. Also be cautious about the future of the project (e.g. timely support for new iOS and Android releases).

#### When to migrate to Espresso

[Espresso](https://developer.android.com/training/testing/espresso/index.html) is targeted at Android native developers, who believe that automated testing is an integral part of the development lifecycle. While it can be used for black-box testing, Espresso’s full power is unlocked by those who are familiar with the codebase under test. This means that Espresso is best suited for native Android developers using Java and Android studio. 
*	**Dev vs QA:** Works very well for native Android developers, comfortable with Java, Android Studio and Android. Can work for all QA teams familiar with Java and Android. 
*	**Cross-Platform:** No: Android only
*	**Languages:** Java (JVM based)
*	**Selenium:** No.
*	**BDD:** Optional, 3rd party open source: via Cucumber/JVM: Espresso-cucumber
*	**Calabash:** Given the architectural similarity to Calabash, it should be possible with some work to leverage advanced Calabash Android features. 


#### When to migrate to XCUITest

[XCUITest](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/09-ui_testing.html) is Apple's extension of the XCTest framework to UI testing. The UI testing features can be used for 'black-box' testing where the test author has no knowledge about the internals of the app. Since XCUITest is integrated in Xcode and supports Objective-C and Swift, it works well for developers already familiar with those programming environments.
*	**Dev vs QA:** Works very well for native iOS developers (Swift or Objective-C). Not many QA teams will be familiar with this environment, but can be trained.
*	**Cross-Platformm:** No: iOS only
*	**Languages:** Swift or Objective-C
*	**Selenium:** No.
*	**BDD:** Optional, 3rd party open source: XCFit and Cucumberish
*	**Calabash:** No easy way to do it

#### When to migrate to EarlGrey or KIF

[EarlGray](https://github.com/google/EarlGrey) can be described as "Espresso for iOS": it's developed by Google and uses the same philosophy as Espresso. EarlGray is also very similar to XCUITest: it's iOS-only, supports Swift and Objective-C, leverages XCTest. However, in contrast to XCUITest, EarlGray, like Calabash, requires linking a framework into the application under test. This brings some additional power, and the expense of some added complexity. EarlGray is still relatively new, and perhaps not as stable as the other frameworks. 

EarlGrey and KIF are very similar and we don't have the necessary knowledge to recommend one over the other. One thing we can say is: KIF is a lot older and is likely to be more mature than EarlGrey. On the otherhand, KIF does not have a big player like Google funding it. 

EarlGrey is inspired by Espresso and "automatically synchronizes with the UI, network requests, and various queues; but still allows you to manually implement customized timings, if needed" (from GitHub: [EarlGrey](https://github.com/google/EarlGrey)). In theory, this should make writing tests easier and test should execute faster. If considering KIF vs. EarlGrey, you should wait with you decision until EarlGrey 2.0 which is shipping in the next 2-3 months.

*	**Dev vs QA:** Works very well for native iOS developers (Swift or Objective-C). Not many QA teams will be familiar with this environment, but can be trained.
*	**Cross-Platform:** No: iOS only
*	**Languages:** Swift or Objective-C
*	**Selenium:** No.
*	**BDD:** Optional, 3rd party open source: [XCFit](https://shashikant86.github.io/XCFit/) and [Cucumberish](https://github.com/Ahmed-Ali/Cucumberish)
*	**Calabash:** Given the architectural similarity to Calabash, it should be possible with some work to leverage advanced Calabash iOS features. 
