VERSION 5.00

Begin VB.Form frmBBIMDialog
    Caption = "BonziWORLD™ Logon Password Required"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    Icon = frmBBIMDialog.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 2760
    ClientTop    = 3750
    ClientWidth  = 5160
    ClientHeight = 1110
    LockControls = -1              'True
    ShowInTaskbar = 0              'False
    StartupPosition = 1
    Begin VB.TextBox txtPass
        Left   = 180
        Top    = 480
        Width  = 3075
        Height = 315
        TabIndex = 0
        PasswordChar = "*"
        IMEMode = 3
    End
    Begin VB.CommandButton CancelButton
        Caption = "Cancel"
        Left   = 3720
        Top    = 600
        Width  = 1215
        Height = 375
        TabIndex = 2
        Cancel = -1              'True
    End
    Begin VB.CommandButton OKButton
        Caption = "OK"
        Left   = 3720
        Top    = 120
        Width  = 1215
        Height = 375
        TabIndex = 1
        Default = -1              'True
    End
    Begin VB.Label lblEnterPassword
        Caption = "Please enter your logon password."
        Left   = 210
        Top    = 270
        Width  = 2430
        Height = 195
        TabIndex = 3
        AutoSize = -1              'True
    End
End
