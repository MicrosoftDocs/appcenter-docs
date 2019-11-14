---
title: Uploading symbols through the API
author: cainejette
---

1. Trigger a `POST` request to the [symbol_uploads API](https://openapi.appcenter.ms/#/crash/symbolUploads_create).
This call allocates space on our backend for your file and returns a `symbol_upload_id` and an `upload_url` property.

```shell
curl -X POST 'https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/symbol_uploads' \
    -H 'accept: application/json' \
    -H 'X-API-Token: {API TOKEN}' \
    -H 'Content-Type: application/json' \
    -d '{JSON BODY}'
```

2. Using the `upload_url` property returned from the first step, make a `PUT` request with the header: `"x-ms-blob-type: BlockBlob"` and supply the location of your file on disk.  This call uploads the file to our backend storage accounts. Learn more about [PUT Blob request headers ](https://docs.microsoft.com/rest/api/storageservices/put-blob#request-headers-all-blob-types).

```shell
curl -X PUT '{upload_url}' \
    -H 'x-ms-blob-type: BlockBlob' \
    --upload-file '{path to file}'
```

3. Make a `PATCH` request to  the [symbol_uploads API](https://openapi.appcenter.ms/#/crash/symbolUploads_complete) using the `symbol_upload_id` property returned from the first step. In the body of the request, specify whether you want to set the status of the upload to `committed` (successfully completed) the upload process, or `aborted` (unsuccessfully completed).

```shell
curl -X PATCH 'https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/symbol_uploads/{symbol_upload_id}' \
    -H 'accept: application/json' \
    -H 'X-API-Token: {API TOKEN}' \
    -H 'Content-Type: application/json' \
    -d '{ "status": "committed" }'
```

> [!NOTE]
> The symbol uploads API does not work for files that are larger than 256MB. Please use the App Center CLI to upload these files. You can install the App Center CLI by following the instructions in our [App Center CLI repo](https://github.com/microsoft/appcenter-cli).
