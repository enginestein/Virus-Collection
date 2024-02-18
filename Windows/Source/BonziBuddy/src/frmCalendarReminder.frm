VERSION 5.00

Begin VB.Form frmCalendarReminder
    Caption = "BonziBUDDY Scheduled Reminder! "
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 1
    Icon = frmCalendarReminder.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 45
    ClientTop    = 330
    ClientWidth  = 6165
    ClientHeight = 1875
    LockControls = -1              'True
    StartupPosition = 3
    Begin VB.CommandButton cmdYes
        Caption = "&Dismiss"
        Left   = 2460
        Top    = 1410
        Width  = 1215
        Height = 375
        TabIndex = 0
        Default = -1              'True
    End
    Begin VB.Frame fraMain
        Left   = 780
        Top    = 120
        Width  = 5175
        Height = 1125
        TabIndex = 1
        Begin VB.Label lblReminder
            BackColor = -2147483634
            Left   = 120
            Top    = 240
            Width  = 4935
            Height = 735
            TabIndex = 2
            BorderStyle = 1
            WordWrap = -1              'True
        End
    End
    Begin VB.Image Image1
        Picture = frmCalendarReminder.frx:0756
        Left   = 150
        Top    = 300
        Width  = 480
        Height = 480
    End
End
