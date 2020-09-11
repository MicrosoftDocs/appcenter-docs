---
title: React Native Node.js versions selection
description: How to specify Node.js version for React Native app
keywords: build, react-native, nodejs
author: nilofer
ms.author: nirajpur
ms.date: 09/08/2020
ms.topic: article
ms.assetid: 14082d66-a0ff-45e6-938d-259f64c35337
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: react-native
---

# Node.js selection

## Major versions of Node.js
Any major Node.js version can be specified in the app's branch configuration.  
The following versions are available for use in App Center Build: 8.x, 10.x, 12.x, 14.x. 
See Also: [App Center Cloud Build Machines](~/build/software.md)

![Select Node.js version in the app's branch configuration](~/build/react-native/images/node-select.png)

## Using .nvmrc
If the app repository contains an `.nvmrc` file, the option **Use .nvmrc** will be available in the **Node.js version dropdown**. Select this option to use the node version from the `.nvmrc` file for the build.

- The `.nvmrc` file should be located in the same folder as the project's `package.json` file or in one of the parent folders
- The `.nvmrc` syntax can be found in [nvm docs](https://github.com/nvm-sh/nvm#nvmrc)
