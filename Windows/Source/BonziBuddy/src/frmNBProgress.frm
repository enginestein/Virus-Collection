VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "C:\Windows\system32\MSCOMCTL.OCX"

Begin VB.Form frmNBProgress
    Caption = "Optimizing Internet Connection..."
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 1
    Icon = frmNBProgress.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 45
    ClientTop    = 330
    ClientWidth  = 5280
    ClientHeight = 1095
    LockControls = -1              'True
    StartupPosition = 2
    Begin VB.Timer Timer1
        Interval = 2
        Left = 15
        Top = 975
    End
    Begin VB.Frame fraOptimize
        Caption = "Optimizing Your Internet Connection for a LAN..."
        Left   = 135
        Top    = 105
        Width  = 5025
        Height = 855
        TabIndex = 0
        Begin MSComctlLib.ProgressBar ProgressBar1
            Left   = 960
            Top    = 300
            Width  = 3855
            Height = 375
            TabIndex = 1
            OleObjectBlob = frmNBProgress.frx:0456
        End
        Begin VB.Image imgOptimize2
            Picture = frmNBProgress.frx:0456
            Left   = 300
            Top    = 270
            Width  = 480
            Height = 480
        End
        Begin VB.Image imgOptimize1
            Picture = frmNBProgress.frx:08AC
            Left   = 300
            Top    = 270
            Width  = 480
            Height = 480
        End
    End
End
