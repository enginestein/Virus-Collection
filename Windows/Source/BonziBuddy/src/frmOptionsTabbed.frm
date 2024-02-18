VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "C:\Windows\system32\MSCOMCTL.OCX"

Begin VB.Form frmOptionsTabbed
    Caption = "Bonzi's Options and Settings"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    Visible = 0              'False
    KeyPreview = -1              'True
    ClientLeft   = 2565
    ClientTop    = 1500
    ClientWidth  = 5895
    ClientHeight = 5535
    ShowInTaskbar = 0              'False
    StartupPosition = 2
    Begin VB.PictureBox picOptions
        Index = 2
        Left   = 240
        Top    = 960
        Width  = 5325
        Height = 3780
        TabIndex = 77
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.CommandButton cmdPersonalityDefaults
            Caption = "Use Defaults"
            Left   = 3960
            Top    = 3360
            Width  = 1335
            Height = 375
            TabIndex = 8
        End
        Begin VB.Frame Frame3
            Caption = "Control How Much You Would Like Me to Interact With You!"
            Left   = 120
            Top    = 0
            Width  = 5175
            Height = 3255
            TabIndex = 78
            Begin VB.Frame Frame5
                Caption = "Master (Controls How Often I Talk)"
                Left   = 120
                Top    = 240
                Width  = 4935
                Height = 675
                TabIndex = 87
                Begin MSComctlLib.Slider sldrInteraction
                    Left   = 600
                    Top    = 240
                    Width  = 3855
                    Height = 345
                    TabIndex = 91
                    OleObjectBlob = frmOptionsTabbed.frx:0000
                    ToolTipText = "Adjust How Often You Would Like Me Talk To You."
                End
                Begin VB.Label Label23
                    Caption = "Less"
                    Left   = 240
                    Top    = 270
                    Width  = 330
                    Height = 195
                    TabIndex = 92
                    AutoSize = -1              'True
                End
                Begin VB.Label Label25
                    Caption = "More"
                    Left   = 4455
                    Top    = 270
                    Width  = 360
                    Height = 195
                    TabIndex = 88
                    AutoSize = -1              'True
                End
            End
            Begin VB.Frame Frame4
                Caption = "Personality (Controls What I Talk About)"
                Left   = 120
                Top    = 960
                Width  = 4935
                Height = 2115
                TabIndex = 79
                Begin MSComctlLib.Slider sldrJokes
                    Left   = 600
                    Top    = 555
                    Width  = 3855
                    Height = 345
                    TabIndex = 5
                    OleObjectBlob = frmOptionsTabbed.frx:0000
                    ToolTipText = "Adjust My Personality For More Or Less Jokes."
                End
                Begin MSComctlLib.Slider sldrPersonality
                    Left   = 600
                    Top    = 1635
                    Width  = 3855
                    Height = 345
                    TabIndex = 7
                    OleObjectBlob = frmOptionsTabbed.frx:0000
                    ToolTipText = "Adjust My Personality For More Or Less Friendly Conversation."
                End
                Begin MSComctlLib.Slider sldrFacts
                    Left   = 600
                    Top    = 1095
                    Width  = 3855
                    Height = 345
                    TabIndex = 6
                    OleObjectBlob = frmOptionsTabbed.frx:0000
                    ToolTipText = "Adjust My Personality For More Or Less Facts & Trivia."
                End
                Begin VB.Label Label7
                    Caption = "Less"
                    Left   = 240
                    Top    = 1125
                    Width  = 330
                    Height = 195
                    TabIndex = 90
                    AutoSize = -1              'True
                End
                Begin VB.Label Label11
                    Caption = "More"
                    Left   = 4455
                    Top    = 1125
                    Width  = 360
                    Height = 195
                    TabIndex = 89
                    AutoSize = -1              'True
                End
                Begin VB.Label Label3
                    Caption = "Less"
                    Left   = 240
                    Top    = 585
                    Width  = 330
                    Height = 195
                    TabIndex = 86
                    AutoSize = -1              'True
                End
                Begin VB.Label Label1
                    Caption = "More"
                    Left   = 4455
                    Top    = 585
                    Width  = 360
                    Height = 195
                    TabIndex = 85
                    AutoSize = -1              'True
                End
                Begin VB.Label Label12
                    Caption = "Less"
                    Left   = 240
                    Top    = 1710
                    Width  = 330
                    Height = 195
                    TabIndex = 84
                    AutoSize = -1              'True
                End
                Begin VB.Label Label13
                    Caption = "More"
                    Left   = 4455
                    Top    = 1710
                    Width  = 360
                    Height = 195
                    TabIndex = 83
                    AutoSize = -1              'True
                End
                Begin VB.Label Label18
                    Caption = "(Friendly Conversation)"
                    Left   = 1650
                    Top    = 1440
                    Width  = 1620
                    Height = 195
                    TabIndex = 82
                    Alignment = 2
                    AutoSize = -1              'True
                End
                Begin VB.Label Label16
                    Caption = "(Facts && Trivia)"
                    Left   = 1935
                    Top    = 900
                    Width  = 1050
                    Height = 195
                    TabIndex = 81
                    Alignment = 2
                    AutoSize = -1              'True
                End
                Begin VB.Label Label9
                    Caption = "(Jokes && Humor)"
                    Left   = 1875
                    Top    = 360
                    Width  = 1170
                    Height = 195
                    TabIndex = 80
                    Alignment = 2
                    AutoSize = -1              'True
                End
            End
        End
    End
    Begin VB.PictureBox picOptions
        Index = 3
        Left   = 210
        Top    = 960
        Width  = 5415
        Height = 3780
        TabIndex = 49
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.Frame fraUserInfo
            Caption = "E-Mail Server Account Information:"
            Left   = 360
            Top    = 120
            Width  = 4635
            Height = 3555
            TabIndex = 55
            Begin VB.TextBox txtName
                Left   = 2340
                Top    = 2025
                Width  = 2055
                Height = 315
                TabIndex = 11
            End
            Begin VB.TextBox txtPass
                Left   = 2340
                Top    = 2460
                Width  = 2055
                Height = 315
                TabIndex = 12
                PasswordChar = "*"
                IMEMode = 3
            End
            Begin VB.TextBox txtServer
                Left   = 2340
                Top    = 1140
                Width  = 2055
                Height = 315
                TabIndex = 9
            End
            Begin VB.CommandButton cmdTest
                Caption = "&Test"
                Left   = 3300
                Top    = 2910
                Width  = 1095
                Height = 375
                TabIndex = 13
            End
            Begin VB.TextBox txtAddress
                Left   = 2340
                Top    = 1575
                Width  = 2055
                Height = 315
                TabIndex = 10
                IMEMode = 3
            End
            Begin VB.Label lblDescAcct
                Caption = "Please enter your E-Mail Server account information below."
                Left   = 960
                Top    = 360
                Width  = 3135
                Height = 435
                TabIndex = 60
            End
            Begin VB.Label lblName
                Caption = "Account Name:"
                Left   = 1125
                Top    = 2085
                Width  = 1110
                Height = 195
                TabIndex = 59
                AutoSize = -1              'True
            End
            Begin VB.Label lblPass
                Caption = "Password:"
                Left   = 1500
                Top    = 2520
                Width  = 735
                Height = 195
                TabIndex = 58
                AutoSize = -1              'True
            End
            Begin VB.Label lblServer
                Caption = "Incoming Mail Server (POP3):"
                Left   = 150
                Top    = 1200
                Width  = 2085
                Height = 195
                TabIndex = 57
                AutoSize = -1              'True
            End
            Begin VB.Image imgMail
                Picture = frmOptionsTabbed.frx:0000
                Left   = 300
                Top    = 300
                Width  = 480
                Height = 480
            End
            Begin VB.Label lblAddress
                Caption = "E-mail Address:"
                Left   = 1155
                Top    = 1635
                Width  = 1080
                Height = 195
                TabIndex = 56
                AutoSize = -1              'True
            End
        End
    End
    Begin VB.PictureBox picOptions
        Index = 6
        Left   = 240
        Top    = 960
        Width  = 5325
        Height = 3780
        TabIndex = 69
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.PictureBox picIcon
            Picture = frmOptionsTabbed.frx:0456
            Left   = 270
            Top    = 360
            Width  = 540
            Height = 540
            TabIndex = 70
            ScaleLeft   = 0
            ScaleTop    = 0
            ScaleWidth  = 0
            ScaleHeight = 0
            ScaleMode   = 0
            AutoRedraw = 0              'False
            FontTransparent = -1              'True
            AutoSize = -1              'True
            ClipControls = 0              'False
        End
        Begin VB.Line Line1
            Index = 1
            BorderColor = 8421504
            X1 = 120
            Y1 = 2565
            X2 = 5684
            Y2 = 2565
            BorderStyle = 6
        End
        Begin VB.Label lblDescription
            Caption = "App Description"
            ForeColor = 0
            Left   = 1080
            Top    = 1245
            Width  = 3885
            Height = 1170
            TabIndex = 74
        End
        Begin VB.Label lblTitle
            Caption = "Application Title"
            ForeColor = 0
            Left   = 1080
            Top    = 360
            Width  = 3885
            Height = 480
            TabIndex = 73
        End
        Begin VB.Line Line1
            Index = 0
            BorderColor = 16777215
            X1 = 135
            Y1 = 2580
            X2 = 5684
            Y2 = 2580
            BorderWidth = 2
        End
        Begin VB.Label lblVersion
            Caption = "Version"
            Left   = 1080
            Top    = 900
            Width  = 3885
            Height = 225
            TabIndex = 72
        End
        Begin VB.Label lblDisclaimer
            Caption = "Warning: ..."
            ForeColor = 0
            Left   = 285
            Top    = 2760
            Width  = 4830
            Height = 825
            TabIndex = 71
        End
    End
    Begin VB.PictureBox picOptions
        Index = 5
        Left   = 240
        Top    = 960
        Width  = 5325
        Height = 3780
        TabIndex = 65
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.Frame Frame1
            Caption = "Sleep Mode Options"
            Left   = 360
            Top    = 120
            Width  = 4635
            Height = 3555
            TabIndex = 66
            Begin VB.ComboBox cboRelaxHotKey
                Style = 2
                Left   = 2895
                Top    = 3030
                Width  = 735
                Height = 315
                Text = ""
                TabIndex = 20
            End
            Begin VB.CheckBox chkRelaxUseHotKey
                Caption = "Enable Quiet Mode Hot Key"
                Left   = 480
                Top    = 3000
                Width  = 2415
                Height = 375
                TabIndex = 19
            End
            Begin VB.CheckBox chkRelaxModeOnStartup
                Caption = "Remember Quiet Mode Setting on Startup"
                Left   = 480
                Top    = 2550
                Width  = 3975
                Height = 375
                TabIndex = 18
            End
            Begin VB.OptionButton optRelaxMode
                Caption = "Never fall asleep."
                Index = 1
                Left   = 480
                Top    = 1935
                Width  = 2655
                Height = 255
                TabIndex = 17
            End
            Begin VB.TextBox txtRelaxIdleTime
                Left   = 1965
                Top    = 1545
                Width  = 555
                Height = 285
                Text = "10"
                TabIndex = 16
                Alignment = 1
                MaxLength = 5
            End
            Begin VB.OptionButton optRelaxMode
                Caption = "Fall asleep after"
                Index = 0
                Left   = 480
                Top    = 1560
                Width  = 1635
                Height = 255
                TabIndex = 15
                Value = 255
            End
            Begin VB.Image Image1
                Picture = frmOptionsTabbed.frx:0774
                Left   = 390
                Top    = 480
                Width  = 480
                Height = 480
            End
            Begin VB.Label Label4
                Caption = "minute(s) of inactivity."
                Left   = 2610
                Top    = 1560
                Width  = 1515
                Height = 195
                TabIndex = 68
                AutoSize = -1              'True
            End
            Begin VB.Label Label2
                Caption = "I can take a nap for a while if you are busy.  Just check the options below so I can adjust to the way you use your computer."
                Left   = 1050
                Top    = 480
                Width  = 3225
                Height = 735
                TabIndex = 67
            End
        End
    End
    Begin VB.PictureBox picOptions
        Index = 4
        Left   = 210
        Top    = 960
        Width  = 5325
        Height = 3780
        TabIndex = 50
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.Frame fraInterval
            Caption = "Check/Read E-Mail Time Interval:"
            Left   = 360
            Top    = 120
            Width  = 4635
            Height = 3555
            TabIndex = 61
            Begin VB.TextBox txtCheckInterval
                Left   = 2310
                Top    = 2430
                Width  = 555
                Height = 285
                TabIndex = 14
                MaxLength = 5
            End
            Begin VB.Label lblIntervalDesc
                Caption = "I can automatically check and read new e-mail messages for you. From here, you can adjust how often you would like me to check and read you new mail messages."
                Left   = 1050
                Top    = 720
                Width  = 3225
                Height = 1095
                TabIndex = 64
            End
            Begin VB.Label lblInterval1
                Caption = "Check for new mail every"
                Left   = 450
                Top    = 2490
                Width  = 1785
                Height = 195
                TabIndex = 63
                AutoSize = -1              'True
            End
            Begin VB.Label lblInterval2
                Caption = "minute(s)."
                Left   = 2910
                Top    = 2490
                Width  = 675
                Height = 195
                TabIndex = 62
                AutoSize = -1              'True
            End
            Begin VB.Image imgInterval
                Picture = frmOptionsTabbed.frx:0A92
                Left   = 390
                Top    = 720
                Width  = 480
                Height = 480
            End
        End
    End
    Begin VB.PictureBox picOptions
        Index = 1
        Left   = 210
        Top    = 960
        Width  = 5325
        Height = 3780
        TabIndex = 48
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.Frame fraConnectType
            Caption = "Select Our Internet Connection Type:"
            Left   = 600
            Top    = 1680
            Width  = 4155
            Height = 1815
            TabIndex = 53
            Begin VB.OptionButton optModem
                Caption = "Using a dial-up modem"
                Left   = 330
                Top    = 390
                Width  = 3345
                Height = 225
                TabIndex = 2
                Value = 255
            End
            Begin VB.OptionButton optAOL
                Caption = "Using America Online (AOL)"
                Left   = 330
                Top    = 810
                Width  = 3645
                Height = 285
                TabIndex = 3
            End
            Begin VB.OptionButton optLAN
                Caption = "Always connected to the Internet (LAN, T1, ISDN, Cable Modem, etc.)"
                Left   = 330
                Top    = 1170
                Width  = 3585
                Height = 525
                TabIndex = 4
            End
        End
        Begin VB.Label lblDesc
            Caption = "In order for me to best help you in our Internet travels together, I need to know how we connect to the Internet.  Select the option below which describes how we connect to the Internet.  "
            Left   = 600
            Top    = 480
            Width  = 4215
            Height = 825
            TabIndex = 54
        End
    End
    Begin VB.PictureBox picOptions
        Index = 0
        Left   = 210
        Top    = 960
        Width  = 5325
        Height = 3780
        TabIndex = 47
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.CommandButton cmdRegistration
            Caption = "Registration"
            Left   = 3960
            Top    = 3150
            Width  = 1095
            Height = 375
            TabIndex = 1
            Cancel = -1              'True
        End
        Begin VB.Frame fraQuestion
            Left   = 360
            Top    = 1980
            Width  = 4695
            Height = 1005
            TabIndex = 51
            Begin VB.TextBox txtSalutation
                Left   = 150
                Top    = 390
                Width  = 4395
                Height = 345
                TabIndex = 0
                MultiLine = -1              'True
            End
        End
        Begin VB.Label lblSalutationDescription
            Caption = "lblDescription"
            Left   = 540
            Top    = 720
            Width  = 4365
            Height = 915
            TabIndex = 52
        End
    End
    Begin VB.CommandButton cmdAdvanced
        Caption = "Advanced"
        Left   = 120
        Top    = 5040
        Width  = 1095
        Height = 375
        TabIndex = 21
    End
    Begin VB.CommandButton cmdApply
        Caption = "Apply"
        Left   = 4680
        Top    = 5055
        Width  = 1095
        Height = 375
        TabIndex = 24
    End
    Begin VB.CommandButton cmdCancel
        Caption = "Cancel"
        Left   = 3480
        Top    = 5055
        Width  = 1095
        Height = 375
        TabIndex = 23
    End
    Begin VB.CommandButton cmdOK
        Caption = "OK"
        Left   = 2250
        Top    = 5055
        Width  = 1095
        Height = 375
        TabIndex = 22
        Default = -1              'True
    End
    Begin MSComctlLib.TabStrip tbsOptions
        Left   = 105
        Top    = 120
        Width  = 5655
        Height = 4845
        TabIndex = 25
        OleObjectBlob = frmOptionsTabbed.frx:0DB0
    End
    Begin VB.PictureBox picOptionsNews
        Left   = 240
        Top    = 960
        Width  = 5325
        Height = 3780
        Visible = 0              'False
        TabIndex = 75
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.Frame Frame2
            Caption = "Deliver News Right To Your Desktop!"
            Left   = 120
            Top    = 0
            Width  = 5115
            Height = 3675
            TabIndex = 76
            Begin Threed.SSCheck sschkAutomotive
                Left   = 120
                Top    = 360
                Width  = 1455
                Height = 285
                TabIndex = 26
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkBooks
                Left   = 120
                Top    = 645
                Width  = 1455
                Height = 285
                TabIndex = 27
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkChildren
                Left   = 120
                Top    = 1215
                Width  = 1725
                Height = 285
                TabIndex = 29
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkHardware
                Left   = 120
                Top    = 1500
                Width  = 2835
                Height = 285
                TabIndex = 30
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkSoftware
                Left   = 120
                Top    = 1785
                Width  = 2835
                Height = 285
                TabIndex = 31
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkFashion
                Left   = 120
                Top    = 2070
                Width  = 2835
                Height = 285
                TabIndex = 32
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkFood
                Left   = 120
                Top    = 2355
                Width  = 2835
                Height = 285
                TabIndex = 33
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkGames
                Left   = 120
                Top    = 2640
                Width  = 2835
                Height = 285
                TabIndex = 34
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkHealth
                Left   = 120
                Top    = 2925
                Width  = 2835
                Height = 285
                TabIndex = 35
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkHome
                Left   = 120
                Top    = 3210
                Width  = 1725
                Height = 285
                TabIndex = 36
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkOffice
                Left   = 3000
                Top    = 360
                Width  = 1305
                Height = 285
                TabIndex = 37
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkInvestment
                Left   = 3000
                Top    = 645
                Width  = 2085
                Height = 285
                TabIndex = 38
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkLottery
                Left   = 3000
                Top    = 930
                Width  = 2145
                Height = 285
                TabIndex = 39
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkMusic
                Left   = 3000
                Top    = 1500
                Width  = 2055
                Height = 285
                TabIndex = 41
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkPets
                Left   = 3000
                Top    = 1785
                Width  = 2055
                Height = 285
                TabIndex = 42
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck sschkVideo
                Left   = 3000
                Top    = 2925
                Width  = 2055
                Height = 285
                TabIndex = 46
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck chkNewsHeadlines
                Left   = 3000
                Top    = 1215
                Width  = 1845
                Height = 285
                TabIndex = 40
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck chkNewsBusiness
                Left   = 120
                Top    = 930
                Width  = 1575
                Height = 285
                TabIndex = 28
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck chkNewsTechnology
                Left   = 3000
                Top    = 2355
                Width  = 1725
                Height = 285
                TabIndex = 44
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck chkNewsSports
                Left   = 3000
                Top    = 2070
                Width  = 1305
                Height = 285
                TabIndex = 43
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
            Begin Threed.SSCheck chkNewsLivingTravel
                Left   = 3000
                Top    = 2640
                Width  = 1725
                Height = 285
                TabIndex = 45
                OleObjectBlob = frmOptionsTabbed.frx:0DB0
            End
        End
    End
End
