VERSION 5.00

Begin VB.Form frmDialog
    Caption = "BonziBUDDY"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    Icon = frmDialog.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 4815
    ClientTop    = 9540
    ClientWidth  = 6030
    ClientHeight = 1350
    LockControls = -1              'True
    ShowInTaskbar = 0              'False
    StartupPosition = 2
    Begin VB.CheckBox chkStopIt
        Caption = "Don't Prompt Me Again"
        Left   = 210
        Top    = 990
        Width  = 2655
        Height = 225
        TabIndex = 3
    End
    Begin VB.CommandButton cmdNo
        Caption = "&No"
        Left   = 4680
        Top    = 600
        Width  = 1215
        Height = 375
        TabIndex = 1
    End
    Begin VB.CommandButton cmdYes
        Caption = "&Yes"
        Left   = 4680
        Top    = 120
        Width  = 1215
        Height = 375
        TabIndex = 0
    End
    Begin VB.Image Image1
        Picture = frmDialog.frx:08DE
        Left   = 120
        Top    = 240
        Width  = 480
        Height = 480
    End
    Begin VB.Label lblPrompt
        Left   = 750
        Top    = 180
        Width  = 3765
        Height = 675
        TabIndex = 2
        AutoSize = -1              'True
        WordWrap = -1              'True
    End
End
