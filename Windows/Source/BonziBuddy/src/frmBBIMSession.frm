VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "C:\Windows\system32\MSCOMCTL.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "C:\Program Files\VBReFormer\Lib\RICHTX32.OCX"

Begin VB.Form frmBBIMSession
    Caption = "BoziWORLD Messenger Session"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    Icon = frmBBIMSession.frx:0000
    LinkTopic = "Form1"
    ClientLeft   = 165
    ClientTop    = 450
    ClientWidth  = 9090
    ClientHeight = 5775
    LockControls = -1              'True
    StartupPosition = 2
    Begin MSComctlLib.Toolbar tbTools
        Left   = 0
        Top    = 0
        Width  = 9090
        Height = 690
        TabIndex = 4
        OleObjectBlob = frmBBIMSession.frx:0E56
        Align = 1
    End
    Begin VB.Timer tmrClearStatus
        Interval = 3000
        Left = -360
        Top = 780
    End
    Begin VB.ComboBox cmbFontColor
        Style = 2
        Left   = 5220
        Top    = 60
        Width  = 1155
        Height = 315
        Visible = 0              'False
        Text = ""
        TabIndex = 11
        ToolTipText = "Choose the color of your message font."
    End
    Begin VB.ComboBox cmbFontName
        Style = 2
        Left   = 6390
        Top    = 60
        Width  = 1335
        Height = 315
        Visible = 0              'False
        Text = ""
        TabIndex = 10
        ToolTipText = "Choose the color of your message font."
    End
    Begin VB.ComboBox cmbFontSize
        Style = 2
        Left   = 7740
        Top    = 60
        Width  = 1215
        Height = 315
        Visible = 0              'False
        Text = ""
        TabIndex = 9
        ToolTipText = "Choose the color of your message font."
    End
    Begin VB.Frame fraSendText
        Caption = "Type Something to Send"
        Left   = 60
        Top    = 4020
        Width  = 6405
        Height = 1335
        TabIndex = 7
        Begin VB.CommandButton cmdSend
            Caption = "&Send"
            BackColor = 12632256
            Left   = 5280
            Top    = 210
            Width  = 1005
            Height = 1005
            TabIndex = 2
            Default = -1              'True
            Picture = frmBBIMSession.frx:0E56
            Style = 1
        End
        Begin RichTextLib.RichTextBox rtbOutgoing
            Left   = 120
            Top    = 210
            Width  = 5085
            Height = 1005
            TabIndex = 0
            OleObjectBlob = frmBBIMSession.frx:297C
            ToolTipText = "Type text and/or drag images from the Animations list into this box to send."
        End
    End
    Begin VB.Frame fraHistory
        Caption = "Conversation History"
        Left   = 60
        Top    = 750
        Width  = 6405
        Height = 3195
        TabIndex = 6
        Begin RichTextLib.RichTextBox rtbHistory
            Left   = 120
            Top    = 210
            Width  = 6165
            Height = 2865
            TabStop = 0              'False
            TabIndex = 3
            OleObjectBlob = frmBBIMSession.frx:297C
            ToolTipText = "Displays a history of the current session."
        End
    End
    Begin VB.Frame fraAnimations
        Caption = "Emotions and Gestures"
        Left   = 6540
        Top    = 750
        Width  = 2475
        Height = 4605
        TabIndex = 5
        Begin MSComctlLib.ListView lviewAnimations
            Left   = 120
            Top    = 210
            Width  = 2235
            Height = 4275
            TabIndex = 1
            OleObjectBlob = frmBBIMSession.frx:297C
            ToolTipText = "Double-click image or drag into Send box to send gestures.  Right-click image for more options."
        End
    End
    Begin MSComctlLib.StatusBar sbStatus
        Left   = 0
        Top    = 5460
        Width  = 9090
        Height = 315
        TabIndex = 8
        OleObjectBlob = frmBBIMSession.frx:297C
        Align = 2
    End
    Begin MSComctlLib.ImageList imlAnimations
        OleObjectBlob = frmBBIMSession.frx:297C
        Left = 0
        Top = 0
    End
    Begin MSComctlLib.ImageList imgTreeViewPics
        OleObjectBlob = frmBBIMSession.frx:297C
        Left = -60
        Top = 5040
    End
    Begin MSComctlLib.ImageList imgImages24
        OleObjectBlob = frmBBIMSession.frx:297C
        Left = 600
        Top = 5040
    End
    Begin VB.Menu mnuAnimPopup
        Visible = 0              'False
        Caption = "PopupAnim"
        Begin VB.Menu mnuSendAnimation
            Caption = "&Send Animation"
        End
        Begin VB.Menu mnuViewAnimation
            Caption = "&View Animation"
        End
    End
    Begin VB.Menu mnuFile
        Caption = "&File"
        Begin VB.Menu mnuClose
            Caption = "&Close"
        End
    End
    Begin VB.Menu mnuEdit
        Visible = 0              'False
        Caption = "&Edit"
        Begin VB.Menu mnuFont
            Caption = "&Message Font..."
        End
    End
    Begin VB.Menu mnuBonzi
        Caption = "&Bonzi"
        Begin VB.Menu mnuStopBonzi
            Caption = "&Stop Current Action"
            ShortCut = 19
        End
    End
    Begin VB.Menu mnuPopupInvite
        Visible = 0              'False
        Caption = "Friends"
        Begin VB.Menu mnuFriends
            Index = 0
            Caption = ""
        End
    End
End
