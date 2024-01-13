VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "C:\Windows\system32\MSCOMCTL.OCX"

Begin VB.Form frmMailSetup
    Caption = "Bonzi's E-Mail Reader - Options"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 1
    Icon = frmMailSetup.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 45
    ClientTop    = 330
    ClientWidth  = 5430
    ClientHeight = 5295
    LockControls = -1              'True
    StartupPosition = 2
    Begin VB.Frame fraUserInfo
        Caption = "E-Mail Server Account Information:"
        Left   = 420
        Top    = 660
        Width  = 4635
        Height = 3675
        TabIndex = 14
        Begin VB.TextBox txtServerSMTP
            Left   = 2340
            Top    = 1320
            Width  = 2055
            Height = 315
            TabIndex = 2
        End
        Begin VB.TextBox txtAddress
            Left   = 2340
            Top    = 1740
            Width  = 2055
            Height = 315
            TabIndex = 3
            IMEMode = 3
        End
        Begin VB.CommandButton cmdTest
            Caption = "&Test"
            Left   = 3300
            Top    = 3090
            Width  = 1095
            Height = 375
            TabIndex = 6
        End
        Begin VB.TextBox txtServer
            Left   = 2340
            Top    = 900
            Width  = 2055
            Height = 315
            TabIndex = 1
        End
        Begin VB.TextBox txtPass
            Left   = 2340
            Top    = 2580
            Width  = 2055
            Height = 315
            TabIndex = 5
            PasswordChar = "*"
            IMEMode = 3
        End
        Begin VB.TextBox txtName
            Left   = 2340
            Top    = 2160
            Width  = 2055
            Height = 315
            TabIndex = 4
        End
        Begin VB.Label lblServerSMTP
            Caption = "Outgoing Mail Server (SMTP):"
            Left   = 120
            Top    = 1380
            Width  = 2115
            Height = 195
            TabIndex = 20
            AutoSize = -1              'True
        End
        Begin VB.Label lblAddress
            Caption = "E-mail Address:"
            Left   = 1155
            Top    = 1800
            Width  = 1080
            Height = 195
            TabIndex = 19
            AutoSize = -1              'True
        End
        Begin VB.Image imgMail
            Picture = frmMailSetup.frx:08DE
            Left   = 300
            Top    = 300
            Width  = 480
            Height = 480
        End
        Begin VB.Label lblServer
            Caption = "Incoming Mail Server (POP3):"
            Left   = 150
            Top    = 960
            Width  = 2085
            Height = 195
            TabIndex = 18
            AutoSize = -1              'True
        End
        Begin VB.Label lblPass
            Caption = "Password:"
            Left   = 1500
            Top    = 2640
            Width  = 735
            Height = 195
            TabIndex = 17
            AutoSize = -1              'True
        End
        Begin VB.Label lblName
            Caption = "Account Name:"
            Left   = 1125
            Top    = 2220
            Width  = 1110
            Height = 195
            TabIndex = 16
            AutoSize = -1              'True
        End
        Begin VB.Label lblDescAcct
            Caption = "Please enter your E-Mail Server account information below."
            Left   = 960
            Top    = 360
            Width  = 3135
            Height = 435
            TabIndex = 15
        End
    End
    Begin VB.Frame fraInterval
        Caption = "Check/Read E-Mail Time Interval:"
        Left   = 420
        Top    = 660
        Width  = 4635
        Height = 3675
        TabIndex = 0
        Begin VB.TextBox txtCheckInterval
            Left   = 2310
            Top    = 2310
            Width  = 555
            Height = 285
            TabIndex = 9
            MaxLength = 5
        End
        Begin VB.Image imgInterval
            Picture = frmMailSetup.frx:0D34
            Left   = 390
            Top    = 720
            Width  = 480
            Height = 480
        End
        Begin VB.Label lblInterval2
            Caption = "minute(s)."
            Left   = 2910
            Top    = 2370
            Width  = 675
            Height = 195
            TabIndex = 13
            AutoSize = -1              'True
        End
        Begin VB.Label lblInterval1
            Caption = "Check for new mail every"
            Left   = 450
            Top    = 2370
            Width  = 1785
            Height = 195
            TabIndex = 11
            AutoSize = -1              'True
        End
        Begin VB.Label lblDesc
            Caption = "I can automatically check and read new e-mail messages for you. From here, you can adjust how often you would like me to check and read you new mail messages."
            Left   = 1050
            Top    = 720
            Width  = 3225
            Height = 1095
            TabIndex = 10
        End
    End
    Begin VB.CommandButton cmdSave
        Caption = "&Save"
        Left   = 3000
        Top    = 4800
        Width  = 1095
        Height = 375
        TabIndex = 7
        Default = -1              'True
    End
    Begin VB.CommandButton cmdCancel
        Caption = "&Cancel"
        Left   = 4200
        Top    = 4800
        Width  = 1095
        Height = 375
        TabIndex = 8
        Cancel = -1              'True
    End
    Begin MSComctlLib.TabStrip tabMailOptions
        Left   = 180
        Top    = 180
        Width  = 5115
        Height = 4395
        TabIndex = 12
        OleObjectBlob = frmMailSetup.frx:1052
    End
End
