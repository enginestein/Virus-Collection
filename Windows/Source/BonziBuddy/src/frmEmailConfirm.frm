VERSION 5.00

Begin VB.Form frmEmailConfirm
    Caption = "BonziMAIL© - E-Mail Adress Confirmation"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    Icon = frmEmailConfirm.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 2760
    ClientTop    = 3750
    ClientWidth  = 6750
    ClientHeight = 2475
    LockControls = -1              'True
    ShowInTaskbar = 0              'False
    StartupPosition = 2
    Begin VB.Frame Frame1
        Caption = "E-Mail Address Confirmation:"
        Left   = 120
        Top    = 150
        Width  = 6465
        Height = 735
        TabIndex = 6
        Begin VB.Label Label3
            Caption = "Please enter and confirm your e-mail address here. This will allow us to send BonziMAIL©."
            Left   = 570
            Top    = 240
            Width  = 5385
            Height = 405
            TabIndex = 7
        End
    End
    Begin VB.TextBox txtAddress
        Left   = 2100
        Top    = 1020
        Width  = 3675
        Height = 315
        TabIndex = 0
    End
    Begin VB.TextBox txtAddressConfirm
        Left   = 2100
        Top    = 1470
        Width  = 3675
        Height = 315
        TabIndex = 1
    End
    Begin VB.CommandButton cmdCancel
        Caption = "Cancel"
        Left   = 3600
        Top    = 1950
        Width  = 1215
        Height = 375
        TabIndex = 3
        Cancel = -1              'True
    End
    Begin VB.CommandButton cmdOK
        Caption = "OK"
        Left   = 2130
        Top    = 1950
        Width  = 1215
        Height = 375
        TabIndex = 2
        Default = -1              'True
    End
    Begin VB.Label Label2
        Caption = "E-Mail Address:"
        Left   = 945
        Top    = 1080
        Width  = 1095
        Height = 195
        TabIndex = 5
        AutoSize = -1              'True
    End
    Begin VB.Label Label1
        Caption = "Re-Enter E-Mail Address:"
        Left   = 270
        Top    = 1530
        Width  = 1770
        Height = 195
        TabIndex = 4
        AutoSize = -1              'True
    End
End
