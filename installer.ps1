mv ida.zip installer/${{ matrix.ida_version }}
cd installer/${{ matrix.ida_version }}
$IDA_DIR = .\installer.ps1 | Select-Object -Last 1
cp ../../database.idc "$IDA_DIR\idc\analysis.idc"
echo "IDA_DIR=$IDA_DIR" >> $env:GITHUB_ENV
