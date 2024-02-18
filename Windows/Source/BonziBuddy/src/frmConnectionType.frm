VERSION 5.00

Begin VB.Form frmConnectionType
    Caption = "How should we connect to the Internet?"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 1
    Icon = frmConnectionType.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 45
    ClientTop    = 330
    ClientWidth  = 4680
    ClientHeight = 3735
    LockControls = -1              'True
    StartupPosition = 2
    Begin VB.CommandButton cmdOK
        Caption = "&Done"
        Left   = 1740
        Top    = 3150
        Width  = 1185
        Height = 405
        TabIndex = 1
        Default = -1              'True
    End
    Begin VB.Frame fraConnectType
        Caption = "Select Our Internet Connection Type:"
        Left   = 240
        Top    = 1110
        Width  = 4155
        Height = 1815
        TabIndex = 0
        Begin VB.OptionButton optLAN
            Caption = "Always connected to the Internet (LAN, T1, ISDN, Cable Modem, etc.)"
            Left   = 330
            Top    = 1170
            Width  = 3585
            Height = 525
            TabIndex = 4
        End
        Begin VB.OptionButton optAOL
            Caption = "Using America Online (AOL)"
            Left   = 330
            Top    = 810
            Width  = 3645
            Height = 285
            TabIndex = 3
        End
        Begin VB.OptionButton optModem
            Caption = "Using a dial-up modem"
            Left   = 330
            Top    = 390
            Width  = 3345
            Height = 225
            TabIndex = 2
            Value = 255
        End
    End
    Begin VB.Label lblDesc
        Caption = "In order for me to best help you in our Internet travels together, I need to know how we connect to the Internet.  Select the option below which describes how we connect to the Internet.  "
        Left   = 240
        Top    = 150
        Width  = 4215
        Height = 825
        TabIndex = 5
    End
End
