---
title: "Command Line Interface (CLI) Documentation"
description: How to use the CLI to access Mobile Center features
keywords: command line, mobile center
author: elamalani
ms.author: emalani
ms.date: 01/26/17
ms.topic: article
ms.assetid: f98b1b59-ee20-4ed0-beb9-ec8fd4596ad1
ms.service: mobile-center
---

# Command Line Interface (CLI) Documentation

Mobile Center command line interface is a unified tool for running Mobile Center services from the command line. Our aim is to offer a concise and powerful tool for our developers to use Mobile Center services and easily script a sequence of commands that they'd like to execute. You can currently login and view/configure all the apps that you have access to in Mobile Center.

Although our current feature set is minimal, all the existing Mobile Center services will be added going forward. Note that the Mobile Center CLI is currently in public preview.

To get more information on CLI installation and currently supported commands, please refer to [our GitHub repo](https://github.com/Microsoft/mobile-center-cli).

## Known Limitations

Currently, there is a known limitation in Mobile Center CLI where you can’t login using your GitHub or Microsoft account until you set a password in Mobile Center. Please follow these additional steps to set a password and avoid seeing the error message in CLI when you try to login.
  1. Logout from Mobile Center.
  2. Navigate to the link to reset your password - https://mobile.azure.com/reset. You will get a mail that takes you to create a new password in Mobile Center.
  3. Once it’s done, login to CLI using the set credentials.
