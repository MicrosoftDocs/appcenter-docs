---
title: Manage App Center Distribution Groups
description: Distribute mobile apps to groups of users
keywords: distribution
author: JoshuaWeber
ms.author: JoshuaWeber
ms.date: 06/01/2018
ms.topic: article
ms.assetid: 65c820ac-e2ec-4ab1-9d2e-bbc2ddac2640
ms.service: vs-appcenter
ms.custom: distribute
---

# Manage Distribution Groups

Distribution Groups are used to control access to releases. A Distribution Group represents a set of users that can be managed jointly and can have common access to releases. Example of Distribution Groups can be teams of users, like the QA Team or External Beta Testers or can represent stages or rings of releases, such as Staging.

## Creating a Distribution Group

To create a new Distribution Group select the **New Group** group button from the top of the screen. Provide a name for the Distribution Group. You can then add users to this group by email. You can also add additional users after the group has been created.

## Managing Users in a Distribution Group

Clicking on a Distribution Group will allow for management of the group. You can use the invitation box to add additional users. Or select users from the table to remove them from the group. From this page you can also see the full release history for this Distribution Group by clicking on the releases tab.

## Public Distribution Groups

If you would like users to be able to download your latest release through an unauthenticated install or through a public download link, you have the option of making a distribution group public. If you are creating a new distribution group, the option is available during the setup process. After giving your group a name, you can toggle on **Allow public access**. If you would like to make an existing distribution group public, open the distribution group and click on the settings icon in the upper right-hand corner of the screen. From the settings modal, you can toggle on **Allow public access**. If you've added testers to the group, they will receive the new release notification email but will not be required to login to their App Center account in order to download. Additionally, a public download link is displayed underneath the group name at the top of the distribution group page. 

## Automatically manage devices

When releasing an iOS app signed with an ad-hoc or development provisioning profile, you must obtain tester's device IDs (UDID), and add them to the provisioning profile before compiling a release. If you toggle on **Automatically manage devices**, found in **Settings** for distribution groups, App Center will automate the before mentioned operations and remove the constraint for you to performs any manual task. As part of automating the workflow, you must provide the user name and password for your Apple ID and your production certificate in a .p12 format.

App Center starts the automated tasks when you distribute a new release or one of your testers registers a new device. First, all devices from the target distribution group will be registered, using your Apple ID, in your developer portal and all provisioning profiles used in the app will be generated with both new and existing device ID. Afterward, the newly generated provisioning profiles are downloaded to App Center servers. Second, App Center uses your saved certificate and the downloaded provisioning profiles to re-sign your app so it can be installed on any device in the releases distribution group. Your testers will not have to wait for you to create a new release as the existing release is being updated and a download link will be available through the [App Center Install portal](https://install.appcenter.ms).

Click on either to read more about [what is re-signing](auto-provisioning.md#what-is-re-signing) and [about privacy for how your Apple ID and certificate is stored](auto-provisioning.md#privacy-concerns-on-username-and-password).

## Releasing a Build to a Distribution Group

To [release a new build][upload] to a Distribution Group. Make use of the **Distribute new Release** button at the top of the screen and choose the Distribution Group from the list during the steps.

## User Download Analytics

User download analytics allow you to monitor how testers within a distribution group are interacting with a release. Total and unique download counts for a release are available both at the top of each distribution group page as well as on the Release Details page. The total download count represents the total number of times the Install button has been hit by a tester. The unique download count represents the number of users that have installed the release. As an example, if one tester has downloaded a release to two different test devices, this would equal two total downloads and one unique download. Note that public distribution groups will only include the total download count and not the unique download count. 

[app_users]: ~/dashboard/creating-and-managing-apps.md
[upload]: ~/distribution/uploading.md
