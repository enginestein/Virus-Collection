VERSION 5.00

Begin VB.Form frmInput
    Caption = "Form1"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 1
    Icon = frmInput.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 45
    ClientTop    = 330
    ClientWidth  = 4680
    ClientHeight = 3330
    LockControls = -1              'True
    StartupPosition = 2
    Begin VB.CommandButton cmdOK
        Caption = "&OK"
        Left   = 780
        Top    = 2670
        Width  = 1155
        Height = 405
        TabIndex = 1
        Default = -1              'True
    End
    Begin VB.CommandButton cmdCancel
        Caption = "&Cancel"
        Left   = 2640
        Top    = 2670
        Width  = 1155
        Height = 405
        TabIndex = 2
    End
    Begin VB.Frame fraQuestion
        Left   = 90
        Top    = 1350
        Width  = 4455
        Height = 1005
        TabIndex = 3
        Begin VB.TextBox txtAnswer
            Left   = 150
            Top    = 390
            Width  = 4155
            Height = 345
            TabIndex = 0
            MultiLine = -1              'True
        End
    End
    Begin VB.Label lblDescription
        Left   = 270
        Top    = 210
        Width  = 4125
        Height = 915
        TabIndex = 4
    End
End
