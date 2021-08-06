$ProgressPreference = "SilentlyContinue"

$URL = "https://minecraft.net/en-us/download/server/bedrock/"
$DOWNLOAD = (Invoke-WebRequest $URL -Headers @{"Accept"="text/html"}).Content | Select-String -Pattern "https:\/\/\S*\/bin-linux\/\S*\.zip" | Foreach-Object {$_.Matches.Value}
$VERSION = $DOWNLOAD | Select-String -Pattern "(\d+\.){3}\d+" | Foreach-Object {$_.Matches.Value}
$OUTPUT = "bedrock_server.zip"

echo "Found bedrock_server $VERSION"

Invoke-WebRequest -Uri $DOWNLOAD -OutFile $OUTPUT
7z x $OUTPUT
