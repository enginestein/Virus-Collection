Set wshShell =wscript.CreateObject(“WScript.Shell”)
do
wscript.sleep 100
wshshell.sendkeys “{CAPSLOCK}”
wshshell.sendkeys “{NUMLOCK}”
loop