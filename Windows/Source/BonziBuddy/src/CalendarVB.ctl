VERSION 5.00

Begin VB.UserControl CalendarVB
    BackColor = 16777215
    ScaleMode = 3
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    KeyPreview = -1              'True
    ClientLeft   = 0
    ClientTop    = 0
    ClientWidth  = 2865
    ClientHeight = 2235
    Begin VB.Timer tmrResize
        Enabled = 0              'False
        Interval = 10
        Left = 2400
        Top = 30
    End
    Begin VB.TextBox ctlFocus
        Left   = -1500
        Top    = 840
        Width  = 465
        Height = 285
        TabIndex = 2
    End
    Begin VB.ComboBox cboYear
        Style = 2
        Left   = 900
        Top    = 60
        Width  = 645
        Height = 315
        Text = ""
        TabIndex = 1
    End
    Begin VB.ComboBox cboPeriod
        Style = 2
        Left   = 90
        Top    = 60
        Width  = 645
        Height = 315
        Text = ""
        TabIndex = 0
    End
    Begin VB.Image imgIcon
        Picture = CalendarVB.ctx:0000
        Left   = 2340
        Top    = 1710
        Width  = 480
        Height = 480
        Visible = 0              'False
    End
    Begin VB.Menu mnuPopup
        Visible = 0              'False
        Caption = "PopupMenu"
        Begin VB.Menu mnuNextPeriod
            Caption = "Next Period"
        End
        Begin VB.Menu mnuPrevPeriod
            Caption = "Previous Period"
        End
        Begin VB.Menu mnuCalendarType
            Caption = "Calendar Types"
            Begin VB.Menu mnuCalTypeMonth
                Caption = "Month"
            End
            Begin VB.Menu mnuCalTypePeriod
                Caption = "Period"
            End
            Begin VB.Menu mnuCalTypeWeek
                Caption = "Week"
            End
        End
        Begin VB.Menu mnuCalendarStyle
            Caption = "Calendar Style"
            Begin VB.Menu mnuStyleNoLine
                Caption = "No Line"
            End
            Begin VB.Menu mnuStyle3D
                Caption = "3D"
            End
            Begin VB.Menu mnuStyleFlat
                Caption = "Flat"
            End
            Begin VB.Menu mnuStyleSunken
                Caption = "Sunken"
            End
        End
    End
End
