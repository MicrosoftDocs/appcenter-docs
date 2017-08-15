---
title: Mobile Center Cloud Build Machines
description: Software used on build machines
keywords: build
author: siminapasat
ms.author: siminap
ms.date: 08/11/2017
ms.topic: article
ms.assetid: 1d1f2f48-1e6c-45da-8cad-0e25200abd98
ms.service: mobile-center
ms.custom: build
---

# Cloud Build Machines

Each build is run on a separate, clean virtual machine and no other user has access to this virtual machine. Once the build is completed, the virtual machine is discarded and all files removed. The files resulting from the build (log files, application files, symbol files) are stored on Mobile Center servers.

## Operating System

Builds for iOS and Android apps (including Xamarin and React Native platforms) are run on macOS VMs running the following configuration:

- OS X 10.12.6 (16G29)

Builds for UWP apps are run on [Hosted Windows Agents](https://www.visualstudio.com/en-us/docs/build/concepts/agents/hosted).

## Installed Software

### Language and Runtime

- Java 1.8.0_131-b11
- Node.js v6.11.2
- Python 2.7.10
- Ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin16]

### Package Management

- Bundler 1.15.3
- Carthage 0.24.0
- CocoaPods 1.3.0
- Homebrew 1.3.0
- Homebrew/homebrew-core (git revision 7c05; last commit 2017-08-04)
- NPM 3.10.10
- Yarn 0.21.3

### Project Management

- Apache Maven 3.5.0
- Gradle 4.0.2

### Utilities

- curl 7.54.0 (x86_64-apple-darwin16.0) libcurl/7.54.0 SecureTransport zlib/1.2.8
- Git 2.14.1
- Git LFS 2.1.1
- GNU Wget 1.19.1 built on darwin16.6.0

### Tools

- fastlane 2.50.1
- Mobile Center CLI 0.11.0

## Xcode

- Xcode 8.3.3
- Xcode 8.3.2
- Xcode 8.3.1
- Xcode 8.2.1
- Xcode 8.2
- Xcode 8.1
- Xcode 8.0

### Xcode Support Tools

- Nomad CLI 2.6.11
- Nomad CLI IPA ipa 0.14.3
- xcpretty 0.2.8
- xctool 0.3.2

### Installed SDKs

- OS X 10.12                `-sdk macosx10.12`
- iOS 10.0                  `-sdk iphoneos10.0`
- iOS 10.1                  `-sdk iphoneos10.1`
- iOS 10.2                  `-sdk iphoneos10.2`
- iOS 10.3                  `-sdk iphoneos10.3`
- iOS Simulator 10.0        `-sdk iphonesimulator10.0`
- iOS Simulator 10.1        `-sdk iphonesimulator10.1`
- iOS Simulator 10.2        `-sdk iphonesimulator10.2`
- iOS Simulator 10.3        `-sdk iphonesimulator10.3`
- tvOS 10.0                 `-sdk appletvos10.0`
- tvOS 10.1                 `-sdk appletvos10.1`
- tvOS 10.2                 `-sdk appletvos10.2`
- tvOS Simulator 10.0       `-sdk appletvsimulator10.0`
- tvOS Simulator 10.1       `-sdk appletvsimulator10.1`
- tvOS Simulator 10.2       `-sdk appletvsimulator10.2`
- watchOS 3.0               `-sdk watchos3.0`
- watchOS 3.1               `-sdk watchos3.1`
- watchOS 3.2               `-sdk watchos3.2`
- watchOS Simulator 3.0     `-sdk watchsimulator3.0`
- watchOS Simulator 3.1     `-sdk watchsimulator3.1`
- watchOS Simulator 3.2     `-sdk watchsimulator3.2`

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
iPhone SE (com.apple.CoreSimulator.SimDeviceType.iPhone-SE)
iPad 2 (com.apple.CoreSimulator.SimDeviceType.iPad-2)
iPad Retina (com.apple.CoreSimulator.SimDeviceType.iPad-Retina)
iPad Air (com.apple.CoreSimulator.SimDeviceType.iPad-Air)
iPad Air 2 (com.apple.CoreSimulator.SimDeviceType.iPad-Air-2)
iPad (5th generation) (com.apple.CoreSimulator.SimDeviceType.iPad--5th-generation-)
iPad Pro (9.7-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--9-7-inch-)
iPad Pro (12.9-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro)
iPad Pro (12.9-inch) (2nd generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--12-9-inch---2nd-generation-)
iPad Pro (10.5-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--10-5-inch-)
Apple TV 1080p (com.apple.CoreSimulator.SimDeviceType.Apple-TV-1080p)
Apple Watch - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-38mm)
Apple Watch - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-42mm)
Apple Watch Series 2 - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-2-38mm)
Apple Watch Series 2 - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-2-42mm)
```

#### Runtimes
```
iOS 8.4 (8.4 - 12H141) (com.apple.CoreSimulator.SimRuntime.iOS-8-4)
iOS 9.0 (9.0 - 13A344) (com.apple.CoreSimulator.SimRuntime.iOS-9-0)
iOS 9.1 (9.1 - 13B143) (com.apple.CoreSimulator.SimRuntime.iOS-9-1)
iOS 9.2 (9.2 - 13C75) (com.apple.CoreSimulator.SimRuntime.iOS-9-2)
iOS 9.3 (9.3 - 13E233) (com.apple.CoreSimulator.SimRuntime.iOS-9-3)
iOS 10.0 (10.0 - 14A345) (com.apple.CoreSimulator.SimRuntime.iOS-10-0)
iOS 10.1 (10.1 - 14B72) (com.apple.CoreSimulator.SimRuntime.iOS-10-1)
iOS 10.2 (10.2 - 14C89) (com.apple.CoreSimulator.SimRuntime.iOS-10-2)
iOS 10.3 (10.3.1 - 14E8301) (com.apple.CoreSimulator.SimRuntime.iOS-10-3)
tvOS 10.2 (10.2 - 14W260) (com.apple.CoreSimulator.SimRuntime.tvOS-10-2)
watchOS 2.2 (2.2 - 13V144) (com.apple.CoreSimulator.SimRuntime.watchOS-2-2)
watchOS 3.1 (3.1 - 14S471a) (com.apple.CoreSimulator.SimRuntime.watchOS-3-1)
watchOS 3.2 (3.2 - 14V243) (com.apple.CoreSimulator.SimRuntime.watchOS-3-2)
```

#### Devices

##### iOS 8.4
```
iPhone 4s (07CCE353-F176-483B-9024-0B3649F78F39)
iPhone 5 (31B99C72-2F5E-4130-8905-04440562D5E1)
iPhone 5s (287848DE-3FD0-4A74-BF75-49D860845200)
iPhone 6 (AFA974C3-5EEC-41EC-9FA4-6C9AE27C2C10)
iPhone 6 Plus (C71BB851-61CD-4773-A9E7-3B745526B22B)
iPad 2 (08B3E675-2BA9-4DCA-837E-881BF611C4F6)
iPad Retina (F9381C37-B099-4257-B857-67B43B9011C2)
iPad Air (CFE94DA3-89AC-494A-B0B8-32D4A9828537)
```

##### iOS 9.0
```
iPhone 4s (9271A5F0-F158-4B67-A974-BEB7E668FA15)
iPhone 5 (BB8DEBBE-7E9F-4687-BB13-E82440237523)
iPhone 5s (0D1EEB8E-3B88-4276-9BEE-939B7FD989CD)
iPhone 6 (13D4236D-A5EE-40A0-9F24-F62D1DA33BB5)
iPhone 6 Plus (C444DEA6-0551-4390-8AAB-0A29CEC3EFFE)
iPhone 6s (FE23D43B-2EAD-4D94-A6D5-240DCAABA1D0)
iPhone 6s Plus (D77E6AD2-22EB-42D3-9534-9B626D75D7A1)
iPad 2 (4138372F-9CBA-4266-A4A3-142D0275CE42)
iPad Retina (5052B229-CC0B-41A8-A0C4-BFFE06F3BC50)
iPad Air (528AE72B-08A4-4AC7-A821-A7148FD854D5)
iPad Air 2 (DECCB814-FB3B-413B-82D5-B0D005A75BC7)
```

##### iOS 9.1
```
iPhone 4s (6E492736-1C7A-46E3-A3F0-243E002B2792)
iPhone 5 (FEB07DB1-A2C4-4A7A-AE17-4EB7A0B0A9D2)
iPhone 5s (08734933-6CF1-442D-8F12-9D8BEFC4B2A2)
iPhone 6 (0F5A9E52-EEFC-461C-B985-CFA788047936)
iPhone 6 Plus (D515B0B2-6ACE-47F9-93E6-714536AE2EF8)
iPhone 6s (2B308E0B-9B15-4677-8980-098ADD4217E3)
iPhone 6s Plus (B2C9BCE3-7AE9-4A0D-890A-6426F24470CF)
iPad 2 (34CC841D-7B5F-43D8-B927-730F2F133B86)
iPad Retina (235988E1-EDF1-4849-8985-2A9516D31EF4)
iPad Air (99DA403E-D250-4D84-A89B-C87F9AAE410A)
iPad Air 2 (26AF556B-5D1A-4EAA-B71A-313E0193F080)
iPad Pro (A88EF220-AB81-4FE6-8800-1DA971D2C173)
```

##### iOS 9.2
```
iPhone 4s (5C7D2BE8-1C8D-4371-9FD4-9268A91D5ADD)
iPhone 5 (7223FFA8-640A-44A2-A8BE-65E63F684424)
iPhone 5s (083F21A1-95E7-41CF-83A2-CE282FADACF2)
iPhone 6 (8FEE1A12-D8E9-494F-984F-71483FECF09D)
iPhone 6 Plus (790A6CA7-BCF7-4C4D-8F34-190B432205DF)
iPhone 6s (9C4D2E2F-E197-4836-B6C2-0750F9970D61)
iPhone 6s Plus (B0C42D98-8A8D-4BC8-9039-E733A5CD5193)
iPad 2 (A3DCEF46-46B5-407A-ADD7-EFE4732C42CA)
iPad Retina (080BE88F-FFBB-4DFB-9D20-DEF8B5F81A14)
iPad Air (148F5692-3C8C-454F-8C42-C11EFA1A332B)
iPad Air 2 (7BC79D1B-C11C-41D0-AEEE-8FA9D64FC3C2)
iPad Pro (3F90FEC2-E333-4A28-88B1-6ED08CBE5331)
```

##### iOS 9.3
```
iPhone 4s (351E6F4E-21D0-4CEE-B31F-477F46B27527)
iPhone 5 (8A5FDDF4-32AB-44F1-90A9-753FD89782AE)
iPhone 5s (955AF250-9151-45BB-A15B-E17A1C561DE5)
iPhone 6 (56E38C79-F1CC-41C6-9847-08E38B42F75F)
iPhone 6 Plus (D551BF18-735F-4B43-B494-CE6981CC4BC7)
iPhone 6s (E6EC5F89-B495-4CCA-A7BC-4C96050EBF7F)
iPhone 6s Plus (AD9DD988-5004-4B4F-9FBC-D58F4FCAB8F8)
iPad 2 (0DE489BA-8A2F-4091-8B3E-3E6BEC4EFCEC)
iPad Retina (E80157D3-97CE-4DE9-B82E-B5B44AFC29E6)
iPad Air (46E32FE4-8087-413F-ABDA-F227454EDCA6)
iPad Air 2 (53AC20D1-79C9-48BA-B5EE-F8BDEF785773)
iPad Pro (3E974924-36BC-432D-A622-705FFEBB63BC)
```

##### iOS 10.0
```
iPhone 5 (B626CD14-BFCE-4983-A9E6-17A99BE325F6)
iPhone 5s (8D995BC0-BE7A-4070-A5AB-772AB5F5158B)
iPhone 6 (B2E6E95B-1603-4123-9201-73D59FB1AD9D)
iPhone 6 Plus (8AE90B03-7ADE-4727-96DC-61C4592139AD)
iPhone 6s (CCB30C8D-5C73-4A0B-A591-FBD07B9896B4)
iPhone 6s Plus (77142CF6-1E66-433C-ABA0-D7077666D22D)
iPhone 7 (9761477D-CDD4-4FEF-B99D-ADCF0FB5926F)
iPhone 7 Plus (A4F89C58-2508-4529-97B0-977B026328BF)
iPhone SE (3B1C6495-2082-4AB1-A0E8-830944D32177)
iPad Air (D139D5F6-3E68-47E9-9977-D6F29566BFD5)
iPad Air 2 (187E5F7F-719F-412E-BB89-0B0F2AB95E9A)
iPad Pro (9.7 inch) (73C6DCD7-FE77-4352-8D34-6BC09C60D576)
iPad Pro (12.9 inch) (24432D57-78DE-4D84-91C3-3B9BB06C84AF)
```

##### iOS 10.1
```
iPhone 5 (B626CD14-BFCE-4983-A9E6-17A99BE325F6)
iPhone 5s (8D995BC0-BE7A-4070-A5AB-772AB5F5158B)
iPhone 6 (B2E6E95B-1603-4123-9201-73D59FB1AD9D)
iPhone 6 Plus (8AE90B03-7ADE-4727-96DC-61C4592139AD)
iPhone 6s (CCB30C8D-5C73-4A0B-A591-FBD07B9896B4)
iPhone 6s Plus (77142CF6-1E66-433C-ABA0-D7077666D22D)
iPhone 7 (9761477D-CDD4-4FEF-B99D-ADCF0FB5926F)
iPhone 7 Plus (A4F89C58-2508-4529-97B0-977B026328BF)
iPhone SE (3B1C6495-2082-4AB1-A0E8-830944D32177)
iPad Air (D139D5F6-3E68-47E9-9977-D6F29566BFD5)
iPad Air 2 (187E5F7F-719F-412E-BB89-0B0F2AB95E9A)
iPad Pro (9.7 inch) (73C6DCD7-FE77-4352-8D34-6BC09C60D576)
iPad Pro (12.9 inch) (24432D57-78DE-4D84-91C3-3B9BB06C84AF)
```

##### iOS 10.2
```
iPhone 5 (93190318-DB79-4937-A297-6585D15AC6F6)
iPhone 5s (D8D28A9F-8AE2-4FAB-A155-266A90C25496)
iPhone 6 (1012D55D-2B6B-4EB1-AC3A-A90342C05AD0)
iPhone 6 Plus (373B7041-C261-471C-AD11-041BEF7D8C72)
iPhone 6s (8E18A35A-19C6-42EA-ACE6-696AF9D7C7FB)
iPhone 6s Plus (2E4B4927-B8EF-4F72-95C1-A9906CA8828B)
iPhone 7 (1BA6913E-F267-4EFA-9D92-9FDB27DB79D3)
iPhone 7 Plus (3611C41D-E65B-4D57-8889-84D035976699)
iPhone SE (277810C3-FAB8-4D99-A2E2-9729E3176C93)
iPad Air (319D1DFD-1FBC-4BFB-8193-B3EF33BF315F)
iPad Air 2 (80E12DC0-FB1F-41A0-AA7A-B2EF488AF3CA)
iPad Pro (9.7 inch) (1182CCC2-E9BE-477F-8001-A033377F5949)
iPad Pro (12.9 inch) (2718361D-A5F1-48CE-9A33-385A46CB5A64)
```

##### iOS 10.3
```
iPhone 5 (0A5283EC-0C4F-4B0C-A322-A694348D36EF)
iPhone 5s (E7C601C7-4208-450D-8D48-C12FD477F729)
iPhone 6 (15060D44-A03F-4EAE-8722-2E38148FE8E8)
iPhone 6 Plus (C68C2D04-839D-49E0-95F5-B462E3AC04EE)
iPhone 6s (FFE2B0C0-07BD-40A3-86E4-C5BBFC33FEE8)
iPhone 6s Plus (13E54D95-F0E4-4A97-AACA-4AE41C1227F3)
iPhone 7 (3E1C9723-E712-497C-967E-33807D1144F2)
iPhone 7 Plus (83C29B6A-767C-4C19-90AE-FC15A62FD094)
iPhone SE (5F77D17F-58B9-4998-A067-0A204EE1A881)
iPad Air (F7BA3867-F7AA-469C-9721-8DBE6A676113)
iPad Air 2 (71DA229D-ADB8-4E73-B566-B2AB16C54C1F)
iPad (5th generation) (ED9A0364-137E-4363-80E9-EE65FDE6F996)
iPad Pro (9.7 inch) (813E7CF7-B078-4A42-B3FB-A31FDD8841FF)
iPad Pro (12.9 inch) (B68FFAD7-0F20-47F9-AB95-3C6480CB8274)
iPad Pro (12.9-inch) (2nd generation) (AD80DD07-219C-4C3F-BF8A-464728298537)
iPad Pro (10.5-inch) (6BDC6A7B-916E-49FB-80DA-573A7E45EF72)
```

##### tvOS 10.0
```
Apple TV 1080p (B5CB3CD3-46B1-4608-82B9-54D08A7DC72B
```

##### tvOS 10.1
```
Apple TV 1080p (C5BDC8B8-AC08-4CCF-B777-2F8E9DC7F8CA)
```

##### tvOS 10.2
```
Apple TV 1080p (5B89C2EB-9AC9-4ACD-BFC1-8F1CB792799D)
```

##### watchOS 2.2
```
Apple Watch - 38mm (D6607F94-9BA2-485C-AF7A-03BD45387FF3)
Apple Watch - 42mm (17C7927C-F3D5-4C51-BF94-D23E9D076B1C)
```

##### watchOS 3.0
```
Apple Watch - 38mm (911D722D-5C83-4EA5-8150-21B02DD080CF)
Apple Watch - 42mm (A89E9EF5-6047-477A-913D-20D170A3806A)
Apple Watch Series 2 - 38mm (91823FD8-EF2A-4902-89FC-7DE881BACDE0)
Apple Watch Series 2 - 42mm (214C720B-B2F0-4169-B5E9-4A08C4025A33)
```

##### watchOS 3.1
```
Apple Watch - 38mm (88ABCC9D-6689-4AA2-8EF7-9D7C0CD1400B)
Apple Watch - 42mm (C15882F4-12EA-44FE-94C7-604F3CA039FA)
Apple Watch Series 2 - 38mm (54411D29-1BD1-4503-91FB-C01713321B38)
Apple Watch Series 2 - 42mm (7B923637-0F5B-4E03-92D1-2D7E77E1B143)
```

##### watchOS 3.2
```
Apple Watch - 38mm (6F95596F-EADB-40C2-8F1D-EB858041E0E9)
Apple Watch - 42mm (A7A7F692-806B-482D-973C-A5D7A14FAD70)
Apple Watch Series 2 - 38mm (DBEF77A5-56B9-4656-8C47-FB64B33EBB55)
Apple Watch Series 2 - 42mm (779A58DA-E410-4CE6-8C3A-135AD06B1B3C)
```

### Device Pairs
```
BD4B234C-320F-43D9-A36B-37B4F4A57183 (active, disconnected)
    Watch: Apple Watch Series 2 - 38mm (54411D29-1BD1-4503-91FB-C01713321B38)
    Phone: iPhone 7 (1BA6913E-F267-4EFA-9D92-9FDB27DB79D3)

8F53D501-89D0-4B81-84BF-A8F081B9AB2A (active, disconnected)
    Watch: Apple Watch Series 2 - 42mm (7B923637-0F5B-4E03-92D1-2D7E77E1B143)
    Phone: iPhone 7 Plus (3611C41D-E65B-4D57-8889-84D035976699)

9E347BC3-A639-49D2-844C-6B118F824B4E (active, disconnected)
    Watch: Apple Watch - 38mm (6F95596F-EADB-40C2-8F1D-EB858041E0E9)
    Phone: iPhone 6s (FFE2B0C0-07BD-40A3-86E4-C5BBFC33FEE8)

E8FF8428-DE5E-4A35-B916-1A0DFC549EE2 (active, disconnected)
    Watch: Apple Watch - 42mm (A7A7F692-806B-482D-973C-A5D7A14FAD70)
    Phone: iPhone 6s Plus (13E54D95-F0E4-4A97-AACA-4AE41C1227F3)

A19C36CC-5965-4DB6-B9EC-A176C3DA1717 (active, disconnected)
    Watch: Apple Watch Series 2 - 38mm (DBEF77A5-56B9-4656-8C47-FB64B33EBB55)
    Phone: iPhone 7 (3E1C9723-E712-497C-967E-33807D1144F2)

7C8BE6DE-6527-406C-96EE-A5EA96EDC0E7 (active, disconnected)
    Watch: Apple Watch Series 2 - 42mm (779A58DA-E410-4CE6-8C3A-135AD06B1B3C)
    Phone: iPhone 7 Plus (83C29B6A-767C-4C19-90AE-FC15A62FD094)
    Watch: Apple Watch Series 2 - 38mm (CD701219-27EE-4973-B215-9B3AE4367AD3)
    Phone: iPhone 7 (B4A229FB-A029-4287-ABAE-D1D931B1876A)
    Watch: Apple Watch Series 2 - 42mm (5619831F-1C3F-47BB-8554-C96CE5222261)
    Phone: iPhone 7 Plus (8F04D1B5-8379-47BE-9616-30CA401DA422)
    Watch: Apple Watch - 38mm (7B0A1930-A26F-4203-A42E-88E9156A5EB3)
    Phone: iPhone 6s (53FA179B-DEA6-4C53-BE80-634DD67D396D)
    Watch: Apple Watch - 42mm (AF32DF30-15B0-454E-ADFF-88DF0CD05C19)
    Phone: iPhone 6s Plus (7761AE8D-1319-4D4D-91D5-D273E709620A)
    Watch: Apple Watch Series 2 - 38mm (33271777-F220-4432-BCE5-A6C1730B13CB)
    Phone: iPhone 7 (92D9C8C2-4D38-4476-B89D-7E87001B747A)
    Watch: Apple Watch Series 2 - 42mm (574B4DA6-AC25-4175-8783-D2C1B39F7541)
    Phone: iPhone 7 Plus (D5C00319-F92A-481A-AFF3-59BD47B1151F)
```


## Android

### Android SDK tools

| Package name          | Description                                 |
|-----------------------|---------------------------------------------|
| tools                 | Android SDK Tools, revision 26.0.2          |

### Android SDK Platform-tools

| Package name          | Description                                 |
|-----------------------|---------------------------------------------|
| platform-tools        | Android SDK Platform-tools, revision 26.0.0 |

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

### SDK Build tools

| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| build-tools-17.0.0    | Android SDK Build-tools, Revision 17.0.0  |
| build-tools-19.1.0    | Android SDK Build-tools, Revision 19.1.0  |
| build-tools-20.0.0    | Android SDK Build-tools, Revision 20.0.0  |
| build-tools-21.1.2    | Android SDK Build-tools, Revision 21.1.2  |
| build-tools-22.0.1    | Android SDK Build-tools, Revision 22.0.1  |
| build-tools-23.0.1    | Android SDK Build-tools, Revision 23.0.1  |
| build-tools-23.0.2    | Android SDK Build-tools, Revision 23.0.2  |
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

### Utils

| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| cmake;3.6.4111459     | 3.6.4111459                               |
| lldb;2.3              | 2.3.3614996                               |
| ndk-bundle            | 15.1.4119039                              |
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
| extra-google-google_play_services | Google Play services, revision 43        |
| extra-google-m2repository         | Google Repository, revision 57           |

## Xamarin

- Visual Studio for Mac: 7.0.1.24
- Xamarin.iOS: 10.10.0.36
- Xamarin.Android: 7.3.1-2
- Xamarin.Mac: 3.4.0.36
- Mono Framework MDK: Mono JIT compiler version 5.0.1.1

### Package Management 

- NuGet: 4.1.0

### Unit Test Framework

- NUnit: 3.6.1
