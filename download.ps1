$ProgressPreference = "SilentlyContinue"

$URL = "https://minecraft.net/en-us/download/server/bedrock/"
$DOWNLOAD = (Invoke-WebRequest $URL).Content | Select-String -Pattern "https:\/\/\S*\/bin-linux\/\S*" | Foreach-Object {$_.Matches.Value}
$DOWNLOAD = $DOWNLOAD.Substring(0, $DOWNLOAD.Length - 1)
$VERSION = $DOWNLOAD | Select-String -Pattern "(\d+\.){3}\d+" | Foreach-Object {$_.Matches.Value}
$OUTPUT = "bedrock_server.zip"

echo "Found bedrock_server $VERSION"

Invoke-WebRequest -Uri $DOWNLOAD -OutFile $OUTPUT
7z x $OUTPUT
