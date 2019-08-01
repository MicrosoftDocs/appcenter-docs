---
title: Manage App Center Distribution Groups
description: Distribute mobile apps to groups of users
keywords: distribution
author: JoshuaWeber
ms.author: JoshuaWeber
ms.date: 08/01/2019
ms.topic: article
ms.assetid: 65c820ac-e2ec-4ab1-9d2e-bbc2ddac2640
ms.service: vs-appcenter
ms.custom: distribute
---

# Manage App Center Distribution Groups

## Manage Distribution Groups

Distribution Groups are used to control access to releases. A Distribution Group represents a set of users that can be managed jointly and can have common access to releases. Example of Distribution Groups can be teams of users, like the QA Team or External Beta Testers, or can represent stages or rings of releases, such as Staging.

## Creating a Distribution Group

To create a new Distribution Group, log into the App Center portal, select your desired app, click  Distribute in the navigation pane, and lastly select the **New Group** group button from the top of the screen. Provide a name for the Distribution Group. You can then add users to this group by email. You can also add additional users after the group has been created.

## Managing Users in a Distribution Group

Clicking on a Distribution Group will allow for management of the group. You can use the invitation box to add additional users. Select users from the table to remove them from the group. From this page you can also see the full release history for this Distribution Group by clicking on the releases tab.

## Types of Distribution Groups

### Private Distribution Groups

In App Center, distribution groups are private by default. This means only testers invited via email can access the releases available to this group. Testers added to this group will receive a notification that they have been added to the app to test. After a release, testers that were previously added to this group will receive the new release notification email and will be required to login to their App Center account in order to access and download releases.  

### Public Distribution Groups

Distribution groups must be public to enable unauthenticated installs from public links. When creating a new distribution group, the options is available during the setup process. After giving your group a name, you can enable **Allow public access**.

To make an existing distribution group public, open the distribution group and click on the settings icon in the upper right-hand corner of the screen. From the settings modal, you can enable **Allow public access**.

As with private distribution groups, testers will receive an email notifying them that they've been invited to test the app and when a release is available to them. In order to access the app from here, testers will be required to login with their App Center account.

In addition to this, a **public download link** is displayed underneath the distribution group name at the top of the distribution group page. **Anyone, including testers who aren't explicitly added to the distribution group, can access the release without signing in using the public download link**.

### Shared Distribution Group

Shared distribution groups are private or public distribution groups that are shared across multiple apps in a single organization. Shared distribution groups eliminate the need to replicate distribution groups across multiple apps. With a few clicks, you can give a shared distribution group access to any combination of apps belonging to a particular organization.

Unlike traditional public and private distribution groups, shared distribution groups are at the organization level rather than the app level. Due to this, the steps to create one are slightly different:

1. Login to the App Center portal, then select the organization to which you would like to add a shared group
2. On the navigator pane that opens, click **People**
3. On the People page, click the distribution group link to open the shared distribution groups page
4. On the top right corner of the shared distribution groups page, select the blue **create new group** button.

Once you have a distribution group, click the group entry in the table to add testers and apps to the group.

To add testers to your new shared distribution group, select the **Testers** tab and enter the emails of the desired testers.

To add apps to your new shared distribution group, select the **Apps** tab and enter the name of the desired apps that this group should have access to.

## Automatically manage devices

When releasing an iOS app signed with an ad-hoc or development provisioning profile, you must obtain tester's device IDs (UDIDs), and add them to the provisioning profile before compiling a release. When you enable the distribution group's **Automatically manage devices** setting, App Center automates the before mentioned operations and removes the constraint for you to perform any manual tasks. As part of automating the workflow, you must provide the user name and password for your Apple ID and your production certificate in a .p12 format.

App Center starts the automated tasks when you distribute a new release or one of your testers registers a new device. First, all devices from the target distribution group will be registered, using your Apple ID, in your developer portal and all provisioning profiles used in the app will be generated with both new and existing device ID. Afterward, the newly generated provisioning profiles are downloaded to App Center servers. Second, App Center uses your saved certificate and the downloaded provisioning profiles to re-sign your app so it can be installed on any device in the releases distribution group. Your testers will not have to wait for you to create a new release as the existing release is being updated and a download link will be available through the [App Center Install portal](https://install.appcenter.ms).

Click on either to read more about [what is re-signing](auto-provisioning.md#what-is-re-signing) and [about privacy for how your Apple ID and certificate is stored](auto-provisioning.md#privacy-concerns-on-username-and-password).

## Adding Azure Active Directory (AAD) groups to a Distribution Group

In addition to adding testers via email, we now support the addition of AAD groups to a distribution group. Any member of an AAD group can link their organization's subscription to their AAD tenant in App Center. Doing so will enable members of an organization to start adding managed groups to their app's distribution groups. To get started, link your AAD tenant to your organization using the following steps:

1. Login to the App Center portal, then select the organization to which you like to link to your AAD tenant
2. On the navigator pane that opens, click **Manage**
3. On the azure active directory panel on the Manage page, click the **connect** button
4. You will be redirected to a Microsoft login page, login with your Microsoft/AAD credentials
5. You will be redirected to the App Center portal, click the desired tenant you would like to attach.
6. At the bottom right of the presented window, click the **connect**

Once your tenant is connected to the organization, you can [add an AAD group as you would an individual tester](#managing-users-in-a-distribution-group).

## Releasing a Build to a Distribution Group

To [release a new build][upload] to a Distribution Group. Make use of the **Distribute new Release** button at the top of the screen and choose the Distribution Group from the list during the steps.

## User Download Analytics

User download analytics allow you to monitor how testers within a distribution group are interacting with a release. Total and unique download counts for a release are available both at the top of each distribution group page as well as on the Release Details page. The total download count represents the total number of times the Install button has been hit by a tester. The unique download count represents the number of users that have installed the release. As an example, if one tester has downloaded a release to two different test devices, this would equal two total downloads and one unique download. Note that public distribution groups will only include the total download count and not the unique download count.

[app_users]: ~/dashboard/creating-and-managing-apps.md
[upload]: ~/distribution/uploading.md
