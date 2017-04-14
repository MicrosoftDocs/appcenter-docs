---
title: Connect to a repository to start building your mobile app
description: How to connect/reconnect to a repository to start building your app
keywords: android
author: siminapasat
ms.author: siminap
ms.date: 04/13/2017
ms.topic: article
ms.service: mobile-center
ms.custom: build
---

# Connecting to a source repository 

To start building an app, you need to firstly connect to your code repository service (GitHub, Bitbucket, VSTS) account, select a repository and a branch where your app lives and then you can set up your first build. To connect to the repository service, you will have to go through an Oauth flow and give Mobile Center permissions.

With so many identities, apps (work or personal apps) and authentication methods, you might end up with your Mobile Center account connected to a different code repository service than where your app(s) are living.


### I have connected to the wrong account to start building my apps with. How can I re-connect to the correct account?
If you have connected to a source repository service with the wrong account, you will have to go to your User settings in the source hosting service (VSTS, GitHub or Bitbucket) and revoke the Oauth token manually. The instructions below are specific to the provider:

[!IMPORTANT]
Keep in mind that if you connect to a new account, you will lose all the build configuration and previous builds for ALL the apps configured with the previous account.

#### Visual Studio Team Services (VSTS)
In order to connect to another VSTS account to build your apps, first step is to revoke the Oauth token. Go to https://app.vsaex.visualstudio.com/me > Manage Authorizations (See screenshot below) > Revoke Mobile Center token. Once revoked, it takes up to 60 minutes for that token to lose access, so you will have to wait until you can connect Mobile Center with another VSTS account. Then, go back to Mobile Center in the build tab, reconnect to VSTS and go through the Oauth flow again. Make sure that before you re-do the Oauth flow in Mobile Center, you log out in the browser from the identity that you used to connect to the previous VSTS account.

![Remove VSTS Oauth Token][remove-vsts-oauth-token]

#### GitHub
If you logged in into Mobile Center with a GitHub acoount, you can only build apps from repositories under that GitHub account.

If you logged in into Mobile Center with another method, but you have connected to the wrong GitHub account, first step is to revoke the Oauth token: go to https://github.com/settings/profile > Authorized Applications > Revoke Mobile Center token. Then, go back to Mobile Center in the build tab, reconnect to GitHub and go through the Oauth flow again. Make sure that before you re-do the Oauth flow in Mobile Center, you log out in that browser from GitHub first.

![Remove GitHub Oauth Token][remove-github-oauth-token]

#### Bitbucket
In order to connect to another Bitbucket account to build your apps, first step is to revoke the Oauth token: go to https://bitbucket.org/account/ > Access Management (Oauth) > Revoke Mobile Center token. Then, go back to Mobile Center in the build tab, reconnect to VSTS and go through the Oauth flow again. Make sure that before you re-do the Oauth flow in Mobile Center, you log out in that browser from Bitbucket first. 

![Remove Bitbucket Oauth Token][remove-bitbucket-oauth-token]

[remove-vsts-oauth-token]: ~/build/images/remove-vsts-oauth-token.png "Remove VSTS token"
[remove-github-oauth-token]: ~/build/images/remove-github-oauth-token.png "Remove GitHub token"
[remove-bitbucket-oauth-token]: ~/build/images/remove-bitbucket-oauth-token.png "Remove Bitbucket token"


