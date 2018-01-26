# Contributing

Thank you for your interest in contributing to the App Center documentation!

In this topic, you'll see the basic process for adding or updating content in the [App Center documentation site](https://docs.microsoft.com/appcenter).

In this topic, we'll cover:

* [Process for contributing](#process-for-contributing)
* [Guidance checklist](#guidance-checklist)
* [Building the docs](#building-the-docs)
* [Contributing to samples](#contributing-to-samples)
* [Contributor License Agreement](#contributor-license-agreement)

## Process for contributing

**Step 1:** 

* For small changes, edits, and fixes, skip to Step 2.

* For larger contributions of new content, _open an issue_ describing the article you wish to write and how it relates to existing content. The content inside the **docs** folder is organized into sections that are organized by content area (e.g. **build** and **distribution**). Try to determine the correct folder for your new content. Get feedback on your proposal via the issue before starting to write.


**Step 2:** Fork the `MicrosoftDocs/appcenter-docs` repo.

**Step 3:** Create a `branch` for your changes.

**Step 4:** Write your content.

If it's a new topic, you can use this [template file](./styleguide/template.md) as your starting point. It contains the writing guidelines and also explains the metadata required for each article, such as author information.

Navigate to the folder that corresponds to the TOC location determined for your article in step 1.
That folder contains the Markdown files for all articles in that section. If necessary, create a new folder to place the files for your content.

For images and other static resources, add them to the subfolder called **images**. If you are creating a new folder for content, add an images folder to the new folder.

Be sure to follow the proper Markdown syntax. See the [style guide](./styleguide/template.md) for more information.

### Example structure

    docs
      /build
          faq.md
          /images
              some-image.png

**Step 5:** Submit a Pull Request (PR) from your branch to `MicrosoftDocs/mobile-center-docs/master`.

If your PR is addressing an existing issue, add the `Fixes #Issue_Number` keyword to the commit message or PR description, so the issue can be automatically closed when the PR is merged. For more information, see [Closing issues via commit messages](https://help.github.com/articles/closing-issues-via-commit-messages/).

The App Center team will review your PR and let you know if the change looks good or if there are any other updates/changes necessary in order to approve it.

**Step 6:** Make any necessary updates to your branch as discussed with the team.

The maintainers will merge your PR into the master branch once feedback has been applied and your change looks good.

On a certain cadence, we push all commits from master branch into the live site and then you'll be able to see your contribution at https://docs.microsoft.com/appcenter/.

## DOs and DON'Ts

Below is a short list of guiding rules that you should keep in mind when you are contributing to the .NET documentation.

- **DON'T** surprise us with big pull requests. Instead, file an issue and start a discussion so we can agree on a direction before you invest a large amount of time.
- **DO** read the [style guide](./styleguide/template.md) and [voice and tone](./styleguide/voice-tone.md) guidelines.
- **DO** use the [template](./styleguide/template.md) file as the starting point of your work.
- **DO** create a separate branch on your fork before working on the articles.
- **DO** follow the [GitHub Flow workflow](https://guides.github.com/introduction/flow/).
- **DO** blog and tweet (or whatever) about your contributions, frequently!

> [!NOTE]
> You might notice that some of the topics are not currently following all the guidelines specified here and on the [style guide](./styleguide/template.md) as well. We're working towards achieving consistency throughout the site. 

## Building the docs

The documentation is written in [GitHub Flavored Markdown](https://help.github.com/categories/writing-on-github/) and built using [DocFX](https://dotnet.github.io/docfx/) and other internal publishing/building tools. It is hosted at [docs.microsoft.com](https://docs.microsoft.com/dotnet).

If you want to build the docs locally, you need to install [DocFX](https://dotnet.github.io/docfx/); latest versions are the best.

There are several ways to use DocFX, and most of them are covered in the [DocFX getting started guide](https://dotnet.github.io/docfx/tutorial/docfx_getting_started.html).
The following instructions use the [command-line based](https://dotnet.github.io/docfx/tutorial/docfx_getting_started.html#2-use-docfx-as-a-command-line-tool) version of the tool.
If you are comfortable with other ways listed on the link above, feel free to use those.

**Note:** Currently DocFX requires the .NET Framework on Windows or Mono (for Linux or macOS). We hope to port it to .NET Core in the future.

You can build and preview the resulting site locally using a built-in web server. Navigate to the core-docs folder on your machine and type the following command:

```
docfx -t default --serve
```

This starts the local preview on [localhost:8080](http://localhost:8080). You can then view the changes by going to `http://localhost:8080/[path]`, such as http://localhost:8080/vs-appcenter/dashboard/faq.html.

**Note:** the local preview currently doesn't contain any themes at the moment so the look and feel won't be the same as in the documentation site. We're working towards fixing that experience.

