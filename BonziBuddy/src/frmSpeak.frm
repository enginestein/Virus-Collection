VERSION 5.00

Begin VB.Form frmSpeak
    Caption = "Speak Bonzi, Speak!"
    BackColor = 16777215
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 1
    Icon = frmSpeak.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 45
    ClientTop    = 330
    ClientWidth  = 6120
    ClientHeight = 5400
    StartupPosition = 2
    Begin VB.Timer tmrButternutAnimation
        Interval = 1000
        Left = 0
        Top = 0
    End
    Begin VB.PictureBox Picture4
        BackColor = -2147483643
        Picture = frmSpeak.frx:08DE
        ForeColor = 16777215
        Left   = 0
        Top    = 0
        Width  = 9630
        Height = 1155
        TabIndex = 5
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        FillColor = 16777215
        BorderStyle = 0
        Appearance = 0
        Begin Threed.SSCommand cmdAddons
            Left   = 2490
            Top    = -30
            Width  = 3660
            Height = 585
            TabIndex = 6
            OleObjectBlob = frmSpeak.frx:6323
        End
    End
    Begin VB.CommandButton cmdCancel
        Caption = "&Cancel"
        Left   = 3330
        Top    = 4890
        Width  = 1215
        Height = 375
        TabIndex = 4
    End
    Begin VB.CommandButton cmdSpeak
        Caption = "&Say it!"
        Left   = 1530
        Top    = 4890
        Width  = 1215
        Height = 405
        TabIndex = 3
        Default = -1              'True
    End
    Begin VB.Frame Frame1
        Caption = "Bonzi Says:"
        BackColor = 16777215
        Left   = 210
        Top    = 1680
        Width  = 5685
        Height = 3105
        TabIndex = 0
        Begin VB.TextBox txtSpeak
            ForeColor = 32768
            Left   = 270
            Top    = 360
            Width  = 5145
            Height = 2475
            TabIndex = 1
            MultiLine = -1              'True
            ScrollBars = 2
        End
    End
    Begin VB.Label lblDescription
        Caption = "What would you like me to say? Type something below and I will be happy to say it for you. Press F1 at any time if you need help."
        BackColor = 16777215
        ForeColor = 32768
        Left   = 240
        Top    = 1200
        Width  = 5625
        Height = 705
        TabIndex = 2
    End
End
