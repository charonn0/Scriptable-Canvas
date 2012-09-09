#tag Window
Begin Window MainWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   343
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   True
   Title           =   "Scriptable Canvas"
   Visible         =   True
   Width           =   937
   Begin ScriptCanvas ScriptCanvas1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   True
      DragStartX      =   0
      DragStartY      =   0
      Enabled         =   True
      EraseBackground =   False
      Height          =   309
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   385
   End
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   302
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   389
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "OnPaint\rOnClick\rOnMouseMove\rSettings"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   7
      Underline       =   ""
      Value           =   3
      Visible         =   True
      Width           =   548
      Begin TextArea OnPaint
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   16777215
         Bold            =   ""
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   258
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   400
         LimitText       =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   ""
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "  //OnPaint\r\n  ClearIt()\r\n  Dim i As Integer\r\n  \r\n  SetPenHeight(2)\r\n  SetColor(&c8000FF)\r\n  For i = 0 To Height Step 10\r\n    DrawLine(0, i, Width, Height)\r\n  Next\r\n  \r\n  SetPenHeight(3)\r\n  SetColor(&c8080FF)\r\n  For i = 0 To Width Step 10\r\n    DrawLine(0, i, i, 0)\r\n  Next\r\n  \r\n  SetPenWidth(1)\r\n  SetPenHeight(1)\r\n  SetColor(&cFF00FF)\r\n  For i = 0 To Height Step 10\r\n    DrawLine(i, 0, Width, Height)\r\n  Next\r\n  \r\n  SetColor(&c000000)\r\n  SetFont(""Typewriter"")\r\n  SetFontSize(25)\r\n  DrawText(""Hello, world!"", Width \\ 2, Height \\ 2)\r\n  \r\n  SetFont(""System"")\r\n  DrawText(&u00A9 + ""Unicode character string"", Width \\ 4, Height \\ 4)\r\n  DrawText(Chr(169) + ""ASCII character string"", Width \\ 4, Height \\ 6)\r\n  \r\n  SetColor(&c0000FF)\r\n  FillOval(0, 0, 50, 50)\r\n  \r\n  SetColor(&cFF0000)\r\n  FillRect(Width * 0.25, Height * 0.25, 50, 50)\r\n  \r\n  SetPenHeight(3)\r\n  SetPenWidth(3)\r\n  \r\n  SetColor(&c00FF00)\r\n  DrawOval(Width * 0.50, Height * 0.50, 50, 50)\r\n  \r\n  SetColor(&cFF8000)\r\n  DrawRect(Width * 0.75, Height * 0.75, 50, 50)\r\n  \r\n  DoIt(False)\r\n"
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   40
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   530
      End
      Begin TextArea OnClick
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   16777215
         Bold            =   ""
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   258
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   397
         LimitText       =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   ""
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "  //Onclick\r\n  FillRect(CurrentMouseX - 2, CurrentMouseY - 2, 5, 5)\r\n  DoIt(False)"
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   40
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   527
      End
      Begin TextArea OnMouseMove
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   16777215
         Bold            =   ""
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   259
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   400
         LimitText       =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   False
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "  //OnMouseMove\r\n  TempClear()\r\n  SetColor(&c0000FF)\r\n  TempDrawText(Str(CurrentMouseX) + "","" + _\r\n       Str(CurrentMouseY), CurrentMouseX + 6, CurrentMouseY + 6)\r\n  DoIt(False)"
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   40
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   531
      End
      Begin Slider Throttle
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   397
         LineStep        =   1
         LiveScroll      =   ""
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Maximum         =   15
         Minimum         =   1
         PageStep        =   1
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         TickStyle       =   0
         Top             =   58
         Value           =   2
         Visible         =   True
         Width           =   167
      End
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   397
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   4
         Text            =   "Throttle (lower is faster):"
         TextAlign       =   0
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   36
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   167
      End
      Begin RbScript Script
         EncodingFont    =   ""
         Height          =   32
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   885
         LockedInPosition=   False
         Scope           =   0
         Source          =   ""
         TabPanelIndex   =   4
         Top             =   36
         Width           =   32
      End
   End
   Begin BevelButton BevelButton1
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   0
      Bevel           =   0
      Bold            =   False
      ButtonType      =   1
      Caption         =   "Run"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   ""
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   815
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   ""
      TextUnit        =   0
      Top             =   321
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   115
   End
   Begin Pushbutton CheckButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Check"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   688
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   ""
      TextUnit        =   0
      Top             =   321
      Underline       =   False
      Visible         =   True
      Width           =   115
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Resized()
		  If BevelButton1.Value Then
		    If Script.State = RbScript.kStateRunning Then Return
		    Script.Source = OnPaint.Text
		    Script.Context = ScriptCanvas1
		    Script.Run
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  If BevelButton1.Value And Ticks Mod Throttle.Value = 0 Then
		    If Script.State = RbScript.kStateRunning Then Return
		    Script.Source = OnPaint.Text
		    Script.Context = ScriptCanvas1
		    Script.Run
		  End If
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h21
		Private Dragged As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events ScriptCanvas1
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If BevelButton1.Value Then
		    If Ticks Mod Throttle.Value = 0 Then
		      If Script.State = RbScript.kStateRunning Then Return
		      Script.Source = OnMouseMove.Text
		      Script.Context = ScriptCanvas1
		      Script.Run
		    End If
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  
		  If BevelButton1.Value Then
		    If Not Dragged Then
		      If Script.State = RbScript.kStateRunning Then Return False
		      Script.Source = OnClick.Text
		      Script.Context = ScriptCanvas1
		      Script.Run
		    End If
		  End If
		  Dragged = False
		  Return False
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Script
	#tag Event
		Sub CompilerError(line As Integer, errorNumber As Integer, errorMsg As String)
		  #pragma Unused errorMsg
		  MsgBox("Error in script on line " + Str(line) + ": (" +Str(errorNumber) + ") " + ScriptCanvas.ErrorCodeToString(ErrorNumber))
		End Sub
	#tag EndEvent
	#tag Event
		Sub Print(msg As String)
		  MsgBox(msg)
		End Sub
	#tag EndEvent
	#tag Event
		Function Input(prompt As String) As String
		  Call MsgBox(prompt, 0, "Script asked for input!")
		  Return "Don't call 'Input'!"
		End Function
	#tag EndEvent
	#tag Event
		Sub RuntimeError(line As Integer, error As RuntimeException)
		  MsgBox("Error in script on line " + Str(line) + ": (" +Str(error.ErrorNumber) + ") " + error.Message)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BevelButton1
	#tag Event
		Sub Action()
		  If Not Me.Value Then
		    Script.Reset
		    Script.Source = ""
		    Script.Context = ScriptCanvas1
		    Me.Caption = "Run"
		  Else
		    Script.Reset
		    Script.Source = OnPaint.Text
		    Script.Context = ScriptCanvas1
		    Script.Run
		    Me.Caption = "Running..."
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckButton
	#tag Event
		Sub Action()
		  Script.Reset
		  Script.Context = ScriptCanvas1
		  Script.Source = OnPaint.Text
		  MsgBox("Test OnPaint")
		  Script.Precompile
		  MsgBox("Test OnPaint done")
		  
		  Script.Reset
		  Script.Source = ""
		  Script.Context = ScriptCanvas1
		  Script.Source = OnClick.Text
		  MsgBox("Test OnClick")
		  Script.Precompile
		  MsgBox("Test OnClick done")
		  
		  Script.Reset
		  Script.Context = ScriptCanvas1
		  Script.Source = OnMouseMove.Text
		  MsgBox("Test OnMouseMove")
		  Script.Precompile
		  MsgBox("Test OnMouseMove done")
		End Sub
	#tag EndEvent
#tag EndEvents
