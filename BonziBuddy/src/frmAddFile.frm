VERSION 5.00

Begin VB.Form frmAddFile
    Caption = "Add File to Download List"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 3
    Icon = frmAddFile.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 2760
    ClientTop    = 3750
    ClientWidth  = 6030
    ClientHeight = 3195
    LockControls = -1              'True
    ShowInTaskbar = 0              'False
    StartupPosition = 2
    Begin VB.Frame fraAddFile
        Caption = "File Information"
        Left   = 240
        Top    = 1050
        Width  = 5565
        Height = 1935
        TabIndex = 4
        Begin VB.TextBox txtURL
            Left   = 300
            Top    = 600
            Width  = 4995
            Height = 315
            TabIndex = 0
        End
        Begin VB.TextBox txtDescription
            Left   = 300
            Top    = 1380
            Width  = 4995
            Height = 315
            TabIndex = 1
        End
        Begin VB.Label lblURL
            Caption = "File URL (Internet Address)"
            Left   = 300
            Top    = 360
            Width  = 1905
            Height = 195
            TabIndex = 6
            AutoSize = -1              'True
        End
        Begin VB.Label lblDescription
            Caption = "File Description"
            Left   = 300
            Top    = 1140
            Width  = 1080
            Height = 195
            TabIndex = 5
            AutoSize = -1              'True
        End
    End
    Begin VB.CommandButton CancelButton
        Caption = "Cancel"
        Left   = 4680
        Top    = 570
        Width  = 1215
        Height = 375
        TabIndex = 3
        Cancel = -1              'True
    End
    Begin VB.CommandButton OKButton
        Caption = "OK"
        Left   = 4680
        Top    = 120
        Width  = 1215
        Height = 375
        TabIndex = 2
        Default = -1              'True
    End
    Begin VB.Image imgInstruction
        Picture = frmAddFile.frx:0456
        Left   = 300
        Top    = 210
        Width  = 480
        Height = 480
    End
    Begin VB.Label lblInstruction
        Caption = "Enter or change the location (URL) of the file to add to the download list.  You can also enter a description for the file."
        Left   = 1020
        Top    = 180
        Width  = 3495
        Height = 645
        TabIndex = 7
    End
End
