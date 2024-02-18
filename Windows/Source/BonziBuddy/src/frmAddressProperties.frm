VERSION 5.00

Begin VB.Form frmAddressProperties
    Caption = "Address Book Entry"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 1
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ControlBox = 0              'False
    ClientLeft   = 45
    ClientTop    = 330
    ClientWidth  = 5040
    ClientHeight = 1350
    LockControls = -1              'True
    StartupPosition = 1
    Begin VB.CommandButton cmdOK
        Caption = "&OK"
        Left   = 2820
        Top    = 900
        Width  = 975
        Height = 375
        TabIndex = 5
        Default = -1              'True
    End
    Begin VB.CommandButton cmdCancel
        Caption = "&Cancel"
        Left   = 3930
        Top    = 900
        Width  = 975
        Height = 375
        TabIndex = 4
        Cancel = -1              'True
    End
    Begin VB.TextBox txtAddress
        Left   = 1290
        Top    = 510
        Width  = 3615
        Height = 285
        TabIndex = 3
    End
    Begin VB.TextBox txtName
        Left   = 1290
        Top    = 90
        Width  = 3615
        Height = 285
        TabIndex = 0
    End
    Begin VB.Label Label2
        Caption = "E-Mail Address:"
        Left   = 120
        Top    = 540
        Width  = 1095
        Height = 195
        TabIndex = 2
        AutoSize = -1              'True
    End
    Begin VB.Label Label1
        Caption = "Name:"
        Left   = 750
        Top    = 120
        Width  = 465
        Height = 195
        TabIndex = 1
        AutoSize = -1              'True
    End
End
