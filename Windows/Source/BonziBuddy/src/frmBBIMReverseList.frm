VERSION 5.00

Begin VB.Form frmBBIMReverseList
    Caption = "Who has added me as a friend?"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    Icon = frmBBIMReverseList.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 2760
    ClientTop    = 3750
    ClientWidth  = 3480
    ClientHeight = 4515
    LockControls = -1              'True
    ShowInTaskbar = 0              'False
    StartupPosition = 1
    Begin VB.Frame fraReverse
        Caption = "These users have me listed:"
        Left   = 90
        Top    = 90
        Width  = 3300
        Height = 3855
        TabIndex = 0
        Begin VB.ListBox lstReverse
            Left   = 180
            Top    = 300
            Width  = 2970
            Height = 3375
            TabIndex = 2
            ToolTipText = "Right-click on a user in this list for options."
        End
    End
    Begin VB.CommandButton OKButton
        Caption = "&Close"
        Left   = 1140
        Top    = 4050
        Width  = 1215
        Height = 375
        TabIndex = 1
        Default = -1              'True
    End
    Begin VB.Menu mnuListPopUp
        Visible = 0              'False
        Caption = ""
        Begin VB.Menu mnuAddFriend
            Caption = "&Add to My Friends List"
        End
        Begin VB.Menu mnuSep1
            Caption = "-"
        End
        Begin VB.Menu mnuProperties
            Caption = "&Properties"
        End
    End
End
