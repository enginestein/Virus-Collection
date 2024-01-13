VERSION 5.00

Begin VB.Form frmGoldLogin
    Caption = "Gold Membership Login"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ControlBox = 0              'False
    Visible = 0              'False
    ClientLeft   = 45
    ClientTop    = 330
    ClientWidth  = 5685
    ClientHeight = 2550
    ShowInTaskbar = 0              'False
    StartupPosition = 3
    Begin VB.Frame Frame1
        Caption = "Gold Member Logon Information"
        Left   = 120
        Top    = 120
        Width  = 5445
        Height = 2295
        TabIndex = 5
        Begin VB.CommandButton cmdCancel
            Caption = "&Cancel"
            Left   = 2962
            Top    = 1695
            Width  = 1095
            Height = 375
            TabIndex = 4
            Cancel = -1              'True
        End
        Begin VB.CheckBox chkSavePassword
            Caption = "Remember my password when logging in."
            Left   = 360
            Top    = 1230
            Width  = 3315
            Height = 195
            TabIndex = 2
            Value = 1
        End
        Begin VB.CommandButton cmdLogin
            Caption = "&Login"
            Left   = 1627
            Top    = 1695
            Width  = 1095
            Height = 375
            TabIndex = 3
            Default = -1              'True
        End
        Begin VB.TextBox txtEmail
            Left   = 2550
            Top    = 330
            Width  = 2475
            Height = 315
            TabIndex = 0
        End
        Begin VB.TextBox txtPassword
            Left   = 2550
            Top    = 750
            Width  = 2475
            Height = 315
            TabIndex = 1
            PasswordChar = "*"
            IMEMode = 3
        End
        Begin VB.Label Label9
            Caption = "Password:"
            Left   = 360
            Top    = 810
            Width  = 735
            Height = 195
            TabIndex = 7
            AutoSize = -1              'True
        End
        Begin VB.Label Label8
            Caption = "Email Address:"
            Left   = 360
            Top    = 390
            Width  = 1035
            Height = 195
            TabIndex = 6
            AutoSize = -1              'True
        End
    End
End
