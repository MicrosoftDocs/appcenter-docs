---
title: Ignoring symbols
author: cainejette
---

## Ignoring symbols

When App Center does not have all the symbol files to fully symbolicate crash reports, the crashes are listed in the **Unsymbolicated** tab. The required symbols can be uploaded from this page, but sometimes you may not have the symbols anymore, or the symbols may belong to third party libraries you don't have access to. In these scenarios where you won't be uploading the symbols, you can mark them as **Ignored** by selecting rows in the table and clicking the **Ignore versions** button. This will signal to App Center to process these crashes and symbolicate them as fully as possible with the symbols on file. Once they have finished processing, they will appear in the **Crashes** tab partially symbolicated. New crashes that also depend on those same symbol IDs marked as ignored will bypass the **Unsymbolicated** tab as they come in and flow through the system.