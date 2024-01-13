VERSION 5.00

Begin VB.Form frmAppointment
    Caption = "Add New Appointment or Task"
    ScaleMode = 1
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 1
    Icon = frmAppointment.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    MinButton = 0              'False
    ClientLeft   = 45
    ClientTop    = 330
    ClientWidth  = 5850
    ClientHeight = 4140
    LockControls = -1              'True
    StartupPosition = 2
    Begin VB.CommandButton cmdAdd
        Caption = "&Save"
        Left   = 1470
        Top    = 3630
        Width  = 1155
        Height = 405
        TabIndex = 7
    End
    Begin VB.CommandButton cmdDelete
        Caption = "&Cancel"
        Left   = 3150
        Top    = 3630
        Width  = 1155
        Height = 405
        TabIndex = 8
    End
    Begin VB.Frame fraApp
        Caption = "Appointment or Task"
        Left   = 120
        Top    = 840
        Width  = 5595
        Height = 2595
        TabIndex = 9
        Begin VB.TextBox txtDatePicker
            Left   = 1260
            Top    = 2040
            Width  = 1515
            Height = 315
            Text = "12/29/1971"
            TabIndex = 4
        End
        Begin VB.Frame fraDivider
            Left   = 210
            Top    = 1680
            Width  = 5115
            Height = 135
            TabIndex = 12
        End
        Begin VB.ComboBox cboDueHour
            Style = 2
            Left   = 690
            Top    = 1230
            Width  = 915
            Height = 315
            Text = ""
            TabIndex = 1
        End
        Begin VB.ComboBox cboDueAMPM
            Style = 2
            Left   = 1770
            Top    = 1230
            Width  = 615
            Height = 315
            Text = ""
            TabIndex = 2
        End
        Begin VB.TextBox txtMemo
            Left   = 210
            Top    = 360
            Width  = 5205
            Height = 675
            TabIndex = 0
            MultiLine = -1              'True
            MaxLength = 80
        End
        Begin VB.ComboBox cboAMPM
            Style = 2
            Left   = 4680
            Top    = 2040
            Width  = 615
            Height = 315
            Text = ""
            TabIndex = 6
        End
        Begin VB.ComboBox cboHour
            Style = 2
            Left   = 3630
            Top    = 2040
            Width  = 915
            Height = 315
            Text = ""
            TabIndex = 5
        End
        Begin VB.CheckBox chkRemind
            Caption = "Reminder:"
            Left   = 180
            Top    = 2070
            Width  = 1035
            Height = 255
            TabIndex = 3
        End
        Begin VB.Label Label2
            Caption = "Time:"
            Left   = 210
            Top    = 1290
            Width  = 390
            Height = 195
            TabIndex = 11
            AutoSize = -1              'True
        End
        Begin VB.Label lblReminderTime
            Caption = "At:"
            Left   = 3360
            Top    = 2100
            Width  = 195
            Height = 195
            TabIndex = 10
            AutoSize = -1              'True
        End
    End
    Begin VB.Label Label1
        Caption = "Enter or edit the appointment or task below and select the appointment time.  If you like, select a reminder time and I will remind you of your appointment in advance."
        Left   = 180
        Top    = 90
        Width  = 5475
        Height = 675
        TabIndex = 13
    End
End
