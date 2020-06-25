$IDA = "IDA PRO 7.2"
$EXE = "x64_idapronw_hexx64w_181105_de455c480e11ef1ec91473028f4dd175.exe"
$KEY = "install_key.txt"

7z e ida.zip "$IDA/$EXE" "$IDA/$KEY"

$PASSWORD = type $KEY
& .\$EXE /VERYSILENT /PASSWORD=$PASSWORD | Out-Null

reg import patch.reg
dir 'C:\Program Files\IDA 7.2'
