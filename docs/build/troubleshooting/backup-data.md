---
title: Backing up Build data
description: How to download build logs, binaries and symbols
author: king-of-spades
ms.author: kegr
ms.date: 07/13/2020
ms.topic: article 
ms.assetid: e2ec279b-f29d-49f9-a5bc-3b1189275458
ms.service: vs-appcenter 
ms.custom: build
---

# Backing up Build data
Build data in App Center is kept for 30 days after creation. However, it can also be deleted before 30 days have passed in two ways:

- The configuration for the branch in App Center is deleted, which erases all data for that branch.
- The repository is disconnected via App Center, which erases all data for that repository.

> [!WARNING]
> If the repository is disconnected via the host rather than via App Center; build data is inaccessible in the UI. However, it can still be downloaded via the API or CLI by authenticated users who have access to the app in App Center. 

## Backup from the App Center Website
You can download data from your build by going to:
**appcenter.ms > [your account or organization] > [app name] > build > [branch name] > [build number] > download**
Example URL: https://appcenter.ms/orgs/ORG-NAME/apps/APP-NAME/build/branches/BRANCH-NAME/builds/BUILD_NUMBER

From there you can download build files, such as logs and app binaries. 

## Backup using the App Center API
General References:
- [App Center API Guide](https://docs.microsoft.com/appcenter/api-docs/)
- [Swagger API methods for Build](https://openapi.appcenter.ms/#/build)

You can download logs & build artifacts using this API call: https://openapi.appcenter.ms/#/build/builds_getDownloadUri. The call works as long as the build data exists and your API credentials have permission to access that data.

The API can also be used to record the current branch configuration settings, using https://openapi.appcenter.ms/#/build/branchConfigurations_get

## Backup using the App Center CLI
General References:
- [CLI Documentation](https://docs.microsoft.com/appcenter/cli/)
- [CLI Public Repository](https://github.com/microsoft/appcenter-cli)

You can use this command to back up your build data from the CLI:
> appcenter build download --id [BUILD_NUMBER] --app [ORG_NAME/APP_NAME] --type [logs, build, symbols]

Below is an example script that when given an organization & team you have access to, will download the logs for builds #1-10. 
```#!/bin/bash
# Customize this script to download build data you have permission to access in App Center. 

TEAM_APP='ORG_NAME/APP_NAME'

for i in {1..10} #downloads data from builds #1 - #10
do
   eval appcenter build download --id "$i" --app $TEAM_APP --type "logs"    
   #eval appcenter build download --id "$i" --app $TEAM_APP --type "build" #uncomment to download app packages
   #eval appcenter build download --id "$i" --app $TEAM_APP --type "symbols" #uncomment to download symbols
done
```

> [!TIP]
> If one of the commands fails, the script will output an error but continue executing. This means if you can use a general or approximate range for the build data. 

This script is also available on the [App Center Repository](https://github.com/microsoft/appcenter/blob/master/sample-build-scripts/general/build-results/download.sh)
