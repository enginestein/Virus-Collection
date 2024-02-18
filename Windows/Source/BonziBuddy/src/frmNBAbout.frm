VERSION 5.00

Begin VB.Form frmNBAbout
    Caption = "About MyApp"
    ScaleLeft   = 0
    ScaleTop    = 0
    ScaleWidth  = 0
    ScaleHeight = 0
    ScaleMode   = 0
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    Icon = frmNBAbout.frx:0000
    LinkTopic = "Form2"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClipControls = 0              'False
    ClientLeft   = 2340
    ClientTop    = 1935
    ClientWidth  = 5730
    ClientHeight = 4725
    LockControls = -1              'True
    ShowInTaskbar = 0              'False
    StartupPosition = 2
    Begin VB.Frame Frame1
        Caption = "Licensed to:"
        Left   = 300
        Top    = 3540
        Width  = 3735
        Height = 795
        TabIndex = 6
        Begin VB.Label Label1
            Caption = "Registration Number: 5324698"
            Left   = 120
            Top    = 480
            Width  = 3435
            Height = 195
            TabIndex = 8
            Alignment = 2
        End
        Begin VB.Label lblRegName
            Caption = "RegName"
            Left   = 120
            Top    = 240
            Width  = 3435
            Height = 195
            TabIndex = 7
            Alignment = 2
        End
    End
    Begin VB.CommandButton cmdOK
        Caption = "OK"
        Left   = 4245
        Top    = 3585
        Width  = 1260
        Height = 345
        TabIndex = 0
        Default = -1              'True
        Cancel = -1              'True
    End
    Begin VB.CommandButton cmdSysInfo
        Caption = "&System Info..."
        Left   = 4260
        Top    = 4035
        Width  = 1245
        Height = 345
        TabIndex = 1
    End
    Begin VB.Label lblBuild
        Caption = "Build 3"
        Left   = 3660
        Top    = 1620
        Width  = 1275
        Height = 225
        TabIndex = 9
    End
    Begin VB.Image Image1
        Picture = frmNBAbout.frx:0456
        Left   = 135
        Top    = 60
        Width  = 5475
        Height = 975
    End
    Begin VB.Line Line1
        Index = 1
        BorderColor = 8421504
        X1 = 90
        Y1 = 3405
        X2 = 5654
        Y2 = 3405
        BorderStyle = 6
    End
    Begin VB.Label lblDescription
        Caption = "App Description"
        ForeColor = 0
        Left   = 1050
        Top    = 2085
        Width  = 3885
        Height = 1170
        TabIndex = 2
    End
    Begin VB.Label lblTitle
        Caption = "Application Title"
        ForeColor = 0
        Left   = 1050
        Top    = 1200
        Width  = 3885
        Height = 240
        TabIndex = 4
    End
    Begin VB.Line Line1
        Index = 0
        BorderColor = 16777215
        X1 = 105
        Y1 = 3420
        X2 = 5654
        Y2 = 3420
        BorderWidth = 2
    End
    Begin VB.Label lblVersion
        Caption = "Version"
        Left   = 1050
        Top    = 1620
        Width  = 2505
        Height = 225
        TabIndex = 5
    End
    Begin VB.Label lblDisclaimer
        Caption = "Copyright 1999, BONZI.COM Software. All rights reserved."
        ForeColor = 0
        Left   = 1395
        Top    = 4470
        Width  = 4110
        Height = 195
        TabIndex = 3
        Alignment = 1
        AutoSize = -1              'True
    End
End
