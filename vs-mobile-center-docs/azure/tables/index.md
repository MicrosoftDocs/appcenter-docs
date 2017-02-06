---
title: Mobile Center Table Data Storage
description:
keywords: azure
author: adrianhall
ms.author: adrianha
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 34b27f0c-7380-421f-8cbd-fc36563af33c
ms.service: mobile-center
---

# Table Data Storage

The Tables feature of Mobile Center provides a cloud-based data store for tabular data.  You can define multiple tables
and each table can have a unique set of fields.

When you first enter the Tables feature, Mobile Center will create Azure resources on your behalf.  This includes:

* An Azure Resource Group named mobile-`{guid}`.
* An Azure App Service Plan named mobile-`{guid}`.
* An Azure App Service named mobile-`{guid}`.

The `{guid}` is replaced by the Mobile Center App Id.  The appropriate endpoint is displayed in the Tables or Identity
beacons.  Initially, all resources are provided at a free pricing plan located in the South Central US region.  You can
change the pricing plan by changing the underlying resources in the [Azure portal].

## Creating a Table

To create a new table, click on the **Create Table** button:

![][img1]

Enter a unique name for the table.  In addition, you may specify the table options:

* **Soft Delete** is used to inform disconnected clients that a record has been deleted.  You should always enable
    soft delete for tables that support Offline Sync.
* **Dynamic Schema** allows the mobile client to specify the fields that need to be stored.  Columns will automatically
    be created when needed.  You should not enable this on tables that will be accessed anonymously.
* **Per-user data** adds a `userId` field automatically.  This is managed for you.  Users can only see data that they
    have inserted into the table.   Ensure you set the table to be "Authenticated" after configuring this option.

When you have completed the form, click the **Create** button.  Once created, the table will be added to the table list.

## Specifying Permissions

If you have configured Identity, each table operation can be adjusted between "Anonymous", "Authenticated" or "Disabled":

* **Anonymous** indicates that any client can access the endpoint.
* **Authenticated** indicates a valid Azure Mobile Apps identity token must be submitted with the request.  If a valid
    token is not submitted, the endpoint will return a 401 Unauthorized response.
* **Disabled** indicates that the endpoint is disabled.  Requests to the endpoint will return a 404 Not Found response.

To specify permissions:

* Click **Tables** in the left hand navigation menu.
* Click the name of the table you wish to adjust.
* Click the drop-down of the menu (next to **Edit Schema**) on the right-hand side of the page.
* Select **Change Permissions** from the drop-down menu.

There are five endpoints:

| Permission | Endpoint |
| ---------- | -------- |
| Read | `GET /tables/{tableName}/{id?}` |
| Insert | `POST /tables/{tableName}` |
| Update | `PATCH /tables/{tableName}/{id}` |
| Delete | `DELETE /tables/{tableName}/{id`} |
| Undelete | `POST /tables/{tableName}/{id}` |

Adjust the permissions to match your needs by selecting the appropriate permission for each endpoint.  Once complete, click **Save**.

## Adjusting Table Options

You can enable or disable **Soft Delete** and **Dynamic Schema** after you have created the table:

* Click **Tables** in the left hand navigation menu.
* Click the name of the table you wish to adjust.
* Click the drop-down of the menu (next to **Edit Schema**) on the right-hand side of the page.
* Select **Options** from the drop-down menu.

Update the table options as you require, then click **Save**.

The per-user table option is selected in the **Change Permissions** dialog.

## Edit the Table Schema

If you turn off **Dynamic Schema**, then you will need to specify the columns that are expected.  Only columns that have been previously created will be accepted.  If
**Dynamic Schema** is enabled, columns will be dynamically created based on incoming requests.  Although possible, you should never enable Dynamic Schema on a table
that accepts inserts or updates anonymously.

To view the schema:

* Click **Tables** in the left hand navigation menu.
* Click the name of the table you wish to adjust.
* Click **Edit Schema**.

There are five fields that will be available on every table. If per-user data is enabled, a sixth field (userId) is added to this list. You will not be able to delete or modify these fields:

* **id** is the globally unique ID for the record.
* **createdAt** is the date that the record was first inserted into the database.
* **updatedAt** is the date that the record was last updated in the database.
* **version** is an opaque string that uniquely identifies the version of the record.
* **deleted** is a boolean flag that indicates if the record is deleted.
* **userId** is the SID of the user that inserted the record (when per-user data is enabled).

To add a column, click on the **Add Column** button.  Enter a name and select a type for the field:

| Type | SQL Azure Type |
| ---- | -------------- |
| String | [NVARCHAR(MAX)][string-type] |
| Number | [FLOAT(53)][number-type] |
| Date | [DATETIMEOFFSET(7)][date-type] |
| Boolean | [BIT][boolean-type] |

Once you have entered the information, click on **Create**.

Any column that you create can be modified by highlighting the column and using the options underneath the drop-down menu
next to **Add Column**:

* **Set Index** adds an index in the SQL database for the column.  You should set this if you expect to be doing server-side queries against the column.
* **Clear Index** removes an index that you have previously set.
* **Delete Column** deletes the column.

You cannot change the type of the column after it has been created.  Delete the column and re-add it instead.

## Uploading Reference Data

You can upload reference data into a table using the **Upload CSV** option.  Prepare a CSV file as follows:

* The first line should be comma-delimited list of fields.  The five system fields should not be included.
* Add one line per record, comma-delimited.

You can use a spreadsheet to graphically edit the CSV file.  Once complete, use **File** -> **Save As** and select the file type as **CSV UTF-8 (Comma-delimited)**.

Once you have prepared the CSV file:

* Click **Tables** in the left hand navigation menu.
* Click the name of the table you wish to adjust.
* Click the drop-down of the menu (next to **Edit Schema**) on the right-hand side of the page.
* Select **Upload CSV** from the drop-down menu.
* Click the drag and drop area and select your CSV file from the file picker, or drag and drop the CSV file onto the drop area.
* Click **Upload**.

All columns must be created in advance of this process.  Use the **Edit Schema** option to add fields if necessary.  This option accepts CSV files up to 1MB in size.

## Other Table Options

You can perform the following options additionally:

* **Clear Table** will wipe all data from the table without affecting the schema.
* **Delete Table** will delete the table definition and all data within the table from the SQL database.
* **Refresh** will refresh the list of tables (useful if multiple developers are working on the same app).

## Reviewing Table Data

The current contents of the table are shown when the table is selected.

## Integrating Table Data into your Mobile App

You may use the Azure Mobile Apps SDK for accessing table data either online or through an offline cache.  Review the appropriate SDK
HOWTO documentation for more details:

* [Android]
* [iOS]
* [Xamarin]

## Service Limits and Notes

You may create a maximum of 250 tables.  Each table may have a maximum of 500 fields.   Table names and field names
must follow the rules for [SQL Azure Identifiers] and are case-insensitive.


[img1]: images/create-table.png
[Azure portal]: https://portal.azure.com
[SQL Azure Identifiers]: https://msdn.microsoft.com/en-us/library/ms175874.aspx
[string-type]: https://msdn.microsoft.com/en-us/library/ms186939.aspx
[number-type]: https://msdn.microsoft.com/en-us/library/ms173773.aspx
[date-type]: https://msdn.microsoft.com/en-us/library/bb630289.aspx
[boolean-type]: https://msdn.microsoft.com/en-us/library/ms177603.aspx
[Android]: https://docs.microsoft.com/azure/app-service-mobile/app-service-mobile-android-how-to-use-client-library
[iOS]: https://docs.microsoft.com/azure/app-service-mobile/app-service-mobile-ios-how-to-use-client-library
[Xamarin]: https://docs.microsoft.com/azure/app-service-mobile/app-service-mobile-dotnet-how-to-use-client-library
