VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "C:\Windows\system32\MSCOMCTL.OCX"

Begin VB.Form frmSingSong
    Caption = "Sing Bonzi, Sing!"
    BackColor = 16777215
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 1
    Icon = frmSingSong.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    Visible = 0              'False
    ClientLeft   = 825
    ClientTop    = 960
    ClientWidth  = 7710
    ClientHeight = 6000
    StartupPosition = 2
    Begin VB.Timer tmrButternutAnimation
        Interval = 1000
        Left = 0
        Top = 0
    End
    Begin VB.PictureBox Picture4
        BackColor = -2147483643
        Picture = frmSingSong.frx:08DE
        ForeColor = 16777215
        Left   = 0
        Top    = 0
        Width  = 9630
        Height = 1155
        TabIndex = 7
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        FillColor = 16777215
        BorderStyle = 0
        Appearance = 0
        Begin Threed.SSCommand cmdAddons
            Left   = 4080
            Top    = -30
            Width  = 3660
            Height = 585
            TabIndex = 8
            OleObjectBlob = frmSingSong.frx:6323
        End
    End
    Begin VB.CommandButton cmdStopSinging
        Caption = "&Stop Singing"
        BackColor = 12632256
        Left   = 6360
        Top    = 4920
        Width  = 1215
        Height = 1005
        TabIndex = 6
        Picture = frmSingSong.frx:6323
        Style = 1
    End
    Begin VB.CommandButton cmdSing
        Caption = "&Sing"
        BackColor = 12632256
        Left   = 4920
        Top    = 4920
        Width  = 1215
        Height = 1005
        TabIndex = 5
        Picture = frmSingSong.frx:750D
        Style = 1
    End
    Begin VB.CommandButton cmdMusicLicense
        Caption = "License Info"
        Left   = 120
        Top    = 4830
        Width  = 1215
        Height = 375
        Visible = 0              'False
        TabIndex = 2
    End
    Begin VB.CheckBox chkSingStartStop
        Caption = "&Sing"
        BackColor = 12632256
        Left   = 4920
        Top    = 4920
        Width  = 1215
        Height = 1005
        Visible = 0              'False
        TabIndex = 1
        Picture = frmSingSong.frx:9507
        Style = 1
    End
    Begin VB.Frame fraSongs
        Caption = "BonziBUDDY Playlist..."
        BackColor = 16777215
        Left   = 120
        Top    = 1470
        Width  = 7455
        Height = 3375
        TabIndex = 3
        Begin MSComctlLib.ListView lviewSongs
            Left   = 180
            Top    = 270
            Width  = 7095
            Height = 2925
            TabIndex = 0
            OleObjectBlob = frmSingSong.frx:B501
        End
    End
    Begin VB.Label lblInstructions
        Caption = "Simply double click on a song or click on a song title and then click the Sing button."
        BackColor = 16777215
        ForeColor = 32768
        Left   = 600
        Top    = 1170
        Width  = 6735
        Height = 195
        TabIndex = 4
        AutoSize = -1              'True
        WordWrap = -1              'True
    End
End
