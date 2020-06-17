---
title: Working with Datafiles
description: How to include datafiles with your UITest test runs in App Center
keywords: test cloud, app center, uitest, data, xamarin
author: oddj0b
ms.author: vigimm
ms.date: 06/17/2020
ms.topic: article
ms.assetid: a468d860-fd50-4737-a194-03886fa0d947
ms.service: vs-appcenter
ms.custom: test
---

# Using Datafiles in App Center with Xamarin.UITest
You have a Xamarin.UITest project that uses a local file. The tests work fine locally but when you run them in App Center Test your UITests can't access the file and so the tests fail. The problem is that the test files are not uploaded with the tests. 

To address this, you need to include the file or files in your test upload and then access them during your tests. Preferably using the same code locally and in App Center Test.

There are two basic approaches: you can embed the file in your test suite, or include it as part of your upload command. 

## Embedded File
You can add the file as an embedded resource in your UITest project. This will include the file within your UITest project assembly. Once you get it working locally it should work in App Center Test with no additional parameters or arguments for the submit command `appcenter test run ...`.

Here's some code that shows how to access embedded resources from your C# test at runtime: [EmbeddedResources](https://github.com/xamarin/mobile-samples/tree/master/EmbeddedResources). The main code to use is [SharedLibResourceLoader.cs](https://github.com/xamarin/mobile-samples/blob/master/EmbeddedResources/SharedLib/ResourceLoader.cs). Include that in your UITest project and un-comment the convenience methods.

Add your data file(s) as an embedded resource to by right-clicking your your UITest project and selecting **Build Action > Embedded Resource**.

Then, at run time, access the file as an embedded resource from your UITest code. These snippets are examples of how to access embedded files at run time using SharedLibResourceLoader (above):

```c#
// Read the text file as a string
String contents = ResourceLoader
    .GetEmbeddedResourceString("TestFileOne.txt");
```

or

```c#
// Read the text file line by line
StreamReader stream = new StreamReader(ResourceLoader
    .GetEmbeddedResourceStream("TestFileOne.txt"));

String line1 = stream.ReadLine();
String line2 = stream.ReadLine();
...
```

## Include
There's also an `--include` option that can be used on the command line when submitting to App Center Test to upload your data files with your UITest project.

> --include <file-or-directory>

To set this up so that it works with the same code and data file configuration locally as in App Center Test place the file(s) or folder to use in the top level folder of your UITest project (at the same level as the packages folder).

For each data file select the file in Solution Explorer and set the property to copy to output directory. 

On Windows this can be either **Copy to Output Directory > Copy** if newer, or, **Copy to Output Directory > Copy always**. 

On a Mac you'll need to control-click or right-click the file and select **Quick Properties > Copy to Output Directory**. If including a folder, repeat this for each file in the folder.

Taking this approach, the files will be in the build directory at run time when executing locally. Code like the following examples could be used to access the files at run time:

```c#
StreamReader s = new StreamReader("TestFileTwo.txt");
```

or

```c#
// Read DataFileOne.txt in the folder Data
StreamReader s = new StreamReader("./Data/DataFileOne.txt");
```

The file references above are relative to where the UITest code is built. This will work both locally and in App Center Test. If you hard code the full path that works on your local machine it will fail in App Center Test. 

To upload the files in App Center Test use the `--include` option on the submit command `appcenter test run ...`. These are the command line fragments used to upload `TestFileTwo.txt` or the folder `Data`. Each file within `Data` that you need at run time needs to be set to copy to the output directory as above.

```bash
--include TestFileTwo.txt
```
or
```bash
--include Data
```

Now the files will be uploaded with the UITest project and the same UITest code that uses them locally (above) will work at run time in App Center Test.

You can use the `--include` option multiple times on your command line to include multiple files or directories.