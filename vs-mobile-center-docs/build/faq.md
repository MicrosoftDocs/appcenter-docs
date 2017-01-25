---
title: Build Frequently Asked Questions
description: Code signing apps built with Mobile Center
keywords: build, faq
author: siminapasat
ms.author: siminap
ms.date: 01/20/17
ms.topic: article
ms.assetid: 090e12fa-c788-4cd3-8178-c8c0769195af
ms.service: mobile-center
---

# Build FAQ

## The repository I want to connect to is not listed in the Link Repository step
* If connecting to a repository that belongs to an organization, first request admin access to the repository.
In order to use a repository for building apps with Mobile Center, you need to have admin rights to that repository. Admin rights are required because Mobile Center will register a webhook on your repository coming from the [mobile.azure.com](https://mobile.azure.com) domain.
* If connecting to a repository owned by a user, you need to be the owner of the repository. If you are not the owner, you can still onboard the app to Mobile Center build by inviting the repository owner asa collaborator to the app in Mobile Center. Then, the owner can connect his own GitHub repo as a source to the build service.

## No Xcode scheme is found
In order to build a xcworkspace or a xcproject, a shared Xcode scheme is required. Xcode schemes are saved locally so that Xcode has access to them, but by default they are not shared with others and they are not included in source control.

To share a scheme, click on "Manage schemes" in Xcode and make sure that the scheme used for building your xcproject/xcworkspace is marked as shared. The scheme's container needs to be set to the Xcode project or workspace you want to build.

![Mark scheme as shared][xcode-share-scheme]

## Why did my build fail?
There are various reasons your build could have failed. The best way to find out what happened is to go to the build details page and download the logs. Check the logs for each of the steps to understand what happened and where exactly the build failed. If you cannot understand why the build failed or you think there is an issue on our side, feel free to contact us via Intercom.

## Is my source code secure?
Mobile Center uses virtual machines to build your code. There is a clean virtual machine provisioned especially for your build which gets discarded once the build finishes.
The files uploaded for code signing and the password for the certificate are also stored securely on our servers.

## A code signed build cannot be installed on an iOS device
There are many reasons why a build cannot be installed on a user's device. A common case is that the provisioning profile does not contain the UDID of the user's device, in case of a development or ad-hoc distribution build. In the case of development provisioning profiles and ad-hoc distribution, you have to manually include the UDID of your users' devices in the provisioning profile in the Apple Developer Center, re-download the provisioning profile and upload it to Mobile Center build configuration. If you use enterprise distribution, you do not need to worry about collecting UDIDs.

[xcode-share-scheme]: ~/build/ios/first-build/images/xcode-share-scheme.png "Marking a scheme as shared in Xcode"
