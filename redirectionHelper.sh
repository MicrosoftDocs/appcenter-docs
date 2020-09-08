# Old path in repo (product/path-to/article.md)
sourcePaths=()
sourcePaths+=(\
	#example
	#test-cloud/supported-frameworks.md
    
)

# Target path on website (product/path-to/article)
redirectUrls=()
redirectUrls+=(\
	#example
	#test-cloud/frameworks/
)

# Construct Redirects
for ((i=0; i<${#sourcePaths[@]}; i++));
do
	echo \{
	echo \"source_path\": \"docs/${sourcePaths[$i]}\",
	echo \"redirect_url\": \"/appcenter/${redirectUrls[$i]}\"
	echo \},
done