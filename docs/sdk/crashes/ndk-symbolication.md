#### Obtaining symbol files

1. Dump the symbols using the Breakpad toolchain as described in the [Breakpad documentation](https://chromium.googlesource.com/breakpad/breakpad/+/master/README.ANDROID#93).
2. Create a **symbols.zip** file with the following structure:

```text
$ unzip -l symbols.zip 
Archive:  symbols.zip
  Length     Date   Time    Name
 --------    ----   ----    ----
        0  07-22-13 15:07   symbols/
        0  07-22-13 15:07   symbols/libnative.so/
        0  07-22-13 15:07   symbols/libnative.so/EAC901FB6DDCCE8AED89E1A8E4A58360/
    12468  07-22-13 15:07   symbols/libnative.so/EAC901FB6DDCCE8AED89E1A8E4A58360/libnative.so.sym
        0  07-22-13 15:07   symbols/libnative.so/FDC5C9E715C4F16408C0B78F95855BF0/
    12467  07-22-13 15:07   symbols/libnative.so/FDC5C9E715C4F16408C0B78F95855BF0/libnative.so.sym
 --------                   -------
    24935                   6 files
```

#### Uploading symbol files

1. Log into App Center and select your app
2. In the left menu, navigate to the **Diagnostics** section
3. Select the **Unsymbolicated** tab
4. In the top-right corner, click **Upload symbols** and upload the zip file
5. After the zip file is indexed by App Center, new incoming crashes will be symbolicated for you
