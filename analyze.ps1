$BDS_PLATFORM = $args[0]

$FILENAME = if ( $BDS_PLATFORM -eq "linux" )
{
    "bedrock_server"
}
elseif ( $BDS_PLATFORM -eq "win" )
{
    "bedrock_server.exe"
}
else
{
    throw "Unknown platform"
}

& "$env:IDA_DIR\idat64.exe" -P+ -B $FILENAME
7z a bedrock_server.zip bedrock_server.i64
