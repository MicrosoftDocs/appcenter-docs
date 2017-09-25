> [!NOTE]
> If you want to add the NuGet packages to a portable project using **.NET standard** you need to modify your project before.
> 
> If you use the new **csproj file** format for dependencies, you need to add this xml section to that file:
>
> ```xml
> <PropertyGroup>
>    <PackageTargetFallback>portable-net45+win8+wpa81</PackageTargetFallback>
> </PropertyGroup>
> ```
>
> However if you are still using the deprecated **project.json** file you need to add this `frameworks` section in that file:
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
