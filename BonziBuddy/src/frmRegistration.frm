VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "C:\Windows\system32\MSINET.OCX"

Begin VB.Form frmRegistration
    Caption = "BonziBUDDY© Online Registration"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    Icon = frmRegistration.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 45
    ClientTop    = 330
    ClientWidth  = 7140
    ClientHeight = 6360
    ShowInTaskbar = 0              'False
    StartupPosition = 2
    Begin ActiveTabs.SSActiveTabs SSActiveTabs1
        Left   = 180
        Top    = 750
        Width  = 6795
        Height = 5595
        TabIndex = 0
        OleObjectBlob = frmRegistration.frx:08DE
        Begin VB.CheckBox chkBuggerOff
            Caption = "Do not ask me to register again."
            Left   = 2183
            Top    = 5330
            Width  = 2775
            Height = 195
            Enabled = 0              'False
            Visible = 0              'False
            TabIndex = 16
        End
        Begin ActiveTabs.SSActiveTabPanel SSActiveTabPanel3
            Left   = 0
            Top    = 0
            Width  = 6795
            Height = 5595
            TabIndex = 50
            OleObjectBlob = frmRegistration.frx:08DE
            Begin VB.CommandButton cmdRegister
                Caption = "&Register Me"
                Left   = 3630
                Top    = 4830
                Width  = 1425
                Height = 405
                TabIndex = 73
            End
            Begin Threed.SSFrame SSFrame4
                Left   = 210
                Top    = 270
                Width  = 6345
                Height = 3795
                TabIndex = 51
                OleObjectBlob = frmRegistration.frx:08DE
                Begin Threed.SSCheck sschkAutomotive
                    Left   = 480
                    Top    = 360
                    Width  = 1455
                    Height = 285
                    TabIndex = 18
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkBooks
                    Left   = 480
                    Top    = 645
                    Width  = 1455
                    Height = 285
                    TabIndex = 20
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkChildren
                    Left   = 480
                    Top    = 1215
                    Width  = 1725
                    Height = 285
                    TabIndex = 21
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkHardware
                    Left   = 480
                    Top    = 1500
                    Width  = 2835
                    Height = 285
                    TabIndex = 22
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkSoftware
                    Left   = 480
                    Top    = 1785
                    Width  = 2835
                    Height = 285
                    TabIndex = 23
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkFashion
                    Left   = 480
                    Top    = 2070
                    Width  = 2835
                    Height = 285
                    TabIndex = 24
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkFood
                    Left   = 480
                    Top    = 2355
                    Width  = 2835
                    Height = 285
                    TabIndex = 25
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkGames
                    Left   = 480
                    Top    = 2640
                    Width  = 2835
                    Height = 285
                    TabIndex = 26
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkHealth
                    Left   = 480
                    Top    = 2925
                    Width  = 2835
                    Height = 285
                    TabIndex = 27
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkHome
                    Left   = 480
                    Top    = 3210
                    Width  = 1725
                    Height = 285
                    TabIndex = 28
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkOffice
                    Left   = 3840
                    Top    = 360
                    Width  = 1305
                    Height = 285
                    TabIndex = 29
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkInvestment
                    Left   = 3840
                    Top    = 645
                    Width  = 2085
                    Height = 285
                    TabIndex = 30
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkLottery
                    Left   = 3840
                    Top    = 930
                    Width  = 2145
                    Height = 285
                    TabIndex = 31
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkMusic
                    Left   = 3840
                    Top    = 1500
                    Width  = 2055
                    Height = 285
                    TabIndex = 33
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkPets
                    Left   = 3840
                    Top    = 1785
                    Width  = 2055
                    Height = 285
                    TabIndex = 34
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck sschkVideo
                    Left   = 3840
                    Top    = 2925
                    Width  = 2055
                    Height = 285
                    TabIndex = 38
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck chkNewsHeadlines
                    Left   = 3840
                    Top    = 1215
                    Width  = 1845
                    Height = 285
                    TabIndex = 32
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck chkNewsBusiness
                    Left   = 480
                    Top    = 930
                    Width  = 1575
                    Height = 285
                    TabIndex = 19
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck chkNewsTechnology
                    Left   = 3840
                    Top    = 2355
                    Width  = 1725
                    Height = 285
                    TabIndex = 36
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck chkNewsSports
                    Left   = 3840
                    Top    = 2070
                    Width  = 1305
                    Height = 285
                    TabIndex = 35
                    OleObjectBlob = frmRegistration.frx:08DE
                End
                Begin Threed.SSCheck chkNewsLivingTravel
                    Left   = 3840
                    Top    = 2640
                    Width  = 1725
                    Height = 285
                    TabIndex = 37
                    OleObjectBlob = frmRegistration.frx:08DE
                End
            End
            Begin Threed.SSCheck sschkReceiveEmails
                Left   = 5400
                Top    = 4500
                Width  = 5955
                Height = 645
                Visible = 0              'False
                TabIndex = 39
                OleObjectBlob = frmRegistration.frx:08DE
            End
            Begin VB.Label lblPrivacyPolicy
                Caption = "Privacy Policy"
                Index = 1
                BackColor = 16777215
                ForeColor = 16711680
                Left   = 5610
                Top    = 4980
                Width  = 990
                Height = 195
                TabIndex = 74
                Alignment = 1
                AutoSize = -1              'True
                BackStyle = 0
                BeginProperty Font
                    Name          = "MS Sans Serif"
                    Size          = 8,25
                    Charset       = 0
                    Weight        = 400
                    Underline     = -1              'True
                    Italic        = 0              'False
                    Strikethrough = 0              'False
                EndProperty
            End
            Begin VB.Image imgCheck
                Index = 5
                Picture = frmRegistration.frx:08DE
                Left   = 210
                Top    = 4950
                Width  = 210
                Height = 210
                Stretch = -1              'True
            End
            Begin VB.Label Label13
                Caption = "- Required Field"
                Left   = 420
                Top    = 4980
                Width  = 1110
                Height = 195
                TabIndex = 72
                AutoSize = -1              'True
                BackStyle = 0
            End
        End
        Begin ActiveTabs.SSActiveTabPanel SSActiveTabPanel2
            Left   = 0
            Top    = 0
            Width  = 6795
            Height = 5595
            TabIndex = 49
            OleObjectBlob = frmRegistration.frx:0D34
            Begin VB.CommandButton cmdRegisterLater
                Caption = "Register Later"
                Left   = 2085
                Top    = 4830
                Width  = 1425
                Height = 405
                TabIndex = 14
            End
            Begin VB.CommandButton cmdContinue
                Caption = "&Continue >>"
                Left   = 3630
                Top    = 4830
                Width  = 1425
                Height = 405
                TabIndex = 15
            End
            Begin Threed.SSFrame SSFrame5
                Left   = 210
                Top    = 210
                Width  = 6345
                Height = 3675
                TabIndex = 52
                OleObjectBlob = frmRegistration.frx:0D34
                Begin VB.TextBox txtFirstName
                    Left   = 1425
                    Top    = 360
                    Width  = 1275
                    Height = 285
                    TabIndex = 1
                    Tag = "Required"
                    MaxLength = 30
                End
                Begin VB.TextBox txtLastName
                    Left   = 4695
                    Top    = 360
                    Width  = 1485
                    Height = 285
                    TabIndex = 3
                    MaxLength = 30
                End
                Begin VB.TextBox txtMiddleName
                    Left   = 3375
                    Top    = 360
                    Width  = 285
                    Height = 285
                    TabIndex = 2
                    MaxLength = 2
                End
                Begin VB.TextBox txtCity
                    Left   = 1425
                    Top    = 1530
                    Width  = 2235
                    Height = 285
                    TabIndex = 6
                    MaxLength = 50
                End
                Begin VB.TextBox txtZip
                    Left   = 1425
                    Top    = 2340
                    Width  = 1125
                    Height = 285
                    TabIndex = 8
                    Tag = "Required"
                    MaxLength = 15
                End
                Begin VB.ComboBox cboState
                    Style = 2
                    Left   = 1425
                    Top    = 1920
                    Width  = 2265
                    Height = 315
                    Text = ""
                    TabIndex = 7
                End
                Begin VB.TextBox txtEmail
                    Left   = 1425
                    Top    = 3180
                    Width  = 2235
                    Height = 285
                    TabIndex = 10
                    Tag = "Required"
                    MaxLength = 50
                End
                Begin VB.ComboBox cboCountry
                    Style = 2
                    Left   = 1425
                    Top    = 2730
                    Width  = 2235
                    Height = 315
                    Text = ""
                    TabIndex = 9
                    Tag = "Required"
                End
                Begin VB.TextBox txtAdd1
                    Left   = 1425
                    Top    = 750
                    Width  = 4755
                    Height = 285
                    TabIndex = 4
                    MaxLength = 60
                End
                Begin VB.TextBox txtAdd2
                    Left   = 1425
                    Top    = 1140
                    Width  = 4755
                    Height = 285
                    TabIndex = 5
                    MaxLength = 60
                End
                Begin VB.Label Label1
                    Caption = "First Name:"
                    Left   = 555
                    Top    = 390
                    Width  = 795
                    Height = 195
                    TabIndex = 63
                    AutoSize = -1              'True
                    BackStyle = 0
                End
                Begin VB.Label Label2
                    Caption = "Last Name:"
                    Left   = 3825
                    Top    = 390
                    Width  = 810
                    Height = 195
                    TabIndex = 62
                    AutoSize = -1              'True
                    BackStyle = 0
                End
                Begin VB.Label Label3
                    Caption = "Middle:"
                    Left   = 2805
                    Top    = 390
                    Width  = 510
                    Height = 195
                    TabIndex = 61
                    AutoSize = -1              'True
                    BackStyle = 0
                End
                Begin VB.Label Label4
                    Caption = "City:"
                    Left   = 1050
                    Top    = 1560
                    Width  = 300
                    Height = 195
                    TabIndex = 60
                    AutoSize = -1              'True
                    BackStyle = 0
                End
                Begin VB.Label Label5
                    Caption = "State/Province:"
                    Left   = 240
                    Top    = 1950
                    Width  = 1215
                    Height = 195
                    TabIndex = 59
                    AutoSize = -1              'True
                    BackStyle = 0
                End
                Begin VB.Label Label6
                    Caption = "Zip/Postal:"
                    Left   = 600
                    Top    = 2370
                    Width  = 780
                    Height = 195
                    TabIndex = 58
                    AutoSize = -1              'True
                    BackStyle = 0
                End
                Begin VB.Label Label8
                    Caption = "E-Mail:"
                    Left   = 885
                    Top    = 3210
                    Width  = 480
                    Height = 195
                    TabIndex = 57
                    AutoSize = -1              'True
                    BackStyle = 0
                End
                Begin VB.Label Label9
                    Caption = "Country:"
                    Left   = 795
                    Top    = 2760
                    Width  = 585
                    Height = 195
                    TabIndex = 56
                    AutoSize = -1              'True
                    BackStyle = 0
                End
                Begin VB.Label Label11
                    Caption = "Address1:"
                    Left   = 645
                    Top    = 780
                    Width  = 705
                    Height = 195
                    TabIndex = 55
                    AutoSize = -1              'True
                    BackStyle = 0
                End
                Begin VB.Label Label12
                    Caption = "Address2:"
                    Left   = 645
                    Top    = 1170
                    Width  = 705
                    Height = 195
                    TabIndex = 54
                    AutoSize = -1              'True
                    BackStyle = 0
                End
                Begin VB.Image imgCheck
                    Index = 0
                    Picture = frmRegistration.frx:0D34
                    Left   = 315
                    Top    = 390
                    Width  = 210
                    Height = 210
                    Stretch = -1              'True
                End
                Begin VB.Image imgCheck
                    Index = 1
                    Picture = frmRegistration.frx:118A
                    Left   = 345
                    Top    = 2370
                    Width  = 210
                    Height = 210
                    Stretch = -1              'True
                End
                Begin VB.Image imgCheck
                    Index = 2
                    Picture = frmRegistration.frx:15E0
                    Left   = 555
                    Top    = 2760
                    Width  = 210
                    Height = 210
                    Stretch = -1              'True
                End
                Begin VB.Image imgCheck
                    Index = 3
                    Picture = frmRegistration.frx:1A36
                    Left   = 645
                    Top    = 3210
                    Width  = 210
                    Height = 210
                    Stretch = -1              'True
                End
                Begin VB.Label lblUS
                    Caption = "(US and Canada Only)"
                    Left   = 3825
                    Top    = 1950
                    Width  = 1590
                    Height = 195
                    TabIndex = 53
                    AutoSize = -1              'True
                    BackStyle = 0
                End
            End
            Begin Threed.SSFrame SSFrame3
                Left   = 750
                Top    = 3930
                Width  = 2295
                Height = 705
                TabIndex = 64
                OleObjectBlob = frmRegistration.frx:1E8C
                Begin Threed.SSOption optMale
                    Left   = 330
                    Top    = 240
                    Width  = 675
                    Height = 315
                    TabIndex = 11
                    OleObjectBlob = frmRegistration.frx:1E8C
                End
                Begin Threed.SSOption optFemale
                    Left   = 1170
                    Top    = 240
                    Width  = 885
                    Height = 315
                    TabIndex = 12
                    OleObjectBlob = frmRegistration.frx:1E8C
                End
            End
            Begin Threed.SSFrame SSFrame6
                Left   = 3600
                Top    = 3930
                Width  = 2295
                Height = 705
                TabIndex = 65
                OleObjectBlob = frmRegistration.frx:1E8C
                Begin VB.ComboBox cboAge
                    Style = 2
                    Left   = 270
                    Top    = 270
                    Width  = 1665
                    Height = 315
                    Text = ""
                    TabIndex = 13
                End
                Begin Threed.SSOption SSOption2
                    Left   = 330
                    Top    = 240
                    Width  = 825
                    Height = 315
                    TabIndex = 66
                    OleObjectBlob = frmRegistration.frx:1E8C
                End
                Begin Threed.SSOption SSOption3
                    Left   = 1110
                    Top    = 240
                    Width  = 825
                    Height = 315
                    TabIndex = 67
                    OleObjectBlob = frmRegistration.frx:1E8C
                End
            End
            Begin VB.Label lblPrivacyPolicy
                Caption = "Privacy Policy"
                Index = 0
                BackColor = 16777215
                ForeColor = 16711680
                Left   = 5610
                Top    = 4980
                Width  = 990
                Height = 195
                TabIndex = 70
                Alignment = 1
                AutoSize = -1              'True
                BackStyle = 0
                BeginProperty Font
                    Name          = "MS Sans Serif"
                    Size          = 8,25
                    Charset       = 0
                    Weight        = 400
                    Underline     = -1              'True
                    Italic        = 0              'False
                    Strikethrough = 0              'False
                EndProperty
            End
            Begin VB.Label Label10
                Caption = "- Required Field"
                Left   = 420
                Top    = 4980
                Width  = 1110
                Height = 195
                TabIndex = 68
                AutoSize = -1              'True
                BackStyle = 0
            End
            Begin VB.Image imgCheck
                Index = 4
                Picture = frmRegistration.frx:1E8C
                Left   = 210
                Top    = 4950
                Width  = 210
                Height = 210
                Stretch = -1              'True
            End
        End
        Begin ActiveTabs.SSActiveTabPanel SSActiveTabPanel1
            Left   = -99975
            Top    = 630
            Width  = 6195
            Height = 3975
            TabIndex = 17
            OleObjectBlob = frmRegistration.frx:22E2
            Begin Threed.SSFrame SSFrame1
                Left   = 360
                Top    = 2160
                Width  = 5475
                Height = 1425
                TabIndex = 40
                OleObjectBlob = frmRegistration.frx:22E2
                Begin VB.TextBox txtBrowse
                    Left   = 210
                    Top    = 630
                    Width  = 3615
                    Height = 315
                    TabIndex = 41
                End
                Begin Threed.SSPanel SSPanel2
                    Left   = 210
                    Top    = 360
                    Width  = 2655
                    Height = 255
                    TabIndex = 42
                    OleObjectBlob = frmRegistration.frx:22E2
                End
                Begin Threed.SSCommand cmdBrowse
                    Left   = 3810
                    Top    = 150
                    Width  = 1545
                    Height = 1200
                    TabIndex = 43
                    OleObjectBlob = frmRegistration.frx:22E2
                End
            End
            Begin Threed.SSFrame SSFrame2
                Left   = 360
                Top    = 390
                Width  = 5475
                Height = 1425
                TabIndex = 44
                OleObjectBlob = frmRegistration.frx:22E2
                Begin VB.TextBox txtSearch
                    Left   = 210
                    Top    = 660
                    Width  = 3615
                    Height = 315
                    TabIndex = 45
                End
                Begin Threed.SSCommand cmdSearch
                    Left   = 3960
                    Top    = 150
                    Width  = 1140
                    Height = 1230
                    TabIndex = 46
                    OleObjectBlob = frmRegistration.frx:22E2
                End
                Begin Threed.SSPanel SSPanel3
                    Left   = 210
                    Top    = 390
                    Width  = 3030
                    Height = 255
                    TabIndex = 47
                    OleObjectBlob = frmRegistration.frx:22E2
                End
            End
            Begin Threed.SSPanel lblDate
                Left   = 1470
                Top    = 90
                Width  = 4350
                Height = 255
                TabIndex = 48
                OleObjectBlob = frmRegistration.frx:22E2
            End
        End
    End
    Begin InetCtlsObjects.Inet inetReg
        OleObjectBlob = frmRegistration.frx:22E2
        Left = 6300
        Top = 5610
    End
    Begin VB.Image Image1
        Picture = frmRegistration.frx:22E2
        Left   = 480
        Top    = 150
        Width  = 480
        Height = 480
    End
    Begin VB.Label Label7
        Caption = "Please enter your registration information below. This will entitle you to FREE software updates of lil' old me!"
        Left   = 1230
        Top    = 210
        Width  = 5415
        Height = 465
        TabIndex = 71
    End
    Begin VB.Label lblCopyright
        Caption = "© Copyright 1999-2001 - BONZI.COM Software. All Rights Reserved."
        BackColor = 16777215
        ForeColor = 32768
        Left   = 2070
        Top    = 6420
        Width  = 4890
        Height = 225
        TabIndex = 69
        Alignment = 1
        AutoSize = -1              'True
    End
End
