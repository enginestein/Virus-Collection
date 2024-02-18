VERSION 5.00

Begin VB.Form frmCTBMsgBox
    Caption = "BonziBUDDY Bargain Hunter - Save Money!"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    Icon = frmCTBMsgBox.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    Visible = 0              'False
    ClientLeft   = 2760
    ClientTop    = 3750
    ClientWidth  = 6030
    ClientHeight = 1815
    LockControls = -1              'True
    StartupPosition = 2
    Begin VB.CheckBox chkStopIt
        Caption = "Don't Prompt Me Again"
        Left   = 210
        Top    = 1830
        Width  = 2655
        Height = 225
        Visible = 0              'False
        TabIndex = 3
    End
    Begin VB.CommandButton cmdYes
        Caption = "&Yes"
        Left   = 4680
        Top    = 120
        Width  = 1215
        Height = 375
        TabIndex = 0
        Default = -1              'True
    End
    Begin VB.CommandButton cmdNo
        Caption = "&No"
        Left   = 4680
        Top    = 600
        Width  = 1215
        Height = 375
        TabIndex = 1
        Cancel = -1              'True
    End
    Begin VB.Label lblPrompt
        Left   = 1110
        Top    = 150
        Width  = 3405
        Height = 1575
        TabIndex = 2
    End
    Begin VB.Image Image1
        Picture = frmCTBMsgBox.frx:08DE
        Left   = -360
        Top    = -120
        Width  = 1950
        Height = 1560
    End
End
