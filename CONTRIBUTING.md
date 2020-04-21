# Contributing

Thank you for your interest in contributing to the App Center documentation!

In this topic, you'll see the basic process for adding or updating content in the [App Center documentation site](https://docs.microsoft.com/appcenter).

In this topic, we'll cover:

* [Process for contributing](#process-for-contributing)
* [Guidance checklist](#guidance-checklist)

## How can I contribute?

There is a variety of ways to contribute to the documentation. Review the sections below to find out which one is right for you.

### Report bugs or suggest enhancements

Please use the feedback tool at the bottom of any article to submit bugs and suggestions.

### Quick edit in GitHub

Follow the guidance for [quick edits to existing documents](https://docs.microsoft.com/contribute/#quick-edits-to-existing-documents) in the contributors guide.

### Larger edits

**Step 1:** For larger contributions of new content, _open an issue_ describing the article you wish to write and how it relates to existing content. The content inside the **docs** folder is organized into sections that are organized by content area (e.g. **build** and **distribution**). Try to determine the correct folder for your new content. Get feedback on your proposal via the issue before starting to write.

**Step 2:** Fork the `MicrosoftDocs/appcenter-docs` repository.

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

**Step 5:** Submit a Pull Request (PR) from your branch to `MicrosoftDocs/appcenter-docs/live`.

If your PR is addressing an existing issue, add the `Fixes #Issue_Number` keyword to the commit message or PR description, so the issue can be automatically closed when the PR is merged. For more information, see [Closing issues via commit messages](https://help.github.com/articles/closing-issues-via-commit-messages/).

The App Center team will review your PR and let you know if the change looks good or if there are any other updates/changes necessary in order to approve it.

**Step 6:** Make any necessary updates to your branch as discussed with the team.

The maintainers will merge your PR into the live branch once feedback has been applied and your change looks good.

On a certain cadence, we push all commits from live branch into the live site and then you'll be able to see your contribution at the [App Center docs site](https://docs.microsoft.com/appcenter/).

## DOs and DON'Ts

Below is a short list of guiding rules that you should keep in mind when you are contributing to the .NET documentation.

* **DON'T** surprise us with big pull requests. Instead, file an issue and start a discussion so we can agree on a direction before you invest a large amount of time.
* **DO** read the [style guide](./styleguide/template.md) and [voice and tone](./styleguide/voice-tone.md) guidelines.
* **DO** use the [template](./styleguide/template.md) file as the starting point of your work.
* **DO** create a separate branch on your fork before working on the articles.
* **DO** follow the [GitHub Flow workflow](https://guides.github.com/introduction/flow/).
* **DO** blog and tweet (or whatever) about your contributions, frequently!

> [!NOTE]
> You might notice that some of the topics are not currently following all the guidelines specified here and on the [style guide](./styleguide/template.md) as well. We're working towards achieving consistency throughout the site.
