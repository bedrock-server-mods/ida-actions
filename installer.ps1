$IDA_VERSION = $args[0]

mv ida.zip installer/$IDA_VERSION
cd installer/$IDA_VERSION
$IDA_DIR = .\installer.ps1 | Select-Object -Last 1
cp ../../database.idc "$IDA_DIR\idc\analysis.idc"
echo "IDA_DIR=$IDA_DIR" >> $env:GITHUB_ENV
