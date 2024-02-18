VERSION 5.00

Begin VB.Form frmNetBOOST
    Caption = "InternetBOOST '99 - Optimized for Dial Up Connection (MODEM)"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 1
    Icon = frmNetBOOST.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 45
    ClientTop    = 330
    ClientWidth  = 6540
    ClientHeight = 5295
    LockControls = -1              'True
    WhatsThisButton = 255
    WhatsThisHelp = 255
    StartupPosition = 2
    Begin RegistryControl.RegiCon RegiCon1
        OleObjectBlob = frmNetBOOST.frx:0456
        Left = 330
        Top = 5310
    End
    Begin VB.CommandButton btnAbout
        Left   = 4320
        Top    = 4560
        Width  = 1965
        Height = 435
        TabIndex = 25
        HelpContextID = 54
        WhatsThisHelpID = 54
        Picture = frmNetBOOST.frx:0456
        ToolTipText = "More on NetBOOST 98'"
        Style = 1
    End
    Begin VB.CommandButton btnApply
        Caption = "&Apply Boost"
        Left   = 240
        Top    = 4560
        Width  = 1935
        Height = 435
        TabIndex = 24
        HelpContextID = 14
        WhatsThisHelpID = 14
        ToolTipText = "Applies NetBOOST Settings."
        Style = 1
    End
    Begin VB.CommandButton btnCancel
        Caption = "&Close"
        Left   = 2280
        Top    = 4560
        Width  = 1935
        Height = 435
        TabIndex = 23
        HelpContextID = 28
        WhatsThisHelpID = 28
        ToolTipText = "Cancels NetBOOST 98' without saving changes."
        Style = 1
    End
    Begin VB.Frame Frame5
        Caption = "Select the type of Internet Connection you are currently using:"
        ForeColor = 0
        Left   = 240
        Top    = 180
        Width  = 6045
        Height = 975
        TabIndex = 14
        HelpContextID = 9
        WhatsThisHelpID = 9
        Begin VB.OptionButton optLAN
            Caption = "Local Area Network (LAN)"
            ForeColor = 0
            Left   = 3450
            Top    = 420
            Width  = 2295
            Height = 195
            TabIndex = 21
            HelpContextID = 9
            WhatsThisHelpID = 9
            ToolTipText = "Show what your current Internet Connection is optimized for:"
        End
        Begin VB.OptionButton optDialUP
            Caption = "Dial-Up (MODEM)"
            ForeColor = 0
            Left   = 870
            Top    = 420
            Width  = 1965
            Height = 195
            TabIndex = 20
            HelpContextID = 9
            WhatsThisHelpID = 9
            ToolTipText = "Show what your current Internet Connection is optimized for:"
        End
        Begin VB.Image Image2
            Picture = frmNetBOOST.frx:102E
            Left   = 300
            Top    = 300
            Width  = 480
            Height = 480
        End
        Begin VB.Image Image1
            Picture = frmNetBOOST.frx:11A1
            Left   = 2910
            Top    = 300
            Width  = 480
            Height = 480
        End
        Begin VB.Label Label1
            Left   = 2820
            Top    = 360
            Width  = 1395
            Height = 375
            TabIndex = 15
        End
    End
    Begin VB.Frame FramePMTU
        Caption = "Path Maximum Transfer Unit (PMTU)"
        Left   = 240
        Top    = 3000
        Width  = 6045
        Height = 675
        TabIndex = 3
        HelpContextID = 12
        WhatsThisHelpID = 12
        Begin VB.CheckBox chkBlackHole
            Caption = "Black Hole Detection"
            Left   = 3360
            Top    = 300
            Width  = 2055
            Height = 255
            TabIndex = 9
            HelpContextID = 12
            ToolTipText = "Black Hole Detection is recommended to be turned off."
        End
        Begin VB.CheckBox chkAutoDetection
            Caption = "Auto Detection"
            Left   = 600
            Top    = 300
            Width  = 2055
            Height = 255
            TabIndex = 8
            HelpContextID = 12
            ToolTipText = "Auto detect maximum MTU. Recommened to be turned on."
        End
    End
    Begin VB.Frame FrameTTL
        Caption = "Time to Live (TTL)"
        Left   = 240
        Top    = 3780
        Width  = 6045
        Height = 675
        TabIndex = 2
        HelpContextID = 13
        WhatsThisHelpID = 13
        Begin VB.OptionButton optTTL3
            Caption = "Custom"
            Left   = 3420
            Top    = 300
            Width  = 855
            Height = 195
            TabIndex = 19
            HelpContextID = 13
            WhatsThisHelpID = 13
            ToolTipText = "Allows you to customize the TTL to a specific value."
        End
        Begin VB.OptionButton optTTL1
            Caption = "Default (32)"
            Left   = 300
            Top    = 300
            Width  = 1275
            Height = 195
            TabIndex = 18
            HelpContextID = 13
            WhatsThisHelpID = 13
            ToolTipText = "Time to Live (TTL) is maximum # of hops a packet can take before being re-transmitted. Windows 95 default is 32. "
        End
        Begin VB.OptionButton optTTL2
            Caption = "Recommended (64)"
            Left   = 1620
            Top    = 300
            Width  = 1755
            Height = 195
            TabIndex = 17
            HelpContextID = 13
            WhatsThisHelpID = 13
            ToolTipText = "Time to Live (TTL) is maximum # of hops a packet can take before being re-transmitted. Recommended is 64."
        End
        Begin VB.TextBox txtTTL
            Left   = 4320
            Top    = 240
            Width  = 1215
            Height = 285
            Enabled = 0              'False
            Text = "64"
            TabIndex = 16
            HelpContextID = 13
            WhatsThisHelpID = 13
        End
    End
    Begin VB.Frame FrameRWIN
        Caption = "Receive Window (RWIN)"
        Left   = 3330
        Top    = 1260
        Width  = 2955
        Height = 1575
        TabIndex = 1
        HelpContextID = 11
        WhatsThisHelpID = 11
        Begin VB.ComboBox cboRWIN
            Style = 2
            Left   = 1080
            Top    = 600
            Width  = 1215
            Height = 315
            Text = ""
            TabIndex = 22
            WhatsThisHelpID = 11
        End
        Begin VB.TextBox txtRWIN
            Left   = 1080
            Top    = 1020
            Width  = 1215
            Height = 285
            Enabled = 0              'False
            Text = "2144"
            TabIndex = 13
            WhatsThisHelpID = 11
        End
        Begin VB.OptionButton optRWIN2
            Caption = "Multiple"
            Left   = 180
            Top    = 660
            Width  = 2295
            Height = 195
            TabIndex = 12
            WhatsThisHelpID = 11
            ToolTipText = "Automatically configures the RWIN based on multiples. Recommended is '4x'"
        End
        Begin VB.OptionButton optRWIN1
            Caption = "Default (8192)"
            Left   = 180
            Top    = 300
            Width  = 1815
            Height = 195
            TabIndex = 11
            WhatsThisHelpID = 11
            ToolTipText = "Default (8192) is the Windows 95 default setting for RWIN."
        End
        Begin VB.OptionButton optRWIN3
            Caption = "Custom"
            Left   = 180
            Top    = 1080
            Width  = 855
            Height = 195
            TabIndex = 10
            WhatsThisHelpID = 11
            ToolTipText = "Allows you to customize the RWIN to a specific value."
        End
    End
    Begin VB.Frame FrameMTU
        Caption = "Maximum Transfer Unit (MTU=1500)"
        Left   = 240
        Top    = 1260
        Width  = 2955
        Height = 1575
        TabIndex = 0
        HelpContextID = 10
        WhatsThisHelpID = 10
        Begin VB.TextBox txtMTU
            Left   = 1140
            Top    = 1020
            Width  = 1275
            Height = 285
            Enabled = 0              'False
            Text = "1500"
            TabIndex = 7
            HelpContextID = 10
            WhatsThisHelpID = 10
        End
        Begin VB.OptionButton optMTU3
            Caption = "Custom"
            Left   = 240
            Top    = 1080
            Width  = 855
            Height = 195
            TabIndex = 6
            HelpContextID = 10
            WhatsThisHelpID = 10
            ToolTipText = "Allows you to customize the MTU to a specific value."
        End
        Begin VB.OptionButton optMTU1
            Caption = "Dial-Up (576)"
            Left   = 240
            Top    = 360
            Width  = 1815
            Height = 195
            TabIndex = 5
            HelpContextID = 10
            WhatsThisHelpID = 10
            ToolTipText = "Dial-Up (576) is the recommended setting if you use a Dial-Up (MODEM) to connect to the Internet."
        End
        Begin VB.OptionButton optMTU2
            Caption = "Local Area Network (1500)"
            Left   = 240
            Top    = 720
            Width  = 2295
            Height = 195
            TabIndex = 4
            HelpContextID = 10
            WhatsThisHelpID = 10
            ToolTipText = "Local Area Network (1500) is the recommended setting if you use a LAN to connect to the Internet."
        End
    End
    Begin VB.Label Label2
        Caption = "© Copyright 1999, BONZI.COM Software. All Rights Reserved."
        Left   = 1845
        Top    = 5070
        Width  = 4440
        Height = 195
        TabIndex = 26
        Alignment = 1
        AutoSize = -1              'True
    End
End
