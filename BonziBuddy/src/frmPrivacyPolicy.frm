VERSION 5.00

Begin VB.Form frmPrivacyPolicy
    Caption = "BONZI.COM Privacy Policy"
    BackColor = 16777215
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    Icon = frmPrivacyPolicy.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    Visible = 0              'False
    ClientLeft   = 2760
    ClientTop    = 3750
    ClientWidth  = 7350
    ClientHeight = 5100
    LockControls = -1              'True
    ShowInTaskbar = 0              'False
    StartupPosition = 2
    Begin VB.Timer tmrShowMe
        Enabled = 0              'False
        Interval = 1
        Left = 6120
        Top = 4560
    End
    Begin VB.TextBox Text1
        Left   = 270
        Top    = 1470
        Width  = 6795
        Height = 2895
        Text = frmPrivacyPolicy.frx:A380C
        TabIndex = 2
        MultiLine = -1              'True
        ScrollBars = 2
    End
    Begin VB.CommandButton OKButton
        Caption = "OK"
        Left   = 2970
        Top    = 4560
        Width  = 1215
        Height = 375
        TabIndex = 1
    End
    Begin VB.PictureBox Picture4
        BackColor = -2147483643
        Picture = frmPrivacyPolicy.frx:0456
        ForeColor = 16777215
        Left   = 0
        Top    = 0
        Width  = 9630
        Height = 1155
        TabIndex = 0
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        FillColor = 16777215
        BorderStyle = 0
        Appearance = 0
    End
End
