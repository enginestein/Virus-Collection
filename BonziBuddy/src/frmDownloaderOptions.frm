VERSION 5.00

Begin VB.Form frmDownloaderOptions
    Caption = "Bonzi's Download Manager - Options"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    KeyPreview = -1              'True
    ClientLeft   = 2565
    ClientTop    = 1500
    ClientWidth  = 5235
    ClientHeight = 3030
    LockControls = -1              'True
    ShowInTaskbar = 0              'False
    StartupPosition = 2
    Begin VB.Frame fraOptions1
        Caption = "Downloading Options"
        Left   = 180
        Top    = 180
        Width  = 4875
        Height = 2175
        TabIndex = 8
        Begin VB.CheckBox chkIntegrate
            Caption = "Integrate Download Manager with Internet Explorer"
            Left   = 270
            Top    = 1650
            Width  = 4425
            Height = 315
            TabIndex = 12
        End
        Begin VB.CheckBox chkNotify
            Caption = "Notify Me on Startup of Files to Download or Install"
            Left   = 270
            Top    = 1230
            Width  = 4425
            Height = 315
            TabIndex = 11
        End
        Begin VB.CheckBox chkAutoRun
            Caption = "Launch or Install File After Download Completes"
            Left   = 270
            Top    = 390
            Width  = 3765
            Height = 315
            TabIndex = 10
        End
        Begin VB.CheckBox chkPromptSave
            Caption = "Prompt for a File Name Before Downloading"
            Left   = 270
            Top    = 810
            Width  = 3645
            Height = 315
            TabIndex = 9
        End
    End
    Begin VB.PictureBox picOptions
        Index = 3
        Left   = -20000
        Top    = 480
        Width  = 5685
        Height = 3780
        TabIndex = 4
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.Frame fraSample4
            Caption = "Sample 4"
            Left   = 2100
            Top    = 840
            Width  = 2055
            Height = 1785
            TabIndex = 7
        End
    End
    Begin VB.PictureBox picOptions
        Index = 2
        Left   = -20000
        Top    = 480
        Width  = 5685
        Height = 3780
        TabIndex = 3
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.Frame fraSample3
            Caption = "Sample 3"
            Left   = 1545
            Top    = 675
            Width  = 2055
            Height = 1785
            TabIndex = 6
        End
    End
    Begin VB.PictureBox picOptions
        Index = 1
        Left   = -20000
        Top    = 480
        Width  = 5685
        Height = 3780
        TabIndex = 2
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        BorderStyle = 0
        TabStop = 0              'False
        Begin VB.Frame fraSample2
            Caption = "Sample 2"
            Left   = 645
            Top    = 300
            Width  = 2055
            Height = 1785
            TabIndex = 5
        End
    End
    Begin VB.CommandButton cmdCancel
        Caption = "&Cancel"
        Left   = 3840
        Top    = 2505
        Width  = 1215
        Height = 375
        TabIndex = 1
        Cancel = -1              'True
    End
    Begin VB.CommandButton cmdOK
        Caption = "&OK"
        Left   = 2490
        Top    = 2505
        Width  = 1215
        Height = 375
        TabIndex = 0
        Default = -1              'True
    End
End
