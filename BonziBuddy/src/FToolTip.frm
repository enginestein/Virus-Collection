VERSION 5.00

Begin VB.Form FToolTip
    Caption = "ToolTip"
    BackColor = 14745599
    ScaleMode = 3
    AutoRedraw = -1              'True
    FontTransparent = -1              'True
    BorderStyle = 0
    LinkTopic = "Form1"
    ClientLeft   = 2055
    ClientTop    = 2505
    ClientWidth  = 1860
    ClientHeight = 480
    LockControls = -1              'True
    ShowInTaskbar = 0              'False
    PaletteMode = 1
    Begin VB.Timer tmrToolTip
        Enabled = 0              'False
        Left = 90
        Top = 60
    End
End
