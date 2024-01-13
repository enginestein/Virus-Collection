VERSION 5.00

Begin VB.Form frmGoldPasswordEntry
    Caption = "Please enter your Gold Member Password"
    ScaleLeft   = 0
    ScaleTop    = 0
    ScaleWidth  = 0
    ScaleHeight = 0
    ScaleMode   = 0
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    Icon = frmGoldPasswordEntry.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 2835
    ClientTop    = 3480
    ClientWidth  = 4410
    ClientHeight = 1290
    ShowInTaskbar = 0              'False
    StartupPosition = 2
    Begin VB.CommandButton cmdOK
        Caption = "OK"
        Left   = 833
        Top    = 780
        Width  = 1140
        Height = 390
        TabIndex = 2
        Default = -1              'True
    End
    Begin VB.CommandButton cmdCancel
        Caption = "Cancel"
        Left   = 2438
        Top    = 780
        Width  = 1140
        Height = 390
        TabIndex = 3
        Cancel = -1              'True
    End
    Begin VB.TextBox txtPassword
        Left   = 1155
        Top    = 195
        Width  = 2445
        Height = 405
        TabIndex = 1
        PasswordChar = "*"
        IMEMode = 3
    End
    Begin VB.Label lblLabels
        Caption = "&Password:  "
        Index = 1
        Left   = 210
        Top    = 300
        Width  = 825
        Height = 195
        TabIndex = 0
        AutoSize = -1              'True
    End
End
