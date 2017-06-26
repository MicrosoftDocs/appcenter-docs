If your protable project is using **.NET standard**, you need to add this ``frameworks`` section to your **project.json** file:

```javacript
{
  "dependencies": {
    "NETStandard.Library": "1.6.1"
  },
  "frameworks": {
    "netstandard1.{version}": {
        "imports": "portable-net45+win8+wpa81"
    }
  }
}
```

Replace `{version}` by the .NET standard version of your project.
