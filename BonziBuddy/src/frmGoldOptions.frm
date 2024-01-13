VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "C:\Windows\system32\MSCOMCTL.OCX"

Begin VB.Form frmGoldOptions
    Caption = "BonziBUDDY Gold Member Access!"
    BackColor = 16777215
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    Visible = 0              'False
    KeyPreview = -1              'True
    ClientLeft   = 105
    ClientTop    = 375
    ClientWidth  = 6330
    ClientHeight = 7095
    ShowInTaskbar = 0              'False
    StartupPosition = 2
    Begin VB.PictureBox picOptions
        Index = 1
        Left   = 240
        Top    = 1260
        Width  = 5835
        Height = 5190
        TabIndex = 19
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.Frame fraAccount
            Caption = "Gold Member Account and Logon Information"
            Left   = 180
            Top    = 240
            Width  = 5445
            Height = 4695
            TabIndex = 21
            Begin VB.CommandButton cmdGoldSite
                Caption = "&Gold Member's Site"
                Left   = 3420
                Top    = 3720
                Width  = 1815
                Height = 375
                TabIndex = 7
            End
            Begin VB.CommandButton cmdChangePassword
                Caption = "Change &Password"
                Left   = 3420
                Top    = 4200
                Width  = 1815
                Height = 375
                TabIndex = 8
            End
            Begin VB.TextBox txtUserName
                ForeColor = 32768
                Left   = 2550
                Top    = 450
                Width  = 2475
                Height = 315
                TabIndex = 5
            End
            Begin VB.CheckBox chkRememberPassword
                Caption = "Remember my password when logging in."
                Left   = 360
                Top    = 1710
                Width  = 3315
                Height = 195
                TabIndex = 6
                Value = 1
            End
            Begin VB.Label txtPassword
                Left   = 2550
                Top    = 870
                Width  = 2475
                Height = 315
                TabIndex = 26
                BorderStyle = 1
            End
            Begin VB.Label Label7
                Caption = "Email Address:"
                Left   = 360
                Top    = 510
                Width  = 1035
                Height = 195
                TabIndex = 23
                AutoSize = -1              'True
            End
            Begin VB.Label Label6
                Caption = "Password:"
                Left   = 360
                Top    = 930
                Width  = 735
                Height = 195
                TabIndex = 22
                AutoSize = -1              'True
            End
        End
    End
    Begin VB.PictureBox picOptions
        Index = 0
        Left   = 240
        Top    = 1260
        Width  = 5835
        Height = 5190
        TabIndex = 13
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.Frame fraAddons
            Caption = "Choose the add-ons you would like to download and install"
            Left   = 180
            Top    = 240
            Width  = 5445
            Height = 4695
            TabIndex = 14
            Begin VB.CommandButton cmdAddonsInstall
                Caption = "&Install Now"
                Left   = 4140
                Top    = 4170
                Width  = 1095
                Height = 375
                TabIndex = 4
            End
            Begin VB.CommandButton cmdAddonsRemove
                Caption = "<<&Remove"
                Left   = 3540
                Top    = 2610
                Width  = 1095
                Height = 375
                TabIndex = 3
            End
            Begin VB.ListBox lstAddonsAvail
                ForeColor = 32768
                Left   = 120
                Top    = 1080
                Width  = 2460
                Height = 1425
                TabIndex = 0
                Sorted = -1              'True
            End
            Begin VB.ListBox lstAddonsSelected
                ForeColor = 32768
                Left   = 2850
                Top    = 1080
                Width  = 2460
                Height = 1425
                TabIndex = 1
                Sorted = -1              'True
            End
            Begin VB.CommandButton cmdAddonsAdd
                Caption = "&Add >>"
                Left   = 840
                Top    = 2610
                Width  = 1095
                Height = 375
                TabIndex = 2
            End
            Begin VB.Label lblDownloadTime
                Caption = "lblDownloadTime"
                Left   = 240
                Top    = 3765
                Width  = 4965
                Height = 285
                TabIndex = 25
                BorderStyle = 1
            End
            Begin VB.Label lblAddonDescription
                Caption = "lblAddonDescription"
                Left   = 240
                Top    = 3120
                Width  = 4965
                Height = 645
                TabIndex = 24
                BorderStyle = 1
            End
            Begin VB.Image Image1
                Picture = frmGoldOptions.frx:0000
                Left   = 120
                Top    = 4140
                Width  = 360
                Height = 360
            End
            Begin VB.Label lblInfo
                Caption = "When you're done choosing add-ons to install, click Install Now, to begin installing."
                Left   = 540
                Top    = 4140
                Width  = 3465
                Height = 435
                TabIndex = 20
            End
            Begin VB.Label lblAvail
                Caption = "Available Add-ons"
                Left   = 150
                Top    = 390
                Width  = 1275
                Height = 195
                TabIndex = 18
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
            Begin VB.Label lblSelected
                Caption = "Selected for Installation"
                Left   = 2850
                Top    = 390
                Width  = 1650
                Height = 195
                TabIndex = 17
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
                Caption = "These items are add-ons available for installation."
                Left   = 150
                Top    = 660
                Width  = 2445
                Height = 405
                TabIndex = 16
            End
            Begin VB.Label Label1
                Caption = "These items will be installed when you click 'Install Now'."
                Left   = 2850
                Top    = 660
                Width  = 2115
                Height = 405
                TabIndex = 15
            End
        End
    End
    Begin VB.CommandButton cmdApply
        Caption = "&Apply"
        Left   = 5010
        Top    = 6615
        Width  = 1095
        Height = 375
        TabIndex = 11
    End
    Begin VB.CommandButton cmdCancel
        Caption = "&Cancel"
        Left   = 3780
        Top    = 6615
        Width  = 1095
        Height = 375
        TabIndex = 10
        Cancel = -1              'True
    End
    Begin VB.CommandButton cmdOK
        Caption = "&OK"
        Left   = 2550
        Top    = 6615
        Width  = 1095
        Height = 375
        TabIndex = 9
        Default = -1              'True
    End
    Begin MSComctlLib.TabStrip tbsOptions
        Left   = 210
        Top    = 930
        Width  = 5895
        Height = 5565
        TabIndex = 12
        OleObjectBlob = frmGoldOptions.frx:053F
    End
    Begin VB.Image Image2
        Picture = frmGoldOptions.frx:053F
        Left   = 0
        Top    = 0
        Width  = 6495
        Height = 750
    End
End
