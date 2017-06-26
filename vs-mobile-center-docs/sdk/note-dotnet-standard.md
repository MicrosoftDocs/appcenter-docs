> [!NOTE]
> If you add the NuGet packages to a portable project using **.NET standard**, you need to add this `frameworks` section to your **project.json** file:
>
> ```javascript
> {
>   "dependencies": {
>     "NETStandard.Library": "1.6.1"
>   },
>   "frameworks": {
>     "netstandard1.{version}": {
>         "imports": "portable-net45+win8+wpa81"
>     }
>   }
> }
> ```
>
> Replace `{version}` with the .NET standard version of your project.
