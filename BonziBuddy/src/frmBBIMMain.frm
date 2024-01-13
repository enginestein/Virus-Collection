VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "C:\Windows\system32\MSCOMCTL.OCX"
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "C:\Windows\System32\ieframe.dll"

Begin VB.Form frmBBIMMain
    Caption = "BonziWORLD - Messenger Service"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    Icon = frmBBIMMain.frx:0000
    LinkTopic = "Form1"
    ClientLeft   = 165
    ClientTop    = 450
    ClientWidth  = 9030
    ClientHeight = 5715
    LockControls = -1              'True
    Begin MSComctlLib.StatusBar sbStatus
        Left   = 0
        Top    = 5325
        Width  = 9030
        Height = 390
        TabIndex = 4
        OleObjectBlob = frmBBIMMain.frx:0E56
        Align = 2
    End
    Begin MSComctlLib.Toolbar tbTools
        Left   = 0
        Top    = 0
        Width  = 9030
        Height = 690
        TabIndex = 1
        OleObjectBlob = frmBBIMMain.frx:0E56
        Align = 1
    End
    Begin SHDocVwCtl.WebBrowser wbMain
        Left   = 60
        Top    = 4020
        Width  = 8895
        Height = 1245
        TabStop = 0              'False
        TabIndex = 6
        OleObjectBlob = frmBBIMMain.frx:0E56
    End
    Begin VB.Frame fraFriendsOnline
        Caption = "My Friends"
        Left   = 60
        Top    = 720
        Width  = 8895
        Height = 3225
        TabIndex = 3
        Begin MSComctlLib.TreeView tvwFriends
            Left   = 120
            Top    = 240
            Width  = 8655
            Height = 2835
            TabIndex = 0
            OleObjectBlob = frmBBIMMain.frx:0E56
        End
        Begin VB.PictureBox picbxMask
            BackColor = -2147483643
            Left   = 120
            Top    = 240
            Width  = 8655
            Height = 2835
            TabIndex = 5
            ScaleMode = 1
            AutoRedraw = 0              'False
            FontTransparent = -1              'True
            Begin VB.Image imgLogOn
                Picture = frmBBIMMain.frx:0E56
                Left   = 3300
                Top    = 840
                Width  = 1650
                Height = 1365
            End
            Begin VB.Label lblLogOn
                Caption = "Click on Image to Log On"
                BackColor = -2147483643
                ForeColor = 8388736
                Left   = 3165
                Top    = 2280
                Width  = 2190
                Height = 195
                TabIndex = 2
                Alignment = 2
                AutoSize = -1              'True
                BeginProperty Font
                    Name          = "MS Sans Serif"
                    Size          = 8,25
                    Charset       = 0
                    Weight        = 700
                    Underline     = -1              'True
                    Italic        = 0              'False
                    Strikethrough = 0              'False
                EndProperty
            End
        End
    End
    Begin MSComctlLib.ImageList imgTreeViewPics
        OleObjectBlob = frmBBIMMain.frx:1EB6
        Left = 7380
        Top = 4260
    End
    Begin MSComctlLib.ImageList imgImages24
        OleObjectBlob = frmBBIMMain.frx:1EB6
        Left = 8040
        Top = 4260
    End
    Begin AgentObjectsCtl.Agent Agent1
        OleObjectBlob = frmBBIMMain.frx:1EB6
        Left = 0
        Top = 0
    End
    Begin VB.Menu mnuFile
        Caption = "&File"
        Begin VB.Menu mnuLogOnOff
            Caption = "&LogOn"
        End
        Begin VB.Menu mnusep1
            Caption = "-"
        End
        Begin VB.Menu mnuExit
            Caption = "E&xit"
        End
    End
    Begin VB.Menu mnuTools
        Caption = "&Tools"
        Begin VB.Menu mnuFriends
            Caption = "&Friends..."
        End
        Begin VB.Menu mnuPrivacy
            Caption = "&Privacy..."
        End
        Begin VB.Menu mnuOptions
            Caption = "&Options..."
        End
    End
    Begin VB.Menu mnuFriendPopup
        Visible = 0              'False
        Caption = "MainPopup"
        Begin VB.Menu mnuSendMessage
            Caption = "&Send an Instant Message"
        End
        Begin VB.Menu mnuSendMail
            Caption = "Send a Bonzi&Mail Message"
        End
        Begin VB.Menu mnusep2
            Caption = "-"
        End
        Begin VB.Menu mnuBlock
            Caption = "&Block"
        End
        Begin VB.Menu mnuRemove
            Caption = "&Remove Friend"
        End
        Begin VB.Menu mnuProperties
            Caption = "&Properties"
        End
    End
    Begin VB.Menu mnuHelp
        Caption = "&Help"
        Begin VB.Menu mnuOnlineHelp
            Caption = "&BonziChat Online Help"
        End
    End
End
