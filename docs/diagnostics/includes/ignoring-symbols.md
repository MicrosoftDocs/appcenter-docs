---
title: Ignoring symbols
author: king-of-spades
ms.author: kegr
ms.topic: include
---

## Ignoring symbols
When App Center doesn't have all the symbol files to fully symbolicate crash reports, the crashes are listed in the **Unsymbolicated** tab. The required symbols are uploaded from this page if you have access to them.

If you can't upload the symbols, you can mark them as **Ignored** by selecting rows in the table and clicking the **Ignore versions** button. This button tells App Center to process the crashes and symbolicate them as fully as possible with the symbols on file. Once they've finished processing, they'll appear in the **Crashes** tab partially symbolicated. New crashes that also depend on those same symbol IDs marked as ignored will bypass the **Unsymbolicated** tab as they come in and flow through the system.