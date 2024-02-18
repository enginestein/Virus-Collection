VERSION 5.00

Begin VB.Form frmGoldChangePassword
    Caption = "Change Gold Member Password"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 45
    ClientTop    = 330
    ClientWidth  = 4575
    ClientHeight = 1950
    ShowInTaskbar = 0              'False
    StartupPosition = 1
    Begin VB.TextBox txtOldPassword
        Left   = 1920
        Top    = 240
        Width  = 2535
        Height = 285
        TabIndex = 0
    End
    Begin VB.TextBox txtPassword2
        Left   = 1920
        Top    = 990
        Width  = 2535
        Height = 285
        TabIndex = 2
    End
    Begin VB.TextBox txtPassword
        Left   = 1920
        Top    = 615
        Width  = 2535
        Height = 285
        TabIndex = 1
    End
    Begin VB.CommandButton cmdCancel
        Caption = "&Cancel"
        Left   = 3480
        Top    = 1440
        Width  = 975
        Height = 375
        TabIndex = 4
        Cancel = -1              'True
    End
    Begin VB.CommandButton cmdOk
        Caption = "&Ok"
        Left   = 2280
        Top    = 1440
        Width  = 975
        Height = 375
        TabIndex = 3
        Default = -1              'True
    End
    Begin VB.Label Label3
        Caption = "Current Password:"
        Left   = 120
        Top    = 285
        Width  = 1770
        Height = 195
        TabIndex = 7
    End
    Begin VB.Label Label2
        Caption = "Confirm New Password:  "
        Left   = 120
        Top    = 1035
        Width  = 1770
        Height = 195
        TabIndex = 6
    End
    Begin VB.Label Label1
        Caption = "New Password:  "
        Left   = 120
        Top    = 660
        Width  = 1770
        Height = 195
        TabIndex = 5
    End
End
