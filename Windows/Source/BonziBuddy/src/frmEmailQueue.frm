VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "C:\Windows\system32\MSINET.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "C:\Windows\system32\MSCOMCTL.OCX"

Begin VB.Form frmEmailQueue
    Caption = "BonziBUDDY Message Queue"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    Icon = frmEmailQueue.frx:0000
    LinkTopic = "Form1"
    ControlBox = 0              'False
    ClientLeft   = 60
    ClientTop    = 345
    ClientWidth  = 7620
    ClientHeight = 3945
    LockControls = -1              'True
    StartupPosition = 2
    Begin InetCtlsObjects.Inet Inet1
        OleObjectBlob = frmEmailQueue.frx:0456
        Left = 5520
        Top = 120
    End
    Begin VB.CommandButton cmdHelp
        Caption = "&Help"
        Left   = 4920
        Top    = 3480
        Width  = 1215
        Height = 375
        TabIndex = 2
    End
    Begin VB.CommandButton cmdRetry
        Caption = "&Retry"
        Left   = 120
        Top    = 3480
        Width  = 1215
        Height = 375
        TabIndex = 1
    End
    Begin VB.CommandButton cmdSend
        Caption = "&Send"
        Left   = 6240
        Top    = 120
        Width  = 1215
        Height = 375
        Visible = 0              'False
        TabIndex = 4
        TabStop = 0              'False
    End
    Begin VB.Timer tmrReloadMsgs
        Enabled = 0              'False
        Interval = 100
        Left = 3840
        Top = 120
    End
    Begin VB.CommandButton cmdClose
        Caption = "&Close"
        Left   = 6360
        Top    = 3480
        Width  = 1215
        Height = 375
        TabIndex = 3
        Default = -1              'True
    End
    Begin MSComctlLib.ListView lviewQueue
        Left   = 120
        Top    = 120
        Width  = 3495
        Height = 1575
        TabIndex = 0
        OleObjectBlob = frmEmailQueue.frx:0456
    End
    Begin UTDNSLibCtl.DNS DNS1
        OleObjectBlob = frmEmailQueue.frx:0456
        Left = 4920
        Top = 240
    End
End
