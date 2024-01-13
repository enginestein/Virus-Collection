VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "C:\Windows\system32\MSCOMCTL.OCX"

Begin VB.Form frmCalendar2
    Caption = "My Calendar/Schedule"
    BackColor = 16777215
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 1
    Icon = frmCalendar2.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 45
    ClientTop    = 330
    ClientWidth  = 9180
    ClientHeight = 6570
    StartupPosition = 2
    Begin VB.Timer tmrButternutAnimation
        Interval = 1000
        Left = 0
        Top = 0
    End
    Begin BonziBUDDY.CalendarVB CalendarVB1
        Left   = 180
        Top    = 1620
        Width  = 4785
        Height = 4305
        TabIndex = 2
        OleObjectBlob = frmCalendar2.frx:08DE
    End
    Begin VB.CommandButton Command1
        BackColor = 8454143
        Left   = 150
        Top    = 1590
        Width  = 4875
        Height = 4395
        Enabled = 0              'False
        TabIndex = 8
        TabStop = 0              'False
        Appearance = 0
        MaskColor = 16777215
    End
    Begin MSComctlLib.ListView lviewSchedule
        Left   = 5250
        Top    = 1920
        Width  = 3735
        Height = 4050
        TabIndex = 5
        OleObjectBlob = frmCalendar2.frx:08DE
    End
    Begin VB.CommandButton cmdOK
        Caption = "&Close"
        Left   = 7470
        Top    = 6090
        Width  = 1155
        Height = 405
        TabIndex = 1
    End
    Begin VB.CommandButton cmdAdd
        Caption = "&Add"
        Left   = 660
        Top    = 6090
        Width  = 1185
        Height = 405
        TabIndex = 3
    End
    Begin VB.CommandButton cmdDelete
        Caption = "&Delete"
        Left   = 5160
        Top    = 6090
        Width  = 1155
        Height = 405
        TabIndex = 4
    End
    Begin VB.CommandButton cmdEdit
        Caption = "&Edit"
        Left   = 2880
        Top    = 6090
        Width  = 1155
        Height = 405
        TabIndex = 6
    End
    Begin VB.PictureBox Picture4
        BackColor = -2147483643
        Picture = frmCalendar2.frx:08DE
        ForeColor = 16777215
        Left   = 0
        Top    = 0
        Width  = 9630
        Height = 1155
        TabIndex = 9
        ScaleMode = 1
        AutoRedraw = 0              'False
        FontTransparent = -1              'True
        FillColor = 16777215
        BorderStyle = 0
        Appearance = 0
        Begin Threed.SSCommand cmdAddons
            Left   = 5550
            Top    = -30
            Width  = 3660
            Height = 585
            TabIndex = 10
            OleObjectBlob = frmCalendar2.frx:6323
        End
    End
    Begin VB.Label lblDay
        Caption = "Schedule for 12/31/2000"
        BackColor = 16777215
        ForeColor = 32768
        Left   = 5250
        Top    = 1590
        Width  = 3735
        Height = 315
        TabIndex = 7
        BorderStyle = 1
        Alignment = 2
        BeginProperty Font
            Name          = "MS Sans Serif"
            Size          = 9,75
            Charset       = 0
            Weight        = 400
            Underline     = 0              'False
            Italic        = 0              'False
            Strikethrough = 0              'False
        EndProperty
    End
    Begin VB.Label lblDescription
        Caption = "I can help keep you on schedule.  Simply enter your appointments, birthdays and special events into my calendar below. I will remind you when they are near."
        BackColor = 16777215
        ForeColor = 32768
        Left   = 720
        Top    = 1140
        Width  = 8055
        Height = 585
        TabIndex = 0
    End
End
