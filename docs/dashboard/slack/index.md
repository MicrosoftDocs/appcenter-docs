---
# required metadata

title: App Center Slack App Documentation
description: how to use App Center Slack App
keywords: app center, appcenter, visual studio app center, visual studio appcenter, slack app, slackbot, slack bot, documentation, integration, slack
author: amchew
ms.author: amchew
ms.date: 05/07/2018
ms.topic: article
ms.service: vs-appcenter
ms.assetid: d019ce2d-24b6-4a07-a9a2-e3484fcbb005


# optional metadata

#ms.devlang: dotnet
#ms.reviewer: piyushjo

---

# App Center Slack App

## Overview 

App Center Slack App empowers users to interact with App Center directly from Slack. 

Our aim is to enable users to quickly access App Center services and respond to critical app data in Slack, and distribute to Slack workspaces and messages. Users can easily trigger a build, view an app's analytics and crashes, and invite new testers to an app. This is done via [slash commands](https://api.slack.com/slash-commands) in Slack. 


## Getting Started

1. Navigate to [App Center's Slack App](https://slack.com/apps/A5ZK2MYJC), and install and authorize the app.

2. Navigate to your Slack workspace and select any direct message or channel.

3. In the **message** tab, run the Slash command `/appcenter`.

4. Authorize App Center's Slack App by following the instructions below:

	1. Go to https://appcenter.ms/settings/apitokens and create a new Full Access API token.
		- Here are details on how to [create a new Full Access API token](~/api-docs/index.md), in particular please see steps 4-5.
	2. Go back to Slack and run `/appcenter login <your token>`.
	3. Welcome! You've successfully authorized your app.
	
5. You may run `/appcenter help` to see a complete list of App Center commands. Below is the list of commands supported by App Center Slack App:
	
	| Command       | Description           | 
	|---	|---	|
	| `/appcenter login <token>` | One time setup to get access to App Center via Slack | 
	| `/appcenter logout`      | Clean up authorization info     |  
	| `/appcenter build <app> <branch>` | Trigger a new build of an app      |    
	| `/appcenter analytics <app>`     | View analytics information | 
	| `/appcenter invite <app> <distribution group> <email separated by commas>`  | Invite a new tester to an app|   
	| `/appcenter crashes <app>`      |   crashes information | 
	| `/appcenter help`      |   View list of App Center commands|  

6. You can pin a specific App Center app to the Slack channel or message. Run the slash command `/appcenter` and click on **set current app** to choose the default app. To remove the default app, run the slash command `/appcenter` and click on **clear current app**.  

## FAQ

#### What should I do when I receive an error message `Looks like there is an error with your request` after running `/appcenter [command]`?

This is because the API token used has been deleted. To resolve this,

  1. Go to [https://appcenter.ms](https://appcenter.ms) and create a new [Full Access API token](~/api-docs/index.md). Copy this API token.
  2. Navigate to your Slack workspace and select any direct message or channel.
  3. In the **message** tab, run `/appcenter logout`.
  4. In the **message** tab, run `/appcenter login <your token>`.
