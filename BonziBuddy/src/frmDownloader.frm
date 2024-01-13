VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "C:\Windows\system32\MSCOMCTL.OCX"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "C:\Windows\system32\MSINET.OCX"

Begin VB.Form frmDownloader
    Caption = "Bonzi's Download Manager"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 1
    Icon = frmDownloader.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    ClientLeft   = 150
    ClientTop    = 435
    ClientWidth  = 9450
    ClientHeight = 4050
    LockControls = -1              'True
    StartupPosition = 2
    Begin VB.Timer tmrDownloadRate
        Enabled = 0              'False
        Interval = 1000
        Left = -300
        Top = 1260
    End
    Begin MSComctlLib.ImageList ImgLst1
        OleObjectBlob = frmDownloader.frx:08DE
        Left = -450
        Top = 690
    End
    Begin MSComctlLib.Toolbar tb1
        Left   = 0
        Top    = 0
        Width  = 9450
        Height = 570
        TabIndex = 0
        OleObjectBlob = frmDownloader.frx:08DE
        Align = 1
    End
    Begin VB.Frame fraDowloadQueue
        Caption = "Current Download List"
        Left   = 150
        Top    = 780
        Width  = 9135
        Height = 2745
        TabIndex = 3
        Begin MSComctlLib.ListView lstQueue
            Left   = 150
            Top    = 240
            Width  = 8835
            Height = 2355
            TabIndex = 4
            OleObjectBlob = frmDownloader.frx:08DE
        End
    End
    Begin MSComctlLib.ProgressBar pbDownload
        Left   = 6060
        Top    = 3735
        Width  = 3360
        Height = 285
        TabIndex = 2
        OleObjectBlob = frmDownloader.frx:08DE
    End
    Begin MSComctlLib.StatusBar sbStatus
        Left   = 0
        Top    = 3675
        Width  = 9450
        Height = 375
        TabIndex = 1
        OleObjectBlob = frmDownloader.frx:08DE
        Align = 2
    End
    Begin InetCtlsObjects.Inet MSInet
        OleObjectBlob = frmDownloader.frx:08DE
        Left = 30
        Top = 7500
    End
    Begin VB.Menu mnuFile
        Caption = "&File"
        Begin VB.Menu mnuExit
            Caption = "E&xit"
        End
        Begin VB.Menu mnuGet
            Visible = 0              'False
            Caption = "Get Server Info"
            Enabled = 0              'False
        End
    End
    Begin VB.Menu mnuSetup
        Caption = "&Setup"
        Begin VB.Menu mnuOptions
            Caption = "&Options"
        End
    End
    Begin VB.Menu mnuListPopup
        Visible = 0              'False
        Caption = "ListPopup"
        Begin VB.Menu mnuPopupDownloadNow
            Caption = "&Download File"
        End
        Begin VB.Menu mnuPopupRun
            Caption = "Run File"
        End
        Begin VB.Menu mnuPopupEdit
            Caption = "Edit"
            Enabled = 0              'False
        End
        Begin VB.Menu mnuSep1
            Caption = "-"
        End
        Begin VB.Menu mnuPopupRemove
            Caption = "&Remove File from List"
        End
        Begin VB.Menu mnuPopupDelete
            Caption = "Delete File from Disk"
        End
    End
End
