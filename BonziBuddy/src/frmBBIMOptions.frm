VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "C:\Windows\system32\MSINET.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "C:\Windows\system32\MSCOMCTL.OCX"

Begin VB.Form frmBBIMOptions
    Caption = "BonziWORLD Messenger Service Options"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    KeyPreview = -1              'True
    ClientLeft   = 2565
    ClientTop    = 1500
    ClientWidth  = 6105
    ClientHeight = 6270
    ShowInTaskbar = 0              'False
    StartupPosition = 2
    Begin InetCtlsObjects.Inet inetSignUp
        OleObjectBlob = frmBBIMOptions.frx:0000
        Left = 1860
        Top = 5700
    End
    Begin VB.PictureBox picOptions
        Index = 0
        Left   = 200
        Top    = 480
        Width  = 5610
        Height = 5010
        TabIndex = 19
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.Frame fraVoiceOptions
            Caption = "BONZI's Voice Options"
            Left   = 120
            Top    = 1530
            Width  = 5445
            Height = 2055
            TabIndex = 32
            Begin VB.CommandButton cmdTestVoice
                Caption = "&Test..."
                Left   = 4230
                Top    = 990
                Width  = 975
                Height = 825
                TabIndex = 7
                Picture = frmBBIMOptions.frx:0000
                Style = 1
            End
            Begin MSComctlLib.Slider sldrSpeed
                Left   = 240
                Top    = 1500
                Width  = 2925
                Height = 375
                TabIndex = 6
                OleObjectBlob = frmBBIMOptions.frx:0538
            End
            Begin MSComctlLib.Slider sldrPitch
                Left   = 240
                Top    = 810
                Width  = 2925
                Height = 375
                TabIndex = 5
                OleObjectBlob = frmBBIMOptions.frx:0538
            End
            Begin VB.Label lblDescription
                Caption = "Customize the way your friends hear messages from you."
                Left   = 690
                Top    = 300
                Width  = 3975
                Height = 195
                TabIndex = 35
                AutoSize = -1              'True
            End
            Begin VB.Label lblSpeed
                Caption = "Speed"
                Left   = 330
                Top    = 1290
                Width  = 465
                Height = 195
                TabIndex = 34
                AutoSize = -1              'True
            End
            Begin VB.Label lblPitch
                Caption = "Pitch"
                Left   = 330
                Top    = 600
                Width  = 360
                Height = 195
                TabIndex = 33
                AutoSize = -1              'True
            End
        End
        Begin VB.Frame fraOther
            Caption = "Notifications"
            Left   = 120
            Top    = 240
            Width  = 5445
            Height = 1155
            TabIndex = 24
            Begin VB.CheckBox chkEchoMessages
                Caption = "Have BONZI speak and play messages that I send to friends."
                Left   = 330
                Top    = 780
                Width  = 4815
                Height = 195
                TabIndex = 4
            End
            Begin VB.CheckBox chkNotifyStateChg
                Caption = "Have BONZI notify me when friends come online or go offline."
                Left   = 330
                Top    = 540
                Width  = 4755
                Height = 195
                TabIndex = 3
                Value = 1
            End
            Begin VB.CheckBox chkSpeakIt
                Caption = "Have BONZI read messages from friends."
                Left   = 330
                Top    = 300
                Width  = 3255
                Height = 195
                TabIndex = 2
                Value = 1
            End
        End
        Begin VB.Frame fraMyAlias
            Caption = "My Alias"
            Left   = 120
            Top    = 3735
            Width  = 5445
            Height = 1185
            Visible = 0              'False
            TabIndex = 20
            Begin VB.TextBox txtMyAlias
                Left   = 1080
                Top    = 660
                Width  = 3735
                Height = 315
                TabIndex = 1
            End
            Begin VB.Image imgAlias
                Picture = frmBBIMOptions.frx:0538
                Left   = 300
                Top    = 390
                Width  = 480
                Height = 480
            End
            Begin VB.Label lblAlias
                Caption = "Enter the name that you want others to know you as. (no spaces)"
                Left   = 1110
                Top    = 240
                Width  = 3165
                Height = 405
                TabIndex = 23
            End
        End
    End
    Begin VB.PictureBox picOptions
        Index = 1
        Left   = 200
        Top    = 480
        Width  = 5685
        Height = 5130
        TabIndex = 21
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.Frame fraFriends
            Caption = "Add BonziWORLD Users to my Friends List"
            Left   = 120
            Top    = 255
            Width  = 5445
            Height = 3645
            TabIndex = 30
            Begin VB.PictureBox picSearch
                Picture = frmBBIMOptions.frx:08A5
                Left   = 330
                Top    = 1320
                Width  = 1110
                Height = 1200
                TabIndex = 50
                ScaleMode = 1
                AutoRedraw = 0              'False
                FontTransparent = -1              'True
                AutoSize = -1              'True
            End
            Begin VB.ComboBox cmbDomain
                Style = 2
                Left   = 2640
                Top    = 720
                Width  = 2655
                Height = 315
                Text = ""
                TabIndex = 12
            End
            Begin VB.TextBox txtFriendEmail
                Left   = 180
                Top    = 720
                Width  = 2475
                Height = 315
                TabIndex = 11
            End
            Begin VB.CommandButton cmdAddFriend
                Caption = "&Add Friend"
                Left   = 4170
                Top    = 1350
                Width  = 975
                Height = 825
                TabIndex = 13
                Picture = frmBBIMOptions.frx:159D
                Style = 1
            End
            Begin VB.Label lblLogonDesc
                Caption = "*  A user's Logon Name is the part of the user's BonziWOLRD e-mail address before the '@' symbol."
                Left   = 210
                Top    = 2790
                Width  = 2475
                Height = 705
                TabIndex = 49
            End
            Begin VB.Label lblFriendEmail
                Caption = "Enter New Friend's Logon Name:*"
                Left   = 180
                Top    = 510
                Width  = 2400
                Height = 195
                TabIndex = 31
                AutoSize = -1              'True
            End
        End
    End
    Begin VB.PictureBox picOptions
        Index = 2
        Left   = 200
        Top    = 480
        Width  = 5610
        Height = 4950
        TabIndex = 22
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.Frame fraPrivacy
            Caption = "Choose which friends can send you instant messages"
            Left   = 120
            Top    = 255
            Width  = 5445
            Height = 4680
            TabIndex = 25
            Begin VB.CommandButton cmdReverseList
                Caption = "&View List"
                Left   = 4320
                Top    = 4080
                Width  = 945
                Height = 375
                TabIndex = 18
                ToolTipText = "Move selected 'allowed' user to Block List."
            End
            Begin VB.CommandButton cmdAllow
                Caption = "<< &Allow"
                Left   = 3570
                Top    = 3240
                Width  = 945
                Height = 375
                TabIndex = 16
                ToolTipText = "Move selected 'blocked' user to Allow List."
            End
            Begin VB.ListBox lstAllow
                Left   = 120
                Top    = 990
                Width  = 2400
                Height = 2205
                TabIndex = 14
            End
            Begin VB.ListBox lstBlock
                Left   = 2850
                Top    = 990
                Width  = 2400
                Height = 2205
                TabIndex = 17
            End
            Begin VB.CommandButton cmdBlock
                Caption = "&Block >>"
                Left   = 870
                Top    = 3240
                Width  = 945
                Height = 375
                TabIndex = 15
                ToolTipText = "Move selected 'allowed' user to Block List."
            End
            Begin VB.Label lblViewReverseList
                Caption = "View a list of other online users who have added me to their BonziWORLD Friends List."
                Left   = 120
                Top    = 4080
                Width  = 3465
                Height = 435
                TabIndex = 47
            End
            Begin VB.Image Image2
                Picture = frmBBIMOptions.frx:1AC9
                Left   = 3720
                Top    = 240
                Width  = 360
                Height = 360
            End
            Begin VB.Image Image1
                Picture = frmBBIMOptions.frx:1FE6
                Left   = 990
                Top    = 240
                Width  = 360
                Height = 360
            End
            Begin VB.Label lblAccept
                Caption = "Allow List"
                Left   = 150
                Top    = 360
                Width  = 660
                Height = 195
                TabIndex = 29
                AutoSize = -1              'True
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
            Begin VB.Label Label2
                Caption = "Block List"
                Left   = 2850
                Top    = 360
                Width  = 690
                Height = 195
                TabIndex = 28
                AutoSize = -1              'True
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
            Begin VB.Label lblAllow2
                Caption = "These users can send me instant messages:"
                Left   = 120
                Top    = 570
                Width  = 1935
                Height = 405
                TabIndex = 27
            End
            Begin VB.Label Label1
                Caption = "These users cannot send me instant messages:"
                Left   = 2850
                Top    = 570
                Width  = 2115
                Height = 405
                TabIndex = 26
            End
        End
    End
    Begin VB.PictureBox picOptions
        Index = 3
        Left   = 180
        Top    = 480
        Width  = 5685
        Height = 5130
        TabIndex = 36
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.Frame Frame1
            Caption = "Account and Logon Information"
            Left   = 120
            Top    = 255
            Width  = 5445
            Height = 4545
            TabIndex = 51
            Begin VB.TextBox txtPass2
                Left   = 2550
                Top    = 2010
                Width  = 2475
                Height = 315
                TabIndex = 56
                PasswordChar = "*"
                IMEMode = 3
            End
            Begin VB.TextBox txtLastName
                Left   = 2550
                Top    = 750
                Width  = 2475
                Height = 315
                TabIndex = 53
            End
            Begin VB.TextBox txtFirstName
                Left   = 2550
                Top    = 330
                Width  = 2475
                Height = 315
                TabIndex = 52
            End
            Begin VB.CommandButton cmdASPServices
                Caption = "Se&rvices..."
                Left   = 3960
                Top    = 3990
                Width  = 1095
                Height = 375
                TabIndex = 59
            End
            Begin VB.TextBox txtAccountLogon
                Left   = 2550
                Top    = 1170
                Width  = 2475
                Height = 315
                TabIndex = 54
            End
            Begin VB.TextBox txtAccountPassword
                Left   = 2550
                Top    = 1590
                Width  = 2475
                Height = 315
                TabIndex = 55
                PasswordChar = "*"
                IMEMode = 3
            End
            Begin VB.CommandButton cmdSubmit
                Caption = "&Sign Up..."
                Left   = 2220
                Top    = 3420
                Width  = 1095
                Height = 375
                TabIndex = 58
            End
            Begin VB.CheckBox chkRememberPassword
                Caption = "Remember my password when logging in."
                Left   = 360
                Top    = 2670
                Width  = 3315
                Height = 195
                TabIndex = 57
            End
            Begin VB.ComboBox cmbAccountDomain
                Style = 2
                Left   = 2760
                Top    = 4200
                Width  = 2655
                Height = 315
                Visible = 0              'False
                Text = ""
                TabIndex = 68
                TabStop = 0              'False
                Locked = -1              'True
            End
            Begin VB.Label lblReenterPass
                Caption = "Re-enter Password:"
                Left   = 360
                Top    = 2070
                Width  = 1395
                Height = 195
                TabIndex = 67
                AutoSize = -1              'True
            End
            Begin VB.Label lblFirstName
                Caption = "Your First Name:"
                Left   = 360
                Top    = 390
                Width  = 1170
                Height = 195
                TabIndex = 66
                AutoSize = -1              'True
            End
            Begin VB.Label lblLastName
                Caption = "Your Last Name:"
                Left   = 360
                Top    = 810
                Width  = 1185
                Height = 195
                TabIndex = 65
                AutoSize = -1              'True
            End
            Begin VB.Label Label7
                Caption = "Create a Logon Name:"
                Left   = 360
                Top    = 1230
                Width  = 1605
                Height = 195
                TabIndex = 64
                AutoSize = -1              'True
            End
            Begin VB.Label Label6
                Caption = "Create a Password:"
                Left   = 360
                Top    = 1650
                Width  = 1380
                Height = 195
                TabIndex = 63
                AutoSize = -1              'True
            End
            Begin VB.Label Label5
                Caption = "Edit your logon information through BonziWORLD Services"
                Left   = 330
                Top    = 3990
                Width  = 3345
                Height = 435
                TabIndex = 62
            End
            Begin VB.Label Label4
                Caption = "Click the 'Sign Up' button once you've completed filling out this form."
                Left   = 330
                Top    = 3000
                Width  = 4815
                Height = 195
                TabIndex = 61
                AutoSize = -1              'True
            End
            Begin VB.Label Label3
                Caption = "(Passwords are case sensitive.)"
                Left   = 2670
                Top    = 2370
                Width  = 2220
                Height = 195
                TabIndex = 60
                AutoSize = -1              'True
            End
        End
        Begin VB.Frame Frame1bak
            Caption = "Account and Logon Information"
            Left   = 120
            Top    = 255
            Width  = 5445
            Height = 3345
            Enabled = 0              'False
            Visible = 0              'False
            TabIndex = 37
            Begin VB.CheckBox chkRememberPasswordbak
                Caption = "Remember my password when logging in."
                Left   = 180
                Top    = 1800
                Width  = 3315
                Height = 195
                Enabled = 0              'False
                TabIndex = 40
            End
            Begin VB.CommandButton cmdSignUp
                Caption = "&Sign Up..."
                Left   = 3420
                Top    = 2250
                Width  = 1095
                Height = 375
                Enabled = 0              'False
                TabIndex = 41
            End
            Begin VB.TextBox txtAccountPasswordbak
                Left   = 180
                Top    = 1410
                Width  = 2475
                Height = 315
                Enabled = 0              'False
                TabIndex = 39
                PasswordChar = "*"
                IMEMode = 3
            End
            Begin VB.TextBox txtAccountLogonbak
                Left   = 180
                Top    = 720
                Width  = 2475
                Height = 315
                Enabled = 0              'False
                TabIndex = 38
            End
            Begin VB.CommandButton cmdChangeLogon
                Caption = "&Services..."
                Left   = 3420
                Top    = 2790
                Width  = 1095
                Height = 375
                Enabled = 0              'False
                TabIndex = 43
            End
            Begin VB.Label lblAboutPass
                Caption = "(Passwords are case sensitive.)"
                Left   = 2730
                Top    = 1440
                Width  = 2220
                Height = 195
                TabIndex = 48
                AutoSize = -1              'True
            End
            Begin VB.Label lblSignUp
                Caption = "Sign up for BonziWORLD Services"
                Left   = 180
                Top    = 2340
                Width  = 3135
                Height = 375
                TabIndex = 46
            End
            Begin VB.Label lblChanges
                Caption = "Edit your logon information through BonziWORLD Services"
                Left   = 180
                Top    = 2760
                Width  = 3015
                Height = 435
                TabIndex = 45
            End
            Begin VB.Label lblPassword
                Caption = "My BonziWORLD Password:"
                Left   = 180
                Top    = 1200
                Width  = 2040
                Height = 195
                TabIndex = 44
                AutoSize = -1              'True
            End
            Begin VB.Label lblMyLogonName
                Caption = "My BonziWORLD Logon Name:"
                Left   = 180
                Top    = 510
                Width  = 2265
                Height = 195
                TabIndex = 42
                AutoSize = -1              'True
            End
        End
    End
    Begin VB.CommandButton cmdApply
        Caption = "Apply"
        Left   = 4920
        Top    = 5775
        Width  = 1095
        Height = 375
        TabIndex = 10
    End
    Begin VB.CommandButton cmdCancel
        Caption = "Cancel"
        Left   = 3720
        Top    = 5775
        Width  = 1095
        Height = 375
        TabIndex = 9
    End
    Begin VB.CommandButton cmdOK
        Caption = "OK"
        Left   = 2520
        Top    = 5775
        Width  = 1095
        Height = 375
        TabIndex = 8
    End
    Begin MSComctlLib.TabStrip tbsOptions
        Left   = 105
        Top    = 120
        Width  = 5895
        Height = 5565
        TabIndex = 0
        OleObjectBlob = frmBBIMOptions.frx:2525
    End
End
