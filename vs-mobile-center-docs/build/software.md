---
title: App Center Cloud Build Machines
description: Software used on build machines
keywords: build
author: siminapasat
ms.author: siminap
ms.date: 12/6/2017
ms.topic: article
ms.assetid: 1d1f2f48-1e6c-45da-8cad-0e25200abd98
ms.service: vs-appcenter
ms.custom: build
---

# Cloud Build Machines

Each build is run on a separate, clean virtual machine and no other user has access to this virtual machine. Once the build is completed, the virtual machine is discarded and all files removed. The files resulting from the build (log files, application files, symbol files) are stored on App Center servers.

## Operating System

Builds for iOS and Android apps (including Xamarin and React Native platforms) are run on macOS VMs running the following configuration:

- OS X 10.12.6 (16G29)

Builds for UWP apps are run on [Hosted Windows Agents](https://www.visualstudio.com/en-us/docs/build/concepts/agents/hosted).


## Installed Software

### Language and Runtime
- Java 1.8.0_152
- Node.js v6.12.0
- PowerShell v6.0.0-rc
- Python 2.7.10
- Ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-darwin16]
- .NET Core SDK 2.0.0

### Package Management

- Bundler 1.16.0
- Carthage 0.26.2
- CocoaPods 1.3.1
- Homebrew 1.3.8
- Homebrew/homebrew-core (git revision 4d0c54; last commit 2017-12-01)
- NPM 3.10.10
- Yarn 1.3.2
- NuGet: 4.3.0

### Project Management

- Apache Maven 3.5.2
- Gradle 4.3.1

### Utilities

- curl 7.54.0 (x86_64-apple-darwin16.0) libcurl/7.54.0 SecureTransport zlib/1.2.8
- Git 2.15.1
- Git LFS 2.3.4
- GNU Wget 1.19.2 built on darwin16.7.0

### Tools

- fastlane 2.68.0
- App Center CLI 1.0.5

## Xcode

- Xcode 9.1
- Xcode 9.0.1
- Xcode 9.0
- Xcode 8.3.3
- Xcode 8.3.2
- Xcode 8.3.1
- Xcode 8.2.1
- Xcode 8.2
- Xcode 8.1
- Xcode 8.0

### Xcode Support Tools

- Nomad CLI 2.6.14
- Nomad CLI IPA ipa 0.14.3
- xcpretty 0.2.8
- xctool 0.3.4

### Installed SDKs

- macOS 10.12               `-sdk macosx10.12`
- macOS 10.13               `-sdk macosx10.13`
- iOS 10.0                  `-sdk iphoneos10.0`
- iOS 10.1                  `-sdk iphoneos10.1`
- iOS 10.2                  `-sdk iphoneos10.2`
- iOS 10.3                  `-sdk iphoneos10.3`
- iOS 11.0                  `-sdk iphoneos11.0`
- iOS 11.1                  `-sdk iphoneos11.1`
- iOS Simulator 10.0        `-sdk iphonesimulator10.0`
- iOS Simulator 10.1        `-sdk iphonesimulator10.1`
- iOS Simulator 10.2        `-sdk iphonesimulator10.2`
- iOS Simulator 10.3        `-sdk iphonesimulator10.3`
- iOS Simulator 11.0        `-sdk iphonesimulator11.0`
- iOS Simulator 11.1        `-sdk iphonesimulator11.1`
- tvOS 10.0                 `-sdk appletvos10.0`
- tvOS 10.1                 `-sdk appletvos10.1`
- tvOS 10.2                 `-sdk appletvos10.2`
- tvOS 11.0                  `-sdk appletvos11.0`
- tvOS 11.1                  `-sdk appletvos11.1`
- tvOS Simulator 10.0       `-sdk appletvsimulator10.0`
- tvOS Simulator 10.1       `-sdk appletvsimulator10.1`
- tvOS Simulator 10.2       `-sdk appletvsimulator10.2`
- tvOS Simulator 11.0       `-sdk appletvsimulator11.0`
- tvOS Simulator 11.1       `-sdk appletvsimulator11.1`
- watchOS 3.0               `-sdk watchos3.0`
- watchOS 3.1               `-sdk watchos3.1`
- watchOS 3.2               `-sdk watchos3.2`
- watchOS 4.0               `-sdk watchos4.0`
- watchOS 4.1               `-sdk watchos4.1`
- watchOS Simulator 3.0     `-sdk watchsimulator3.0`
- watchOS Simulator 3.1     `-sdk watchsimulator3.1`
- watchOS Simulator 3.2     `-sdk watchsimulator3.2`
- watchOS Simulator 4.0     `-sdk watchsimulator4.0`
- watchOS Simulator 4.1     `-sdk watchsimulator4.1`

### Installed Simulators

#### Device Types

```
iPhone 4s (com.apple.CoreSimulator.SimDeviceType.iPhone-4s)
iPhone 5 (com.apple.CoreSimulator.SimDeviceType.iPhone-5)
iPhone 5s (com.apple.CoreSimulator.SimDeviceType.iPhone-5s)
iPhone 6 (com.apple.CoreSimulator.SimDeviceType.iPhone-6)
iPhone 6 Plus (com.apple.CoreSimulator.SimDeviceType.iPhone-6-Plus)
iPhone 6s (com.apple.CoreSimulator.SimDeviceType.iPhone-6s)
iPhone 6s Plus (com.apple.CoreSimulator.SimDeviceType.iPhone-6s-Plus)
iPhone 7 (com.apple.CoreSimulator.SimDeviceType.iPhone-7)
iPhone 7 Plus (com.apple.CoreSimulator.SimDeviceType.iPhone-7-Plus)
iPhone 8 (com.apple.CoreSimulator.SimDeviceType.iPhone-8)
iPhone 8 Plus (com.apple.CoreSimulator.SimDeviceType.iPhone-8-Plus)
iPhone SE (com.apple.CoreSimulator.SimDeviceType.iPhone-SE)
iPhone X (com.apple.CoreSimulator.SimDeviceType.iPhone-X)
iPad 2 (com.apple.CoreSimulator.SimDeviceType.iPad-2)
iPad Retina (com.apple.CoreSimulator.SimDeviceType.iPad-Retina)
iPad Air (com.apple.CoreSimulator.SimDeviceType.iPad-Air)
iPad Air 2 (com.apple.CoreSimulator.SimDeviceType.iPad-Air-2)
iPad (5th generation) (com.apple.CoreSimulator.SimDeviceType.iPad--5th-generation-)
iPad Pro (9.7-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--9-7-inch-)
iPad Pro (12.9-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro)
iPad Pro (12.9-inch) (2nd generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--12-9-inch---2nd-generation-)
iPad Pro (10.5-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--10-5-inch-)
Apple TV (com.apple.CoreSimulator.SimDeviceType.Apple-TV-1080p)
Apple TV 4K (com.apple.CoreSimulator.SimDeviceType.Apple-TV-4K-4K)
Apple TV 4K (at 1080p) (com.apple.CoreSimulator.SimDeviceType.Apple-TV-4K-1080p)
Apple Watch - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-38mm)
Apple Watch - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-42mm)
Apple Watch Series 2 - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-2-38mm)
Apple Watch Series 2 - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-2-42mm)
Apple Watch Series 3 - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-3-38mm)
Apple Watch Series 3 - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-3-42mm)
```

#### Runtimes
```
iOS 8.4 (8.4 - 12H141) - com.apple.CoreSimulator.SimRuntime.iOS-8-4
iOS 9.0 (9.0 - 13A344) - com.apple.CoreSimulator.SimRuntime.iOS-9-0
iOS 9.1 (9.1 - 13B143) - com.apple.CoreSimulator.SimRuntime.iOS-9-1
iOS 9.2 (9.2 - 13C75) - com.apple.CoreSimulator.SimRuntime.iOS-9-2
iOS 9.3 (9.3 - 13E233) - com.apple.CoreSimulator.SimRuntime.iOS-9-3
iOS 10.0 (10.0 - 14A345) - com.apple.CoreSimulator.SimRuntime.iOS-10-0
iOS 10.1 (10.1 - 14B72) - com.apple.CoreSimulator.SimRuntime.iOS-10-1
iOS 10.2 (10.2 - 14C89) - com.apple.CoreSimulator.SimRuntime.iOS-10-2
iOS 11.1 (11.1 - 15B87) - com.apple.CoreSimulator.SimRuntime.iOS-11-1
tvOS 11.1 (11.1 - 15J580) - com.apple.CoreSimulator.SimRuntime.tvOS-11-1
watchOS 4.1 (4.1 - 15R844) - com.apple.CoreSimulator.SimRuntime.watchOS-4-1
```

#### Devices

#### iOS 8.4 
```
iPhone 4s (003A9886-A065-4C11-AB93-5CEA89B6EBE8)
iPhone 5 (247A5588-E709-4C99-AEDE-07659F0BF6F7) 
iPhone 5s (7921B981-AFCE-4068-9A11-99D84A6DB8BB)
iPhone 6 (D4B23380-51BE-4D38-B9DF-F374DE19DE48) 
iPhone 6 Plus (27362F97-7E06-4995-89A9-2EF67ACAB025)
iPad 2 (C898EA54-F080-446E-A804-1AF8D45578C9)
iPad Retina (43628972-D389-45CD-9052-F5590CC1BC75)
iPad Air (BE615B4D-5274-4331-BCA1-24485D698164) 
```

#### iOS 9.0 
```
iPhone 4s (3E75C4CC-D2FC-4586-946C-05D31725C283)
iPhone 5 (84FA8CAB-026D-4AC1-9D59-2A2D53674746)
iPhone 5s (EB8949DC-77F3-4F67-A634-DA86DD440DD8)
iPhone 6 (9C30CE39-E680-4A44-AC66-76AFE4CBFD44)
iPhone 6 Plus (7FCFA2D0-6959-4E9D-A833-BCAF4E148ABEn)
iPhone 6s (E9C60FAE-AAD0-4EB2-A338-BF814902889F)
iPhone 6s Plus (3752B0DC-04C7-40BC-859C-0CA07CEC8175)
iPad 2 (0C1A5698-2173-4FD1-B2A5-CF81E5728958)
iPad Retina (FF3510F2-96D7-408B-90BF-72A87835F779) 
iPad Air (B5A783C0-49F5-48C1-A6BA-6B8565F91680)
iPad Air 2 (806374E4-5F48-49CB-8847-D3B70F87F787)
```

#### iOS 9.1
```
iPhone 4s (62E09CD9-7EB2-4A1A-B2AE-812C40373DED)
iPhone 5 (7DF97178-E792-494D-B7E5-84F9B59FB703)
iPhone 5s (AE6C0989-63A6-43C4-A44E-7232A8A3BE69)
iPhone 6 (B4A1813E-23EF-48FD-AC1C-19497C7B9730)
iPhone 6 Plus (81108D9E-2449-4C2A-AC27-14BA63584F1D)
iPhone 6s (F3A74CAB-370C-4EED-9FD5-C4D983DFE148)
iPhone 6s Plus (9C48F742-E484-4AD1-B309-99A40438F290)
iPad 2 (5B9673B0-F320-468F-8AF4-B04FB6A52147)
iPad Retina (F747F9C9-BA3C-4925-8AA6-EF84207A343E)
iPad Air (562D7B6E-D9CD-4BA7-B9DD-B78016D1486A)
iPad Air 2 (49EB0378-199A-4ACB-9B9B-B3C8E208714F)
iPad Pro (CBD4ABCC-D7D8-4D6F-916F-ABB514760B54)
```

#### iOS 9.2 
```
iPhone 4s (97D18836-27BF-49B3-8E3E-32F3CC0256F3)
iPhone 5 (8A95B10D-9100-48C5-A1F8-8F6E9BED3445)
iPhone 5s (31C39583-DD12-4D6A-B39E-12CAC6BD9BF8)
iPhone 6 (D5B0C259-CB60-4604-8DA0-5771D0869140)
iPhone 6 Plus (BCE182E2-952A-4D33-B352-44502BC11791)
iPhone 6s (1E6F2161-969B-4F3F-A5CC-250DDD1465B0)
iPhone 6s Plus (5F9D3152-47E6-4C5A-B243-9B06D2369D35)
iPad 2 (A7F20270-B056-4438-AEA0-3824243ECCE8)
iPad Retina (A0D342A9-B38C-4E9C-AFBA-AFB15616D9F1)
iPad Air (95BBE84E-5E1A-4661-AC85-4B21FF4ED6DE)
iPad Air 2 (7CCA7694-47A2-423F-929D-103025000918)
iPad Pro (3A93BFA8-6816-4C5B-A830-CD0E4332592F)
```

##### iOS 9.3 
```
iPhone 4s (F80998AC-E555-40B8-933A-ED453C1C236A)
iPhone 5 (F2F35016-53B1-4EB1-843D-A2DFB659C470)
iPhone 5s (B01BD29A-2A36-4ECF-AE37-FE2729D0BA22)
iPhone 6 (13DC21B7-10B8-400B-9382-8C929CEEC738)
iPhone 6 Plus (787CF016-6BC8-41CC-9799-02D627095B72)
iPhone 6s (7A4036D7-CBEB-4015-90AF-A77DF4CAEBDE)
iPhone 6s Plus (AF311025-CEAE-4914-B69B-50BDEECE875A)
iPad 2 (66BF8ECB-F656-4484-B8B6-F9727F586D0D)
iPad Retina (8C610C05-4666-4F00-8F04-CE085B490500)
iPad Air (8F59C6F0-530B-4456-A0E9-059BCC04C7E1)
iPad Air 2 (03688B78-9279-4EB7-B3C8-FEA1751DBA17)
iPad Pro (9ED9265E-1B64-433B-9872-E65BD2D92BFA)
```

##### iOS 10.0
```
iPhone 5 (DD66CD6D-478C-4476-81B2-AD26C33DAC2E)
iPhone 5s (A6178D84-6CA9-45DF-9C3E-991D85A53005)
iPhone 6 (4D5218C4-FA0E-4C23-9246-A1520B71B472)
iPhone 6 Plus (0CAA93A6-045F-472D-8C08-6B3C0141EA75)
iPhone 6s (50AAB5D1-7DD5-4744-B9AF-F78580BDC49A)
iPhone 6s Plus (43442048-FC19-4164-8280-0CB9C0F95EC3)
iPhone 7 (83926D07-ACAC-40F9-A093-D9E421BF376D)
iPhone 7 Plus (CE1234D8-6B22-4928-B1AF-3F4079349C8F)
iPhone SE (8D8F02A4-3017-46BC-929F-E7C788CA5AA8)
iPad Air (AB91B0DD-C37B-462F-A809-14D9E15BEA66)
iPad Air 2 (04C5B6FD-DC21-41AC-8F0C-4E890E8E9AE0)
iPad Pro (9.7 inch) (61118DD6-62C3-4C07-8BB1-D5ED4BF3AFAA)
iPad Pro (12.9 inch) (B8CACF76-4DCD-48A6-A70B-610D98AC15CA)
```

##### iOS 10.1
```
iPhone 5 (606787B9-9ED0-4E92-9216-0774D7113677)
iPhone 5s (F35CFE58-23E7-48BD-A2D4-221854257A7B)
iPhone 6 (F27D48B3-BBF2-4CA9-BD54-9432E7C24D50)
iPhone 6 Plus (BE95395A-9BFC-4529-8D06-6E9941748FC3) 
iPhone 6s (B94AD37F-666E-46FD-BF7A-5115820A0BEF)
iPhone 6s Plus (1334948D-561A-44D9-A817-A37DAEFBF237)
iPhone 7 (5A63D49B-0DC1-43EA-B73C-83A4CEE41CDB)
iPhone 7 Plus (537C4C0A-5C61-4A15-84D4-5D7283295869) 
iPhone SE (028090E3-AE9F-4508-9A23-74B5C19C6A68)
iPad Air (C625ECAA-37FF-49B3-A320-7B6AA096B6D6)
iPad Air 2 (BC3594BE-6A7B-4430-8580-56F69E7A3129)
iPad Pro (9.7 inch) (F8751349-AE9E-4556-B11A-172DBC22506D)
iPad Pro (12.9 inch) (510A31C4-A17A-43E0-91B3-1596E612D6A7)
```

##### iOS 10.2
```
iPhone 5 (EC0A1B4F-974F-45A6-82D8-D63EFA0DF400)
iPhone 5s (BFCEDCCA-0179-450D-9BDA-6C301206F076)
iPhone 6 (89064988-B316-46DF-98E1-51A13FA0922C)
iPhone 6 Plus (CBDB853B-9172-4B25-A6DF-7BBCD10D9DE8)
iPhone 6s (A455F0AB-BFA7-43AE-8A17-7EE0A888B432)
iPhone 6s Plus (1BBACAB9-4A47-4E1C-98E2-38AC64A7DD9F)
iPhone 7 (5D53CA3B-465B-449C-B03E-682A01613FFC)
iPhone 7 Plus (B271CB46-DC48-47D8-B8A8-EB8F1526FF64)
iPhone SE (37FB044B-41DE-4298-B4CA-5706B0D8DC0D)
iPad Air (E9C51C56-7067-434A-A706-59076A8D8EAC)
iPad Air 2 (069FB2A5-401F-4034-9C49-258A836986B2)
iPad Pro (9.7 inch) (9E8476B6-726A-4D8E-A9A6-D7D67F24A8F5)
iPad Pro (12.9 inch) (52867877-1F3A-4256-84D4-24FE5F0F71D2)
```

##### iOS 11.1
```
iPhone 5s (148FB330-DF11-456C-95A1-A0C76777E0AC)
iPhone 6 (521E2854-CA79-4A0E-AB17-8A1E00D45930)
iPhone 6 Plus (5BB81951-2635-4048-8311-310B6FD04BC1)
iPhone 6s (9CD747FD-BAAA-450D-B46E-035AA2255592)
iPhone 6s Plus (DBC5A8D4-E31C-4FF5-ADB3-C139EE3D0DEС)
iPhone 7 (A99E146D-D3A3-48FE-AEA0-C27D2EDDDB98)
iPhone 7 Plus (0DFFD522-797E-491D-8CD8-099FD2F0F5B2)
iPhone 8 (F88504DF-FE9E-4B36-BFA8-326D18D30C62)
iPhone 8 Plus (D4B258BC-7F9B-492C-AC06-B64C37CD46E0)
iPhone SE (0D7F7F32-7CF7-4381-9F16-BCCCC7F83DF9)
iPhone X (6FE7BB7A-81D6-47C4-B7D3-54A71D1A8723)
iPad Air (40FF26BB-ABAC-404B-884B-2E3B963B558C)
iPad Air 2 (2CE678A7-6888-4DDC-82AC-FCE7A2B21578)
iPad (5th generation) (BC6B7083-0BDC-4E02-ABDB-EE97A72AE113)
iPad Pro (9.7-inch) (144F0970-18FE-48BD-8189-681ACACB4839)
iPad Pro (12.9-inch) (66770C85-A201-488C-9086-1283C1ED00D3)
iPad Pro (12.9-inch) (2nd generation) (A5E5D4DE-5E21-419C-8A1E-85C7320DB210)
iPad Pro (10.5-inch) (6171CDA7-733D-4798-8698-133A68CAA0DC)
```

##### tvOS 11.1
```
    Apple TV (CC1E45C2-42AC-486A-8299-36B8978CC78C)
    Apple TV 4K (2809ADCA-29DB-45C1-985A-DDDEBA607FB6)
    Apple TV 4K (at 1080p) (D648D6A6-858F-4E3D-99DE-84BA324F7002)
```

##### watchOS 4.1
```
Apple Watch - 38mm (125A614C-705D-461F-A31F-FCC991B3AE98)
Apple Watch - 42mm (EB2F9301-92A4-47EA-B79C-0133FA224073)
Apple Watch Series 2 - 38mm (6CC25C60-A63A-4CF1-94B8-CDE07426479F)
Apple Watch Series 2 - 42mm (F59570F3-1D75-423E-8845-534F6943528B)
Apple Watch Series 3 - 38mm (E0655C84-43B0-416E-AA8D-5534BC0D2E70)
Apple Watch Series 3 - 42mm (08473C3B-41A8-4373-8FAF-776A1C9F697F)
```

### Device Pairs
```
515B680F-46D4-495A-8159-2DD555881C91
    Watch: Apple Watch Series 2 - 38mm (6CC25C60-A63A-4CF1-94B8-CDE07426479F)
    Phone: iPhone 7 (A99E146D-D3A3-48FE-AEA0-C27D2EDDDB98)
0EE6A287-DC65-491D-8F42-083085445E9A
    Watch: Apple Watch Series 2 - 42mm (F59570F3-1D75-423E-8845-534F6943528B)
    Phone: iPhone 7 Plus (0DFFD522-797E-491D-8CD8-099FD2F0F5B2)
C3753CD7-F6B6-4C15-9A07-50004B40B57F
    Watch: Apple Watch Series 3 - 38mm (E0655C84-43B0-416E-AA8D-5534BC0D2E70)
    Phone: iPhone 8 (F88504DF-FE9E-4B36-BFA8-326D18D30C62)
77B00662-7075-4D2C-B5A2-5C81E6A7091E
    Watch: Apple Watch Series 3 - 42mm (08473C3B-41A8-4373-8FAF-776A1C9F697F)
    Phone: iPhone 8 Plus (D4B258BC-7F9B-492C-AC06-B64C37CD46E0)
    Watch: Apple Watch Series 2 - 38mm (37441FB8-7927-416C-B35B-7A22BB060BCC)
    Phone: iPhone 7 (83926D07-ACAC-40F9-A093-D9E421BF376D)
    Watch: Apple Watch Series 2 - 42mm (1CE03747-B766-445E-BE97-73C9D5E28CF2)
    Phone: iPhone 7 Plus (CE1234D8-6B22-4928-B1AF-3F4079349C8F)
    Watch: Apple Watch - 38mm (4166BBD7-3F18-4CF5-84A3-9307964D08D8)
    Phone: iPhone 6s (5C7D2305-2301-4EB0-8032-C5634531345C)
    Watch: Apple Watch - 42mm (936F9E3D-769C-495F-BCE9-DEAAA4A43657)
    Phone: iPhone 6s Plus (5E044641-EA69-4236-AC36-450E1EEFF5FA)
    Watch: Apple Watch Series 2 - 38mm (75F975C1-8F85-403B-AFCA-9E26BE53D497)
    Phone: iPhone 7 (AFCD4022-89CC-4292-BAD4-06C579C1134B)
    Watch: Apple Watch Series 2 - 42mm (5B12F2E0-892F-442C-80CA-1AF0F27E7816)
    Phone: iPhone 7 Plus (564075FD-9AAF-419E-93C2-70B85BB770CF)
    Watch: Apple Watch Series 2 - 38mm (1FC35AD5-73F1-4349-9B4F-D8C5F43F31EB)
    Phone: iPhone 7 (9E75DF72-7786-4B9A-AC09-2EDD3E85F029)
    Watch: Apple Watch Series 2 - 42mm (11A80BAF-DEA6-45DC-B1C4-02EF57967886)
    Phone: iPhone 7 Plus (E3C15C32-6516-4CD6-9EAB-B8847D4A2BB5)
    Watch: Apple Watch Series 3 - 38mm (BC12ADFB-BE1A-4686-A5E1-F0842AB8DED3)
    Phone: iPhone 8 (DA6DE553-6CD3-4BF2-853E-6343397BC603)
    Watch: Apple Watch Series 3 - 42mm (98FFA4E4-8D2F-4556-9165-BBCB70F10E8A)
    Phone: iPhone 8 Plus (D87FDA68-985D-43B1-B5D3-9C1F31A13635)
    Watch: Apple Watch Series 2 - 38mm (84B7F14C-87FF-4D71-A326-62D0CE4B8F97)
    Phone: iPhone 7 (A9C18B07-67CF-4F3B-B8F6-AF80AD38A5C8)
    Watch: Apple Watch Series 2 - 42mm (3866DE00-1FBD-489A-8BBF-E6B16FD7AC8A)
    Phone: iPhone 7 Plus (348663FC-74FD-4969-BCD7-C73282B32126)
    Watch: Apple Watch Series 3 - 38mm (95968855-1B60-4EF1-9570-0ED6A06B66DC)
    Phone: iPhone 8 (BBB52EEA-C6C0-45FE-9B2E-38EF89C7FD7F)
    Watch: Apple Watch Series 3 - 42mm (35987DAC-2EA4-40D2-8E01-EA837FE40B93)
    Phone: iPhone 8 Plus (8CFAD7DA-BA03-410A-BE67-38FA6B901EFF)
```

## Android

### Android SDK tools

| Package name          | Description                                 |
|-----------------------|---------------------------------------------|
| tools                 | Android SDK Tools, revision 26.1.1          |

### Android SDK Platform-tools

| Package name          | Description                                 |
|-----------------------|---------------------------------------------|
| platform-tools        | Android SDK Platform-tools, revision 26.0.2 |

### Android Platforms

| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| android-15            | Android SDK Platform 15, Revision 5       |
| android-16            | Android SDK Platform 16, Revision 5       |
| android-17            | Android SDK Platform 17, Revision 3       |
| android-18            | Android SDK Platform 18, Revision 3       |
| android-19            | Android SDK Platform 19, Revision 4       |
| android-20            | Android SDK Platform 20, Revision 2       |
| android-21            | Android SDK Platform 21, Revision 2       |
| android-22            | Android SDK Platform 22, Revision 2       |
| android-23            | Android SDK Platform 23, Revision 3       |
| android-24            | Android SDK Platform 24, Revision 2       |
| android-25            | Android SDK Platform 25, Revision 3       |
| android-26            | Android SDK Platform 26, Revision 2       |
| android-27            | Android SDK Platform 27, Revision 1       |

### SDK Build tools

| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| build-tools-19.1.0    | Android SDK Build-tools, Revision 19.1.0  |
| build-tools-20.0.0    | Android SDK Build-tools, Revision 20.0.0  |
| build-tools-21.1.2    | Android SDK Build-tools, Revision 21.1.2  |
| build-tools-22.0.1    | Android SDK Build-tools, Revision 22.0.1  |
| build-tools-23.0.1    | Android SDK Build-tools, Revision 23.0.1  |
| build-tools-23.0.2    | Android SDK Build-tools, Revision 23.0.2  |
| build-tools-23.0.3    | Android SDK Build-tools, Revision 23.0.3  |
| build-tools-24.0.0    | Android SDK Build-tools, Revision 24.0.0  |
| build-tools-24.0.1    | Android SDK Build-tools, Revision 24.0.1  |
| build-tools-24.0.2    | Android SDK Build-tools, Revision 24.0.2  |
| build-tools-24.0.3    | Android SDK Build-tools, Revision 24.0.3  |
| build-tools-25.0.0    | Android SDK Build-tools, Revision 25.0.0  |
| build-tools-25.0.1    | Android SDK Build-tools, Revision 25.0.1  |
| build-tools-25.0.2    | Android SDK Build-tools, Revision 25.0.2  |
| build-tools-25.0.3    | Android SDK Build-tools, Revision 25.0.3  |
| build-tools-26.0.0    | Android SDK Build-tools, Revision 26.0.0  |
| build-tools-26.0.1    | Android SDK Build-tools, Revision 26.0.1  |
| build-tools-26.0.2    | Android SDK Build-tools, Revision 26.0.2  |
| build-tools-26.0.3    | Android SDK Build-tools, Revision 26.0.3  |
| build-tools-27.0.0    | Android SDK Build-tools, Revision 27.0.0  |
| build-tools-27.0.1    | Android SDK Build-tools, Revision 27.0.1  |

### Utils

| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| cmake;3.6.4111459     | 3.6.4111459                               |
| lldb;2.3              | 2.3.3614996                               |
| ndk-bundle            | 16.0.4442984                              |
| ProGuard              | 5.3.3                                     |

### Google APIs

| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| google_apis-google-21 | Google APIs, Android API 21, revision 1   |
| google_apis-google-22 | Google APIs, Android API 22, revision 1   |
| google_apis-google-23 | Google APIs, Android API 23, revision 1   |
| google_apis-google-24 | Google APIs, Android API 24, revision 1   |

### Extra packages

| Package name                      | Description                              |
|-----------------------------------|------------------------------------------|
| extra-android-m2repository        | Android Support Repository, revision 47  |
| extra-google-google_play_services | Google Play services, revision 46        |
| extra-google-m2repository         | Google Repository, revision 58           |

## Xamarin

### Visual Studio for Mac

- 7.2.2.11

### Mono

- Mono Version: 5.4.1.6
- Mono Version: 5.4.0.201
- Mono Version: 5.2.0.224
- Mono Version: 5.0.1.1
- Mono Version: 4.8.1.0

### Xamarin.iOS SDK

- Xamarin.iOS SDK Version: 11.3.0.47
- Xamarin.iOS SDK Version: 11.2.0.11
- Xamarin.iOS SDK Version: 11.0.0.0
- Xamarin.iOS SDK Version: 10.10.0.36
- Xamarin.iOS SDK Version: 10.6.0.10

### Xamarin.Android SDK

- Xamarin.Android SDK Version: 8.0.2-1
- Xamarin.Android SDK Version: 8.0.0-33
- Xamarin.Android SDK Version: 7.4.5-1
- Xamarin.Android SDK Version: 7.3.1-2
- Xamarin.Android SDK Version: 7.1.0-43

### Xamarin.Mac SDK

- Xamarin.Mac SDK Version: 3.8.1.0
- Xamarin.Mac SDK Version: 3.8.0.49
- Xamarin.Mac SDK Version: 3.6.3.3
- Xamarin.Mac SDK Version: 3.4.0.36
- Xamarin.Mac SDK Version: 3.0.0.398

### Unit Test Framework

- NUnit: 3.6.1