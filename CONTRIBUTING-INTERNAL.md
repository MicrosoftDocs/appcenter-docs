# Contributing
Thanks for your interest in contributing to the App Center documentation!

This guide covers some general topics around contributing and refers out to the docs.microsoft.com contributors guide for more detailed explanations.

## Code of conduct
This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information, see the [Code of conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/), or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## How can I contribute?
There is a variety of ways to contribute to the documentation. Review the sections below to find out which one is right for you.

### Report bugs or suggest enhancements
Use the feedback tool at the bottom of any article to submit bugs and suggestions.

### Quick edit in GitHub
Follow the guidance for [quick edits to existing documents](https://docs.microsoft.com/contribute/#quick-edits-to-existing-documents) in the contributors guide.

### Larger edits
Review the guidance for [pull requests](https://docs.microsoft.com/contribute/how-to-write-workflows-major#pull-request-processing) in the contributors guide.

1.  Before you begin, make sure that your local master branch is up to date with the remote by using `git pull --rebase`.  
2. Create a `branch` for your changes in the format `alias-functions` (e.g. `amburns-update-page`).
3. Write your content.

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

4. Submit a Pull Request (PR) from your branch to `MicrosoftDocs/appcenter-docs-pr/master`.

    If your PR is addressing an existing issue, add the `Fixes {link to issue}` keyword to the commit message or PR description, so the issue can be automatically closed when the PR is merged. For more information, see [Closing issues via commit messages](https://help.github.com/articles/closing-issues-via-commit-messages/).

    ### PR Automation

    There are two tools that run every time you create a PR that you need to pay attention to: Build Status and PR Merger. They work together as follows:

    - Build status will check for any basic quality issues, including spelling and valid links. **You must fix all these issues before you can go to the next step**
    - Once there is a successful build on your PR, PR Merger will assess these validation filters on your changes. 
    - If the PR meets all the criteria:
        - it will add the label “qualifies-for-automerge”
        - **Once you have reviewed the preview page and are happy with the content, comment `#sign-off`**.
        - Once PRMerger sees the sign-off comment, it adds the `ready-to-merge` label, confirms the filters were successful, and the build has passed. PRMerger will then proceed to auto-merge this Pull Request and add a label merged-by-prmerger
    
    - If the PR does not meet the criteria: 
        - A “needs-human-review" label will be added. 
        - The designated pull request reviewers for the repository have to review the pull request (right now this is Amy Burns)
        - The reviewer will check the content, particularly for these quality issues listed. 
        - If there are issues, they add a comment #hold-off and notify the author to fix.
        - The author will need to fix the issues in a timely manner and add #sign-off when they are happy that the issues are fixed.
    
    Remember, before signing off any PR, it’s your responsibility to ensure it has had a technical review.

On a certain cadence, we push all commits from the master branch into the live site and then you'll be able to see your contribution at the [App Center docs site](https://docs.microsoft.com/appcenter/).


