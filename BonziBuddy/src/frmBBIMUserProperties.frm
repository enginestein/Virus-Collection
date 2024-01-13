VERSION 5.00

Begin VB.Form frmBBIMUserProperties
    Caption = "BonziWORLD™ User Properties"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    Icon = frmBBIMUserProperties.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    Visible = 0              'False
    ClientLeft   = 2760
    ClientTop    = 3750
    ClientWidth  = 4875
    ClientHeight = 2880
    LockControls = -1              'True
    ShowInTaskbar = 0              'False
    StartupPosition = 1
    Begin VB.PictureBox Picture1
        Left   = 90
        Top    = 120
        Width  = 4695
        Height = 2115
        TabIndex = 1
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        Begin VB.Frame fraProperties
            Caption = "About the selected user"
            Left   = 120
            Top    = 60
            Width  = 4425
            Height = 1875
            TabIndex = 2
            Begin VB.Label lbltxtName
                Left   = 1380
                Top    = 420
                Width  = 45
                Height = 195
                TabIndex = 8
                AutoSize = -1              'True
            End
            Begin VB.Label lbltxtEmail
                Left   = 1380
                Top    = 900
                Width  = 45
                Height = 195
                TabIndex = 7
                AutoSize = -1              'True
            End
            Begin VB.Label lbltxtStatus
                Left   = 1380
                Top    = 1380
                Width  = 45
                Height = 195
                TabIndex = 6
                AutoSize = -1              'True
            End
            Begin VB.Label lblName
                Caption = "Name:"
                Left   = 180
                Top    = 420
                Width  = 465
                Height = 195
                TabIndex = 5
                AutoSize = -1              'True
            End
            Begin VB.Label lblEmail
                Caption = "Email Address:"
                Left   = 180
                Top    = 900
                Width  = 1035
                Height = 195
                TabIndex = 4
                AutoSize = -1              'True
            End
            Begin VB.Label lblStatus
                Caption = "Status:"
                Left   = 180
                Top    = 1380
                Width  = 495
                Height = 195
                TabIndex = 3
                AutoSize = -1              'True
            End
        End
    End
    Begin VB.CommandButton cmdClose
        Caption = "&Close"
        Left   = 1860
        Top    = 2400
        Width  = 1215
        Height = 375
        TabIndex = 0
    End
End
