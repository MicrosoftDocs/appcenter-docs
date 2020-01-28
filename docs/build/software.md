---
title: App Center Cloud Build Machines
description: Software used on build machines
keywords: build
author: nrajpurkar
ms.author: niloferr
ms.date: 01/28/2020
ms.topic: article
ms.assetid: 1d1f2f48-1e6c-45da-8cad-0e25200abd98
ms.service: vs-appcenter
ms.custom: build
---

# App Center Cloud Build Machines

Each build runs on a separate, clean virtual machine (VM), and no other user has access to the VM. Once the build completes, App Center discards the virtual machine, and all files removed. The artifacts resulting from the build (log files, application files, symbol files) are stored on App Center servers.

## Operating System
> [!NOTE]
> All supported versions of tools in this document are co-installed on the respective VM.

Builds for iOS and Android apps (including Xamarin and React Native platforms) are run on macOS VMs running the following configuration:

- OS X 10.14.6 (18G2022) **Mojave** for builds running Xcode 9.4.1 and higher and also for non-Xcode builds
- OS X 10.13.6 (17G10021) **High Sierra** for builds running Xcode 9.4 and lower

Builds for UWP apps are run on [Hosted Windows Agents](https://www.visualstudio.com/docs/build/concepts/agents/hosted).

## Installed Software
### Language and Runtime
- Java 1.7: (Zulu 7.36.0.5-CA-macosx) (build 1.7.0_252-b10)
- Java 1.8: (Zulu 8.44.0.11-CA-macosx) (build 1.8.0_242-b20) (default)
- Java 11: Zulu11.37+17-CA (build 11.0.6+10-LTS)
- Java 12: Zulu12.3+11-CA (build 12.0.2+3)
- Java 13: Zulu13.29+9-CA (build 13.0.2+6-MTS)
- Node.js v6.17.0
- NVM 0.33.11
- NVM - Cached node versions: v6.17.1 v8.17.0 v10.18.1 v12.14.1 v13.7.0
- PowerShell 6.2.3
- Python 2.7.17
- Python 3.7.6
- Ruby 2.6.5p114
- Rust 1.40.0
- .NET SDK 1.0.1 1.0.4 1.1.4 1.1.5 1.1.7 1.1.8 1.1.9 1.1.10 1.1.11 1.1.12 1.1.13 2.0.0 2.0.3 2.1.2 2.1.4 2.1.100 2.1.101 2.1.102 2.1.103 2.1.104 2.1.105 2.1.200 2.1.201 2.1.202 2.1.300 2.1.301 2.1.302 2.1.400 2.1.401 2.1.402 2.1.403 2.1.500 2.1.502 2.1.503 2.1.504 2.1.505 2.2.100 2.2.101 2.2.102 2.2.103 2.2.104 2.2.105
- Go 1.13.6

### Package Management
- Bundler version 2.1.4
- Carthage 0.34.0
- CocoaPods 1.8.4
- Homebrew 2.2.4
- NPM 3.10.10
- Yarn 1.21.1
- NuGet 4.7.0.5148
- Pip 19.3.1 (python 2.7)
- Pip 19.3.1 (python 3.7)
- Rustup 1.21.1
- Miniconda 4.7.12
- RubyGems 3.1.2

### Project Management
- Apache Maven 3.6.3
- Gradle 6.1

### Utilities
- Curl 7.68.0
- Git: 2.25.0
- Git LFS: 2.10.0
- GNU Wget 1.20.3
- Subversion (SVN) 1.13.0
- GNU parallel 20200122
- OpenSSL 1.0.2t  10 Sep 2019
- jq 1.6
- gpg (GnuPG) 2.2.19

### Tools
- Fastlane 2.140.0
- Cmake 3.16.2
- App Center CLI 1.2.2
- Azure CLI 2.0.80

### Browsers
- Google Chrome 79.0.3945.130 
- ChromeDriver 79.0.3945.36

### Toolcache
#### Ruby
- 2.4.9
- 2.5.7
- 2.6.5
- 2.7.0

#### Python
- 2.7.17
- 3.5.9
- 3.6.10
- 3.7.6
- 3.8.1

#### PyPy
- 2.7.17
- 3.6.9

### Xamarin
#### Visual Studio for Mac
- 8.4.2.59

#### Mono
- 6.6.0.155
- 6.4.0.208
- 6.0.0.334
- 5.18.1.3
- 5.16.1.0
- 5.12.0.309
- 5.10.1.57
- 5.8.1.0
- 5.4.1.7
- 5.2.0.224
- 5.0.1.1
- 4.8.1

#### Xamarin.iOS
- 13.10.0.17
- 13.8.3.0
- 13.6.0.12
- 13.4.0.2
- 13.2.0.47
- 12.14.0.114
- 12.10.0.157
- 12.8.0.2
- 12.6.0.25
- 12.2.1.16
- 12.0.0.15
- 11.14.0.13
- 11.12.0.4
- 11.9.1.24
- 11.8.0.20
- 11.6.1.4
- 11.2.0.11
- 11.0.0.0
- 10.10.0.36
- 10.6.0.10

#### Xamarin.Mac
- 6.10.0.17
- 6.8.3.0
- 6.6.0.12
- 6.4.0.2
- 6.2.0.47
- 5.16.1.24
- 5.10.0.157
- 5.8.0.0
- 5.6.0.25
- 5.3.1.28
- 5.2.1.16
- 4.6.0.13
- 4.4.1.193
- 4.2.1.28
- 4.0.0.216
- 3.8.0.49
- 3.6.3.3
- 3.4.0.36
- 3.0.0.398

#### Xamarin.Android
- 10.1.3
- 10.0.6
- 9.4.1
- 9.3.0
- 9.2.3
- 9.1.8
- 9.0.0
- 8.3.3
- 8.2.0
- 8.1.5
- 8.0.0
- 7.4.5
- 7.3.1
- 7.1.0

#### Unit Test Framework
- NUnit 3.6.1

### Xcode
| Version                        | Build                          | Path                           |
| ------------------------------ | ------------------------------ | ------------------------------ |
| 11.3.1                         | 11C505                         | /Applications/Xcode_11.3.1.app |
| 11.3                           | 11C29                          | /Applications/Xcode_11.3.app   |
| 11.2.1                         | 11B500                         | /Applications/Xcode_11.2.1.app |
| 11.2                           | 11B52                          | /Applications/Xcode_11.2.app   |
| 11.1                           | 11A1027                        | /Applications/Xcode_11.1.app   |
| 11.0                           | 11A420a                        | /Applications/Xcode_11.app     |
| 10.3                           | 10G8                           | /Applications/Xcode_10.3.app   |
| 10.2.1                         | 10E1001                        | /Applications/Xcode_10.2.1.app |
| 10.2                           | 10E125                         | /Applications/Xcode_10.2.app   |
| 10.1                           | 10B61                          | /Applications/Xcode_10.1.app   |
| 10.0                           | 10A255                         | /Applications/Xcode_10.app     |
| 9.4.1                          | 9F2000                         | /Applications/Xcode_9.4.1.app  |

#### Xcode Support Tools
- Nomad CLI 3.1.2
- Nomad CLI IPA ipa 0.14.3
- xcpretty 0.3.0
- xctool 0.3.7
- xcversion 2.6.3

#### Installed SDKs
| SDK                                    | SDK Name                               | Xcode Version                          |
| -------------------------------------- | -------------------------------------- | -------------------------------------- |
| macOS 10.13                            | macosx10.13                            | 9.4.1                                  |
| macOS 10.14                            | macosx10.14                            | 10.0, 10.1, 10.2, 10.2.1, 10.3         |
| macOS 10.15                            | macosx10.15                            | 11.0, 11.1, 11.2, 11.2.1, 11.3, 11.3.1 |
| iOS 11.4                               | iphoneos11.4                           | 9.4.1                                  |
| iOS 12.0                               | iphoneos12.0                           | 10.0                                   |
| iOS 12.1                               | iphoneos12.1                           | 10.1                                   |
| iOS 12.2                               | iphoneos12.2                           | 10.2, 10.2.1                           |
| iOS 12.4                               | iphoneos12.4                           | 10.3                                   |
| iOS 13.0                               | iphoneos13.0                           | 11.0                                   |
| iOS 13.1                               | iphoneos13.1                           | 11.1                                   |
| iOS 13.2                               | iphoneos13.2                           | 11.2, 11.2.1, 11.3, 11.3.1             |
| Simulator - iOS 11.4                   | iphonesimulator11.4                    | 9.4.1                                  |
| Simulator - iOS 12.0                   | iphonesimulator12.0                    | 10.0                                   |
| Simulator - iOS 12.1                   | iphonesimulator12.1                    | 10.1                                   |
| Simulator - iOS 12.2                   | iphonesimulator12.2                    | 10.2, 10.2.1                           |
| Simulator - iOS 12.4                   | iphonesimulator12.4                    | 10.3                                   |
| Simulator - iOS 13.0                   | iphonesimulator13.0                    | 11.0                                   |
| Simulator - iOS 13.1                   | iphonesimulator13.1                    | 11.1                                   |
| Simulator - iOS 13.2                   | iphonesimulator13.2                    | 11.2, 11.2.1, 11.3, 11.3.1             |
| tvOS 11.4                              | appletvos11.4                          | 9.4.1                                  |
| tvOS 12.0                              | appletvos12.0                          | 10.0                                   |
| tvOS 12.1                              | appletvos12.1                          | 10.1                                   |
| tvOS 12.2                              | appletvos12.2                          | 10.2, 10.2.1                           |
| tvOS 12.4                              | appletvos12.4                          | 10.3                                   |
| tvOS 13.0                              | appletvos13.0                          | 11.0, 11.1                             |
| tvOS 13.2                              | appletvos13.2                          | 11.2, 11.2.1, 11.3, 11.3.1             |
| Simulator - tvOS 11.4                  | appletvsimulator11.4                   | 9.4.1                                  |
| Simulator - tvOS 12.0                  | appletvsimulator12.0                   | 10.0                                   |
| Simulator - tvOS 12.1                  | appletvsimulator12.1                   | 10.1                                   |
| Simulator - tvOS 12.2                  | appletvsimulator12.2                   | 10.2, 10.2.1                           |
| Simulator - tvOS 12.4                  | appletvsimulator12.4                   | 10.3                                   |
| Simulator - tvOS 13.0                  | appletvsimulator13.0                   | 11.0, 11.1                             |
| Simulator - tvOS 13.2                  | appletvsimulator13.2                   | 11.2, 11.2.1, 11.3, 11.3.1             |
| watchOS 4.3                            | watchos4.3                             | 9.4.1                                  |
| watchOS 5.0                            | watchos5.0                             | 10.0                                   |
| watchOS 5.1                            | watchos5.1                             | 10.1                                   |
| watchOS 5.2                            | watchos5.2                             | 10.2, 10.2.1                           |
| watchOS 5.3                            | watchos5.3                             | 10.3                                   |
| watchOS 6.0                            | watchos6.0                             | 11.0, 11.1                             |
| watchOS 6.1                            | watchos6.1                             | 11.2, 11.2.1, 11.3, 11.3.1             |
| Simulator - watchOS 4.3                | watchsimulator4.3                      | 9.4.1                                  |
| Simulator - watchOS 5.0                | watchsimulator5.0                      | 10.0                                   |
| Simulator - watchOS 5.1                | watchsimulator5.1                      | 10.1                                   |
| Simulator - watchOS 5.2                | watchsimulator5.2                      | 10.2, 10.2.1                           |
| Simulator - watchOS 5.3                | watchsimulator5.3                      | 10.3                                   |
| Simulator - watchOS 6.0                | watchsimulator6.0                      | 11.0, 11.1                             |
| Simulator - watchOS 6.1                | watchsimulator6.1                      | 11.2, 11.2.1, 11.3, 11.3.1             |
| DriverKit 19.0                         | driverkit.macosx19.0                   | 11.0, 11.1, 11.2, 11.2.1, 11.3, 11.3.1 |

#### Installed Simulators
| OS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Xcode Version                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | Simulators                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| iOS 8.4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | 9.4.1<br>10.0<br>10.1<br>10.2<br>10.2.1<br>10.3<br>11.0<br>11.1<br>11.2<br>11.2.1<br>11.3<br>11.3.1                                                                                                                                                                                                                                                                                                                                                                                         | iPhone 4s<br>iPhone 5<br>iPhone 5s<br>iPhone 6 Plus<br>iPhone 6<br>iPad 2<br>iPad Retina<br>iPad Air                                                                                                                                                                                                                                                                                                                                                                                        |
| iOS 9.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | 9.4.1<br>10.0<br>10.1<br>10.2<br>10.2.1<br>10.3<br>11.0<br>11.1<br>11.2<br>11.2.1<br>11.3<br>11.3.1                                                                                                                                                                                                                                                                                                                                                                                         | iPhone 4s<br>iPhone 5<br>iPhone 5s<br>iPhone 6 Plus<br>iPhone 6<br>iPhone 6s<br>iPhone 6s Plus<br>iPad 2<br>iPad Retina<br>iPad Air<br>iPad Air 2                                                                                                                                                                                                                                                                                                                                           |
| iOS 9.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | 9.4.1<br>10.0<br>10.1<br>10.2<br>10.2.1<br>10.3<br>11.0<br>11.1<br>11.2<br>11.2.1<br>11.3<br>11.3.1                                                                                                                                                                                                                                                                                                                                                                                         | iPhone 4s<br>iPhone 5<br>iPhone 5s<br>iPhone 6 Plus<br>iPhone 6<br>iPhone 6s<br>iPhone 6s Plus<br>iPad 2<br>iPad Retina<br>iPad Air<br>iPad Air 2<br>iPad Pro                                                                                                                                                                                                                                                                                                                               |
| iOS 9.2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | 9.4.1<br>10.0<br>10.1<br>10.2<br>10.2.1<br>10.3<br>11.0<br>11.1<br>11.2<br>11.2.1<br>11.3<br>11.3.1                                                                                                                                                                                                                                                                                                                                                                                         | iPhone 4s<br>iPhone 5<br>iPhone 5s<br>iPhone 6 Plus<br>iPhone 6<br>iPhone 6s<br>iPhone 6s Plus<br>iPad 2<br>iPad Retina<br>iPad Air<br>iPad Air 2<br>iPad Pro                                                                                                                                                                                                                                                                                                                               |
| iOS 9.3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | 9.4.1<br>10.0<br>10.1<br>10.2<br>10.2.1<br>10.3<br>11.0<br>11.1<br>11.2<br>11.2.1<br>11.3<br>11.3.1                                                                                                                                                                                                                                                                                                                                                                                         | iPhone 4s<br>iPhone 5<br>iPhone 5s<br>iPhone 6 Plus<br>iPhone 6<br>iPhone 6s<br>iPhone 6s Plus<br>iPad 2<br>iPad Retina<br>iPad Air<br>iPad Air 2<br>iPad Pro                                                                                                                                                                                                                                                                                                                               |
| iOS 10.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 9.4.1<br>10.0<br>10.1<br>10.2<br>10.2.1<br>10.3<br>11.0<br>11.1<br>11.2<br>11.2.1<br>11.3<br>11.3.1                                                                                                                                                                                                                                                                                                                                                                                         | iPhone 5<br>iPhone 5s<br>iPhone 6 Plus<br>iPhone 6<br>iPhone 6s<br>iPhone 6s Plus<br>iPhone SE<br>iPad Air<br>iPad Air 2<br>iPad Pro (9.7 inch)<br>iPad Pro (12.9 inch)                                                                                                                                                                                                                                                                                                                     |
| iOS 10.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 9.4.1<br>10.0<br>10.1<br>10.2<br>10.2.1<br>10.3<br>11.0<br>11.1<br>11.2<br>11.2.1<br>11.3<br>11.3.1                                                                                                                                                                                                                                                                                                                                                                                         | iPhone 5<br>iPhone 5s<br>iPhone 6 Plus<br>iPhone 6<br>iPhone 6s<br>iPhone 6s Plus<br>iPhone SE<br>iPhone 7<br>iPhone 7 Plus<br>iPad Air<br>iPad Air 2<br>iPad Pro (9.7 inch)<br>iPad Pro (12.9 inch)                                                                                                                                                                                                                                                                                        |
| iOS 10.2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 9.4.1<br>10.0<br>10.1<br>10.2<br>10.2.1<br>10.3<br>11.0<br>11.1<br>11.2<br>11.2.1<br>11.3<br>11.3.1                                                                                                                                                                                                                                                                                                                                                                                         | iPhone 5<br>iPhone 5s<br>iPhone 6 Plus<br>iPhone 6<br>iPhone 6s<br>iPhone 6s Plus<br>iPhone SE<br>iPhone 7<br>iPhone 7 Plus<br>iPad Air<br>iPad Air 2<br>iPad Pro (9.7 inch)<br>iPad Pro (12.9 inch)                                                                                                                                                                                                                                                                                        |
| iOS 11.4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 9.4.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | iPhone 5s<br>iPhone 6 Plus<br>iPhone 6<br>iPhone 6s<br>iPhone 6s Plus<br>iPhone SE<br>iPhone 7<br>iPhone 7 Plus<br>iPhone X<br>iPhone 8<br>iPhone 8 Plus<br>iPad Air<br>iPad Air 2<br>iPad Pro (9.7-inch)<br>iPad Pro (12.9-inch)<br>iPad (5th generation)<br>iPad Pro (12.9-inch) (2nd generation)<br>iPad Pro (10.5-inch)                                                                                                                                                                 |
| iOS 12.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 10.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | iPhone 5s<br>iPhone 6 Plus<br>iPhone 6<br>iPhone 6s<br>iPhone 6s Plus<br>iPhone SE<br>iPhone 7<br>iPhone 7 Plus<br>iPhone 8<br>iPhone 8 Plus<br>iPhone X<br>iPhone XS<br>iPhone XS Max<br>iPhone XR<br>iPad Air<br>iPad Air 2<br>iPad Pro (9.7-inch)<br>iPad Pro (12.9-inch)<br>iPad (5th generation)<br>iPad Pro (12.9-inch) (2nd generation)<br>iPad Pro (10.5-inch)<br>iPad (6th generation)                                                                                             |
| iOS 12.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 10.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | iPhone 5s<br>iPhone 6 Plus<br>iPhone 6<br>iPhone 6s<br>iPhone 6s Plus<br>iPhone SE<br>iPhone 7<br>iPhone 7 Plus<br>iPhone 8<br>iPhone 8 Plus<br>iPhone X<br>iPhone XS<br>iPhone XS Max<br>iPhone XR<br>iPad Air<br>iPad Air 2<br>iPad Pro (9.7-inch)<br>iPad Pro (12.9-inch)<br>iPad (5th generation)<br>iPad Pro (12.9-inch) (2nd generation)<br>iPad Pro (10.5-inch)<br>iPad (6th generation)<br>iPad Pro (11-inch)<br>iPad Pro (12.9-inch) (3rd generation)                              |
| iOS 12.2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 10.2<br>10.2.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | iPhone 5s<br>iPhone 6 Plus<br>iPhone 6<br>iPhone 6s<br>iPhone 6s Plus<br>iPhone SE<br>iPhone 7<br>iPhone 7 Plus<br>iPhone 8<br>iPhone 8 Plus<br>iPhone X<br>iPhone Xs<br>iPhone Xs Max<br>iPhone Xʀ<br>iPad Air<br>iPad Air 2<br>iPad Pro (9.7-inch)<br>iPad Pro (12.9-inch)<br>iPad (5th generation)<br>iPad Pro (12.9-inch) (2nd generation)<br>iPad Pro (10.5-inch)<br>iPad (6th generation)<br>iPad Pro (11-inch)<br>iPad Pro (12.9-inch) (3rd generation)<br>iPad Air (3rd generation) |
| iOS 12.4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 10.3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | iPhone 5s<br>iPhone 6 Plus<br>iPhone 6<br>iPhone 6s<br>iPhone 6s Plus<br>iPhone SE<br>iPhone 7<br>iPhone 7 Plus<br>iPhone 8<br>iPhone 8 Plus<br>iPhone X<br>iPhone Xs<br>iPhone Xs Max<br>iPhone Xʀ<br>iPad Air<br>iPad Air 2<br>iPad Pro (9.7-inch)<br>iPad Pro (12.9-inch)<br>iPad (5th generation)<br>iPad Pro (12.9-inch) (2nd generation)<br>iPad Pro (10.5-inch)<br>iPad (6th generation)<br>iPad Pro (11-inch)<br>iPad Pro (12.9-inch) (3rd generation)<br>iPad Air (3rd generation) |
| iOS 13.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 11.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | iPhone 8<br>iPhone 8 Plus<br>iPhone 11<br>iPhone 11 Pro<br>iPhone 11 Pro Max<br>iPad Pro (9.7-inch)<br>iPad Pro (11-inch)<br>iPad Pro (12.9-inch) (3rd generation)<br>iPad Air (3rd generation)                                                                                                                                                                                                                                                                                             |
| iOS 13.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 11.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | iPhone 8<br>iPhone 8 Plus<br>iPhone 11<br>iPhone 11 Pro<br>iPhone 11 Pro Max<br>iPad Pro (9.7-inch)<br>iPad Pro (11-inch)<br>iPad Pro (12.9-inch) (3rd generation)<br>iPad Air (3rd generation)                                                                                                                                                                                                                                                                                             |
| iOS 13.2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 11.2<br>11.2.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | iPhone 8<br>iPhone 8 Plus<br>iPhone 11<br>iPhone 11 Pro<br>iPhone 11 Pro Max<br>iPad Pro (9.7-inch)<br>iPad (7th generation)<br>iPad Pro (11-inch)<br>iPad Pro (12.9-inch) (3rd generation)<br>iPad Air (3rd generation)                                                                                                                                                                                                                                                                    |
| iOS 13.3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 11.3<br>11.3.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | iPhone 8<br>iPhone 8 Plus<br>iPhone 11<br>iPhone 11 Pro<br>iPhone 11 Pro Max<br>iPad Pro (9.7-inch)<br>iPad (7th generation)<br>iPad Pro (11-inch)<br>iPad Pro (12.9-inch) (3rd generation)<br>iPad Air (3rd generation)                                                                                                                                                                                                                                                                    |
| tvOS 11.4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | 9.4.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Apple TV<br>Apple TV 4K<br>Apple TV 4K (at 1080p)                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| tvOS 12.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | 10.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Apple TV<br>Apple TV 4K<br>Apple TV 4K (at 1080p)                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| tvOS 12.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | 10.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Apple TV<br>Apple TV 4K<br>Apple TV 4K (at 1080p)                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| tvOS 12.2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | 10.2<br>10.2.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Apple TV<br>Apple TV 4K<br>Apple TV 4K (at 1080p)                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| tvOS 12.4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | 10.3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Apple TV<br>Apple TV 4K<br>Apple TV 4K (at 1080p)                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| tvOS 13.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | 11.0<br>11.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Apple TV<br>Apple TV 4K<br>Apple TV 4K (at 1080p)                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| tvOS 13.2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | 11.2<br>11.2.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Apple TV<br>Apple TV 4K<br>Apple TV 4K (at 1080p)                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| tvOS 13.3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | 11.3<br>11.3.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Apple TV<br>Apple TV 4K<br>Apple TV 4K (at 1080p)                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| watchOS 4.3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | 9.4.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Apple Watch - 38mm<br>Apple Watch - 42mm<br>Apple Watch Series 2 - 38mm<br>Apple Watch Series 2 - 42mm<br>Apple Watch Series 3 - 38mm<br>Apple Watch Series 3 - 42mm                                                                                                                                                                                                                                                                                                                        |
| watchOS 5.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | 10.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Apple Watch Series 2 - 38mm<br>Apple Watch Series 2 - 42mm<br>Apple Watch Series 3 - 38mm<br>Apple Watch Series 3 - 42mm<br>Apple Watch Series 4 - 40mm<br>Apple Watch Series 4 - 44mm                                                                                                                                                                                                                                                                                                      |
| watchOS 5.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | 10.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Apple Watch Series 2 - 38mm<br>Apple Watch Series 2 - 42mm<br>Apple Watch Series 3 - 38mm<br>Apple Watch Series 3 - 42mm<br>Apple Watch Series 4 - 40mm<br>Apple Watch Series 4 - 44mm                                                                                                                                                                                                                                                                                                      |
| watchOS 5.2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | 10.2<br>10.2.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Apple Watch Series 2 - 38mm<br>Apple Watch Series 2 - 42mm<br>Apple Watch Series 3 - 38mm<br>Apple Watch Series 3 - 42mm<br>Apple Watch Series 4 - 40mm<br>Apple Watch Series 4 - 44mm                                                                                                                                                                                                                                                                                                      |
| watchOS 5.3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | 10.3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Apple Watch Series 2 - 38mm<br>Apple Watch Series 2 - 42mm<br>Apple Watch Series 3 - 38mm<br>Apple Watch Series 3 - 42mm<br>Apple Watch Series 4 - 40mm<br>Apple Watch Series 4 - 44mm                                                                                                                                                                                                                                                                                                      |
| watchOS 6.0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | 11.0<br>11.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Apple Watch Series 4 - 40mm<br>Apple Watch Series 4 - 44mm<br>Apple Watch Series 5 - 40mm<br>Apple Watch Series 5 - 44mm                                                                                                                                                                                                                                                                                                                                                                    |
| watchOS 6.1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | 11.2<br>11.2.1<br>11.3<br>11.3.1                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Apple Watch Series 4 - 40mm<br>Apple Watch Series 4 - 44mm<br>Apple Watch Series 5 - 40mm<br>Apple Watch Series 5 - 44mm                                                                                                                                                                                                                                                                                                                                                                    |

### Android
#### Android SDK Tools
| Package Name                       | Description                        |
| ---------------------------------- | ---------------------------------- |
| tools                              | Android SDK Tools, Revision 26.1.1 |

#### Android SDK Platform-Tools
| Package Name                                | Description                                 |
| ------------------------------------------- | ------------------------------------------- |
| platform-tools                              | Android SDK Platform-Tools, Revision 29.0.5 |

#### Android SDK Platforms
| Package Name                        | Description                         |
| ----------------------------------- | ----------------------------------- |
| android-15                          | Android SDK Platform 15, Revision 5 |
| android-16                          | Android SDK Platform 16, Revision 5 |
| android-17                          | Android SDK Platform 17, Revision 3 |
| android-18                          | Android SDK Platform 18, Revision 3 |
| android-19                          | Android SDK Platform 19, Revision 4 |
| android-20                          | Android SDK Platform 20, Revision 2 |
| android-21                          | Android SDK Platform 21, Revision 2 |
| android-22                          | Android SDK Platform 22, Revision 2 |
| android-23                          | Android SDK Platform 23, Revision 3 |
| android-24                          | Android SDK Platform 24, Revision 2 |
| android-25                          | Android SDK Platform 25, Revision 3 |
| android-26                          | Android SDK Platform 26, Revision 2 |
| android-27                          | Android SDK Platform 27, Revision 3 |
| android-28                          | Android SDK Platform 28, Revision 6 |
| android-29                          | Android SDK Platform 29, Revision 4 |

#### Android SDK Build-Tools
| Package Name                             | Description                              |
| ---------------------------------------- | ---------------------------------------- |
| build-tools-19.1.0                       | Android SDK Build-Tools, Revision 19.1.0 |
| build-tools-20.0.0                       | Android SDK Build-Tools, Revision 20.0.0 |
| build-tools-21.1.2                       | Android SDK Build-Tools, Revision 21.1.2 |
| build-tools-22.0.1                       | Android SDK Build-Tools, Revision 22.0.1 |
| build-tools-23.0.1                       | Android SDK Build-Tools, Revision 23.0.1 |
| build-tools-23.0.2                       | Android SDK Build-Tools, Revision 23.0.2 |
| build-tools-23.0.3                       | Android SDK Build-Tools, Revision 23.0.3 |
| build-tools-24.0.0                       | Android SDK Build-Tools, Revision 24.0.0 |
| build-tools-24.0.1                       | Android SDK Build-Tools, Revision 24.0.1 |
| build-tools-24.0.2                       | Android SDK Build-Tools, Revision 24.0.2 |
| build-tools-24.0.3                       | Android SDK Build-Tools, Revision 24.0.3 |
| build-tools-25.0.0                       | Android SDK Build-Tools, Revision 25.0.0 |
| build-tools-25.0.1                       | Android SDK Build-Tools, Revision 25.0.1 |
| build-tools-25.0.2                       | Android SDK Build-Tools, Revision 25.0.2 |
| build-tools-25.0.3                       | Android SDK Build-Tools, Revision 25.0.3 |
| build-tools-26.0.0                       | Android SDK Build-Tools, Revision 26.0.0 |
| build-tools-26.0.1                       | Android SDK Build-Tools, Revision 26.0.1 |
| build-tools-26.0.2                       | Android SDK Build-Tools, Revision 26.0.2 |
| build-tools-26.0.3                       | Android SDK Build-Tools, Revision 26.0.3 |
| build-tools-27.0.0                       | Android SDK Build-Tools, Revision 27.0.0 |
| build-tools-27.0.1                       | Android SDK Build-Tools, Revision 27.0.1 |
| build-tools-27.0.2                       | Android SDK Build-Tools, Revision 27.0.2 |
| build-tools-27.0.3                       | Android SDK Build-Tools, Revision 27.0.3 |
| build-tools-28.0.0                       | Android SDK Build-Tools, Revision 28.0.0 |
| build-tools-28.0.1                       | Android SDK Build-Tools, Revision 28.0.1 |
| build-tools-28.0.2                       | Android SDK Build-Tools, Revision 28.0.2 |
| build-tools-28.0.3                       | Android SDK Build-Tools, Revision 28.0.3 |
| build-tools-29.0.0                       | Android SDK Build-Tools, Revision 29.0.0 |
| build-tools-29.0.1                       | Android SDK Build-Tools, Revision 29.0.1 |
| build-tools-29.0.2                       | Android SDK Build-Tools, Revision 29.0.2 |

#### Android Utils
| Package Name     | Version          |
| ---------------- | ---------------- |
| cmake            | 3.6.4111459      |
| lldb             | 3.1.4508709      |
| ndk-bundle       | 18.1.5063045     |
| Android Emulator | 29.3.4           |

#### Android Google APIs
| Package Name                | Description                 |
| --------------------------- | --------------------------- |
| addon-google_apis-google-21 | Google APIs, Revision 1     |
| addon-google_apis-google-22 | Google APIs, Revision 1     |
| addon-google_apis-google-23 | Google APIs, Revision 1     |
| addon-google_apis-google-24 | Google APIs, Revision 1     |

#### Extra Packages
| Package Name                                    | Version                                         |
| ----------------------------------------------- | ----------------------------------------------- |
| Android Support Repository                      | 47.0.0                                          |
| Google Play services                            | 49                                              |
| Google Repository                               | 58                                              |
| Intel x86 Emulator Accelerator (HAXM installer) | 7.5.1                                           |


