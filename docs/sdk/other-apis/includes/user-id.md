After setting a user ID, you can use App Center's search feature to search for specific crash reports for the ID. Learn more in App Center's [search documentation](~/diagnostics/search.md). 

> [!NOTE]
> The value for the user ID is limited to 256 characters.
> It will be shown with your crash reports but not used for aggregation or counts of affected users.
> In case you set user ID multiple times, only the last user ID will be used.
> You need to set the user ID yourself before each application launch, because this value isn't stored by the SDK between launches.
