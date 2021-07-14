$ProgressPreference = "SilentlyContinue"

$URL = "https://www.minecraft.net/en-us/download/server/bedrock/"
$DOWNLOAD = (curl --silent --location --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0" --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" --header "Accept-Language: ru-RU,ru;q=0.8,en-US;q=0.5,en;q=0.3" --header "DNT: 1" --header "Connection: keep-alive" --header "Upgrade-Insecure-Requests: 1" --header "Cache-Control: max-age=0" $URL).Content | Select-String -Pattern "https:\/\/\S*\/bin-linux\/\S*" | Foreach-Object {$_.Matches.Value}
$DOWNLOAD = $DOWNLOAD.Substring(0, $DOWNLOAD.Length - 1)
$VERSION = $DOWNLOAD | Select-String -Pattern "(\d+\.){3}\d+" | Foreach-Object {$_.Matches.Value}
$OUTPUT = "bedrock_server.zip"

echo "Found bedrock_server $VERSION"

Invoke-WebRequest -Uri $DOWNLOAD -OutFile $OUTPUT
7z x $OUTPUT
