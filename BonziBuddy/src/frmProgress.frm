VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "C:\Windows\system32\MSCOMCTL.OCX"

Begin VB.Form frmProgress
    Caption = "BonziBUDDY Update Progress"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 1
    Icon = frmProgress.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    ClientLeft   = 45
    ClientTop    = 330
    ClientWidth  = 3825
    ClientHeight = 900
    LockControls = -1              'True
    StartupPosition = 2
    Begin VB.Frame fraProgress
        Caption = "Update Progress"
        Left   = 120
        Top    = 90
        Width  = 3585
        Height = 675
        TabIndex = 0
        Begin MSComctlLib.ProgressBar prgDL
            Left   = 150
            Top    = 240
            Width  = 3315
            Height = 315
            TabIndex = 1
            OleObjectBlob = frmProgress.frx:08DE
        End
    End
End
