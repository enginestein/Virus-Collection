VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "C:\Windows\system32\MSWINSCK.OCX"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "C:\Windows\system32\MSINET.OCX"

Begin VB.Form frmAgent
    Caption = "BonziBUDDY"
    ScaleMode = 3
    AutoRedraw = 0              'False
    FontTransparent = -1              'True
    BorderStyle = 1
    Icon = frmAgent.frx:0000
    LinkTopic = "Form1"
    MaxButton = 0              'False
    ControlBox = 0              'False
    ClientLeft   = -450
    ClientTop    = -165
    ClientWidth  = 510
    ClientHeight = 30
    ShowInTaskbar = 0              'False
    Begin VB.Timer tmrEventQueueTimeout
        Enabled = 0              'False
        Interval = 60000
        Left = 3240
        Top = 2640
    End
    Begin VB.Timer tmrBonziEventQueue
        Enabled = 0              'False
        Interval = 1000
        Left = 2040
        Top = 2640
    End
    Begin VB.Timer tmrWakeUp
        Enabled = 0              'False
        Interval = 6000
        Left = 1440
        Top = 2640
    End
    Begin VB.Timer tmrCharacterMove
        Enabled = 0              'False
        Interval = 500
        Left = 840
        Top = 2640
    End
    Begin VB.ListBox lstRandomizer
        Left   = -120
        Top    = 0
        Width  = 975
        Height = 255
        Visible = 0              'False
        TabIndex = 1
    End
    Begin VB.Timer tmrUnload
        Enabled = 0              'False
        Interval = 6000
        Left = 2640
        Top = 2640
    End
    Begin VB.Timer tmrIgnoreEvents
        Interval = 10
        Left = 240
        Top = 2640
    End
    Begin VB.TextBox txtDebugData
        Left   = 120
        Top    = 120
        Width  = 6855
        Height = 6375
        Enabled = 0              'False
        Visible = 0              'False
        TabIndex = 0
        MultiLine = -1              'True
        ScrollBars = 2
    End
    Begin VB.Timer tmrCharacterAction
        Interval = 60000
        Left = 660
        Top = 7380
    End
    Begin RegistryControl.RegiCon RegiCon1
        OleObjectBlob = frmAgent.frx:08DE
        Left = 150
        Top = 7380
    End
    Begin MSWinsockLib.Winsock wsConnected
        OleObjectBlob = frmAgent.frx:08DE
        Left = 3000
        Top = 7380
    End
    Begin InetCtlsObjects.Inet InetReReg
        OleObjectBlob = frmAgent.frx:08DE
        Left = 1770
        Top = 7410
    End
    Begin InetCtlsObjects.Inet Inet1
        OleObjectBlob = frmAgent.frx:08DE
        Left = 1110
        Top = 7410
    End
    Begin InetCtlsObjects.Inet InetGoldSiteAccess
        OleObjectBlob = frmAgent.frx:08DE
        Left = 3450
        Top = 7380
    End
    Begin InetCtlsObjects.Inet InetBonziTaps
        OleObjectBlob = frmAgent.frx:08DE
        Left = 4080
        Top = 7380
    End
    Begin AgentObjectsCtl.Agent Agent1
        OleObjectBlob = frmAgent.frx:08DE
        Left = 2400
        Top = 7410
    End
    Begin VB.Menu mnuPopup
        Visible = 0              'False
        Caption = "PopUpMenu"
        Begin VB.Menu mnuMain
            Visible = 0              'False
            Caption = "Main Menu..."
        End
        Begin VB.Menu mnuMyHome
            Caption = "My Home"
        End
        Begin VB.Menu mnuSearch
            Caption = "Search"
        End
        Begin VB.Menu mnuBrowse
            Caption = "Browse"
        End
        Begin VB.Menu mnuSepZZ
            Caption = "-"
        End
        Begin VB.Menu mnuInternetServices
            Visible = 0              'False
            Caption = "My Services..."
            Begin VB.Menu mnuServices
                Caption = "TRAVEL"
                Begin VB.Menu mnuAirline
                    Caption = "Airline Reservations..."
                End
                Begin VB.Menu mnuCarRentals
                    Caption = "Car Rentals..."
                End
                Begin VB.Menu mnuHotel
                    Caption = "Hotel Reservations..."
                End
            End
            Begin VB.Menu mnuIS_Gifts
                Caption = "GIFT IDEAS"
                Begin VB.Menu mnuIS_GiftsItem1
                    Caption = "Flowers..."
                End
                Begin VB.Menu mnuIS_GiftsItem2
                    Caption = "Gift Baskets..."
                End
                Begin VB.Menu mnuIS_GiftsItem3
                    Caption = "Birthdays..."
                End
            End
            Begin VB.Menu mnuIS_Books
                Caption = "BOOKS"
                Begin VB.Menu mnuIS_BooksItem1
                    Caption = "Search by Title..."
                End
                Begin VB.Menu mnuSep13
                    Caption = "-"
                End
                Begin VB.Menu mnuIS_BooksItem2
                    Caption = "Browse by Subject..."
                End
                Begin VB.Menu mnuSep14
                    Caption = "-"
                End
                Begin VB.Menu mnuIS_BooksItem3
                    Caption = "BestSellers..."
                End
                Begin VB.Menu mnuIS_BooksItem4
                    Caption = "Childrens..."
                End
            End
            Begin VB.Menu mnuIS_Movies
                Caption = "MOVIES"
            End
            Begin VB.Menu mnuIS_Music
                Caption = "MUSIC"
            End
        End
        Begin VB.Menu mnuWeb
            Visible = 0              'False
            Caption = "Web"
            Begin VB.Menu mnuTopTen
                Caption = "My Favorite Sites"
                Begin VB.Menu mnuTopSitesList
                    Index = 0
                    Caption = ""
                End
                Begin VB.Menu mnuTopSitesList
                    Index = 1
                    Caption = ""
                End
                Begin VB.Menu mnuTopSitesList
                    Index = 2
                    Caption = ""
                End
                Begin VB.Menu mnuTopSitesList
                    Index = 3
                    Caption = ""
                End
                Begin VB.Menu mnuTopSitesList
                    Index = 4
                    Caption = ""
                End
                Begin VB.Menu mnuTopSitesList
                    Index = 5
                    Caption = ""
                End
            End
            Begin VB.Menu mnuReadWeb
                Caption = "Read Web Page"
            End
            Begin VB.Menu mnuIEDownload
                Caption = "Get the Latest Version of Internet Explorer"
            End
        End
        Begin VB.Menu mnuSep6
            Visible = 0              'False
            Caption = "-"
        End
        Begin VB.Menu mnuCheckAddons
            Caption = "Check for New Add-Ons..."
        End
        Begin VB.Menu mnuCheckForNews
            Visible = 0              'False
            Caption = "Check for Breaking News..."
        End
        Begin VB.Menu mnuCheckForVirusAlerts
            Visible = 0              'False
            Caption = "Check for Virus Alerts..."
        End
        Begin VB.Menu mnuNBSetp2
            Caption = "-"
        End
        Begin VB.Menu mnuVoiceCommands
            Caption = "Open Voice Commands Window"
        End
        Begin VB.Menu mnuSpeak
            Caption = "Speak"
        End
        Begin VB.Menu mnuJoke
            Caption = "Tell a Joke"
        End
        Begin VB.Menu mnuFact
            Caption = "Tell an Amazing Fact"
        End
        Begin VB.Menu mnuSing
            Caption = "Sing a Song"
        End
        Begin VB.Menu mnuCalendar
            Caption = "Calendar"
        End
        Begin VB.Menu mnuGames
            Caption = "Play Games"
            Begin VB.Menu mnuGamesGamesville
                Visible = 0              'False
                Caption = "Gamesville"
            End
            Begin VB.Menu mnuGamesCasinoGames
                Visible = 0              'False
                Caption = "Casino Games"
            End
            Begin VB.Menu mnuGamesSportsbook
                Caption = "Online Games"
            End
            Begin VB.Menu mnuSepGames1
                Caption = "-"
            End
            Begin VB.Menu mnuGamesBonziBUDDYGames
                Caption = "BonziBUDDY Games"
            End
            Begin VB.Menu mnuGamesBonziCHECKERS
                Visible = 0              'False
                Caption = "Bonzi's Beach Checkers"
            End
            Begin VB.Menu mnuGamesBonziJungleJigsaw
                Visible = 0              'False
                Caption = "Bonzi's Jungle Jigsaw"
            End
            Begin VB.Menu mnuGamesBonziSolitaire
                Visible = 0              'False
                Caption = "Bonzi's Solitaire"
            End
        End
        Begin VB.Menu mnuReadStoryGroup
            Visible = 0              'False
            Caption = "Read Stories"
            Begin VB.Menu mnuReadStoryAlphanet
                Caption = "Bonzi and the Alpha-net!"
            End
            Begin VB.Menu mnuReadStoryInternet
                Caption = "Bonzi and the Internet!"
            End
            Begin VB.Menu mnuReadStoryPolizoof
                Caption = "Bonzi and the Polizoof!"
            End
            Begin VB.Menu mnuReadStoryTreasureChest
                Caption = "Bonzi and the Treasure Chest!"
            End
        End
        Begin VB.Menu mnuSep16
            Caption = "-"
        End
        Begin VB.Menu mnuBonziMAIL
            Caption = "BonziBUDDY E-Mail"
            Begin VB.Menu mnuWriteEmail
                Caption = "New Message"
                ShortCut = 50
            End
            Begin VB.Menu mnuEMAIL
                Caption = "Check for E-Mail..."
            End
        End
        Begin VB.Menu mnuSep15
            Caption = "-"
        End
        Begin VB.Menu mnuSaveYouMoney
            Visible = 0              'False
            Caption = "Save You Money..."
        End
        Begin VB.Menu mnuDownloadManager
            Visible = 0              'False
            Caption = "Download Files..."
        End
        Begin VB.Menu mnuECenter
            Visible = 0              'False
            Caption = "Play Video && Audio..."
        End
        Begin VB.Menu mnuSep29
            Visible = 0              'False
            Caption = "-"
        End
        Begin VB.Menu mnuInternetAlert
            Visible = 0              'False
            Caption = "Protect Yourself On The Internet..."
        End
        Begin VB.Menu mnuNetBoost
            Visible = 0              'False
            Caption = "Speed Up Your Internet Connection..."
        End
        Begin VB.Menu mnuWallet
            Visible = 0              'False
            Caption = "My Wallet"
            Enabled = 0              'False
        End
        Begin VB.Menu mnuSep3
            Visible = 0              'False
            Caption = "-"
        End
        Begin VB.Menu mnuBonziWorld
            Visible = 0              'False
            Caption = "BonziWORLD Services"
            Begin VB.Menu mnuIM
                Caption = "Instant Messaging..."
            End
            Begin VB.Menu mnuBWEMail
                Caption = "Check our BonziWORLD Mailbox..."
            End
            Begin VB.Menu mnuSep44
                Caption = "-"
            End
            Begin VB.Menu mnuBWMember
                Caption = "Become a BonziWORLD Member..."
            End
        End
        Begin VB.Menu mnuSep10
            Visible = 0              'False
            Caption = "-"
        End
        Begin VB.Menu mnuTellFriends
            Caption = "Share Me With Friends"
        End
        Begin VB.Menu mnuUpdate
            Caption = "Update Me"
        End
        Begin VB.Menu mnuSetup
            Caption = "My Options"
            Begin VB.Menu mnuOptionsSettings
                Caption = "Settings"
            End
            Begin VB.Menu mnuInteractionControl
                Caption = "Personality"
            End
            Begin VB.Menu mnuSalutation
                Caption = "Salutation"
            End
            Begin VB.Menu mnuSep5
                Caption = "-"
            End
            Begin VB.Menu mnuSupport
                Caption = "Support"
            End
            Begin VB.Menu mnuInteraction
                Visible = 0              'False
                Caption = "Interaction"
                Begin VB.Menu mnuMoreInteraction
                    Caption = "More Interaction"
                End
                Begin VB.Menu mnuLessInteraction
                    Caption = "Less Interaction"
                End
            End
            Begin VB.Menu mnuConnection
                Visible = 0              'False
                Caption = "Internet Connection Settings"
            End
            Begin VB.Menu mnuEmailSetup
                Visible = 0              'False
                Caption = "E-Mail Reader Options"
            End
            Begin VB.Menu mnuDownloadManagerSetup
                Visible = 0              'False
                Caption = "Download Manager Setup"
            End
            Begin VB.Menu mnuRegistration
                Caption = "Online Registration..."
            End
            Begin VB.Menu mnuAO
                Visible = 0              'False
                Caption = "Advanced Setup Options"
            End
        End
        Begin VB.Menu mnuHelp
            Visible = 0              'False
            Caption = "Help"
            Begin VB.Menu mnuOnlineHelp
                Caption = "My Online Help"
            End
            Begin VB.Menu mnuTalkingHelp
                Caption = "Talking Add-on Help"
            End
            Begin VB.Menu mnuAbout
                Visible = 0              'False
                Caption = "About BonziBUDDY"
            End
        End
        Begin VB.Menu mnuSep4
            Caption = "-"
        End
        Begin VB.Menu mnuRelaxMode
            Visible = 0              'False
            Caption = "Relax Mode"
        End
        Begin VB.Menu mnuSilentMode
            Caption = "Quiet Mode - F9"
        End
        Begin VB.Menu mnuHide
            Caption = "Hide"
        End
        Begin VB.Menu mnuExit
            Caption = "Goodbye"
        End
    End
End
