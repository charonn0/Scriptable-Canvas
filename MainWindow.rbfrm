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
      Value           =   0
      Visible         =   True
      Width           =   548
      Begin CustomEditField OnClick
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoCloseBrackets=   false
         AutocompleteAppliesStandardCase=   true
         AutoDeactivate  =   True
         AutoIndentNewLines=   true
         BackColor       =   16777215
         Border          =   True
         BorderColor     =   &h888888
         BracketHighlightColor=   "&cFFFF00"
         CaretColor      =   "&c000000"
         ClearHighlightedRangesOnTextChange=   true
         DirtyLinesColor =   "&cFF9999"
         DisplayDirtyLines=   false
         DisplayInvisibleCharacters=   false
         DisplayLineNumbers=   true
         DisplayRightMarginMarker=   false
         DoubleBuffer    =   False
         EnableAutocomplete=   false
         Enabled         =   True
         EnableLineFoldings=   false
         EraseBackground =   ""
         GutterBackgroundColor=   "&cEEEEEE"
         GutterSeparationLineColor=   "&c888888"
         Height          =   258
         HelpTag         =   ""
         HighlightBlocksOnMouseOverGutter=   true
         HighlightMatchingBrackets=   true
         HighlightMatchingBracketsMode=   0
         ignoreRepaint   =   0
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   397
         leftMarginOffset=   4
         LineNumbersColor=   "&c888888"
         LineNumbersTextFont=   "System"
         LineNumbersTextSize=   9
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         ReadOnly        =   ""
         RightMarginAtPixel=   0
         RightScrollMargin=   150
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "  //Onclick\r\n  FillRect(CurrentMouseX - 2, CurrentMouseY - 2, 5, 5)\r\n  DoIt(False)"
         TextColor       =   0
         TextFont        =   "System"
         TextSelectionColor=   &h000000
         TextSize        =   0
         ThickInsertionPoint=   true
         Top             =   40
         UseFocusRing    =   True
         Visible         =   True
         Width           =   533
      End
      Begin CustomEditField OnMouseMove
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoCloseBrackets=   false
         AutocompleteAppliesStandardCase=   true
         AutoDeactivate  =   True
         AutoIndentNewLines=   true
         BackColor       =   16777215
         Border          =   True
         BorderColor     =   &h888888
         BracketHighlightColor=   "&cFFFF00"
         CaretColor      =   "&c000000"
         ClearHighlightedRangesOnTextChange=   true
         DirtyLinesColor =   "&cFF9999"
         DisplayDirtyLines=   false
         DisplayInvisibleCharacters=   false
         DisplayLineNumbers=   true
         DisplayRightMarginMarker=   false
         DoubleBuffer    =   False
         EnableAutocomplete=   false
         Enabled         =   True
         EnableLineFoldings=   false
         EraseBackground =   ""
         GutterBackgroundColor=   "&cEEEEEE"
         GutterSeparationLineColor=   "&c888888"
         Height          =   259
         HelpTag         =   ""
         HighlightBlocksOnMouseOverGutter=   true
         HighlightMatchingBrackets=   true
         HighlightMatchingBracketsMode=   0
         ignoreRepaint   =   0
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   397
         leftMarginOffset=   4
         LineNumbersColor=   "&c888888"
         LineNumbersTextFont=   "System"
         LineNumbersTextSize=   9
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         ReadOnly        =   False
         RightMarginAtPixel=   0
         RightScrollMargin=   150
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   "  //OnMouseMove\r\n  TempClear()\r\n  SetColor(&c0000FF)\r\n  TempDrawText(Str(CurrentMouseX) + "","" + _\r\n       Str(CurrentMouseY), CurrentMouseX + 6, CurrentMouseY + 6)\r\n  DoIt(False)"
         TextColor       =   0
         TextFont        =   "System"
         TextSelectionColor=   &h000000
         TextSize        =   0
         ThickInsertionPoint=   true
         Top             =   40
         UseFocusRing    =   True
         Visible         =   True
         Width           =   533
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
      Begin CustomEditField OnPaint
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoCloseBrackets=   False
         AutocompleteAppliesStandardCase=   true
         AutoDeactivate  =   True
         AutoIndentNewLines=   true
         BackColor       =   16777215
         Border          =   True
         BorderColor     =   &h888888
         BracketHighlightColor=   &h00FF0000
         CaretColor      =   "&c000000"
         ClearHighlightedRangesOnTextChange=   true
         DirtyLinesColor =   "&cFF9999"
         DisplayDirtyLines=   True
         DisplayInvisibleCharacters=   false
         DisplayLineNumbers=   true
         DisplayRightMarginMarker=   false
         DoubleBuffer    =   False
         EnableAutocomplete=   True
         Enabled         =   True
         EnableLineFoldings=   True
         EraseBackground =   ""
         GutterBackgroundColor=   "&cEEEEEE"
         GutterSeparationLineColor=   "&c888888"
         Height          =   258
         HelpTag         =   ""
         HighlightBlocksOnMouseOverGutter=   true
         HighlightMatchingBrackets=   true
         HighlightMatchingBracketsMode=   1
         ignoreRepaint   =   0
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   397
         leftMarginOffset=   4
         LineNumbersColor=   "&c888888"
         LineNumbersTextFont=   "System"
         LineNumbersTextSize=   9
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         ReadOnly        =   ""
         RightMarginAtPixel=   0
         RightScrollMargin=   150
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "  //OnPaint\r\n  ClearIt()\r\n  Dim i As Integer\r\n  \r\n  SetPenHeight(2)\r\n  SetColor(&c8000FF)\r\n  For i = 0 To Height Step 10\r\n    DrawLine(0, i, Width, Height)\r\n  Next\r\n  \r\n  SetPenHeight(3)\r\n  SetColor(&c8080FF)\r\n  For i = 0 To Width Step 10\r\n    DrawLine(0, i, i, 0)\r\n  Next\r\n  \r\n  SetPenWidth(1)\r\n  SetPenHeight(1)\r\n  SetColor(&cFF00FF)\r\n  For i = 0 To Height Step 10\r\n    DrawLine(i, 0, Width, Height)\r\n  Next\r\n  \r\n  SetColor(&c000000)\r\n  SetFont(""Typewriter"")\r\n  SetFontSize(25)\r\n  DrawText(""Hello, world!"", Width \\ 2, Height \\ 2)\r\n  \r\n  SetFont(""System"")\r\n  DrawText(&u00A9 + ""Unicode character string"", Width \\ 4, Height \\ 4)\r\n  DrawText(Chr(169) + ""ASCII character string"", Width \\ 4, Height \\ 6)\r\n  \r\n  SetColor(&c0000FF)\r\n  FillOval(0, 0, 50, 50)\r\n  \r\n  SetColor(&cFF0000)\r\n  FillRect(Width * 0.25, Height * 0.25, 50, 50)\r\n  \r\n  SetPenHeight(3)\r\n  SetPenWidth(3)\r\n  \r\n  SetColor(&c00FF00)\r\n  DrawOval(Width * 0.50, Height * 0.50, 50, 50)\r\n  \r\n  SetColor(&cFF8000)\r\n  DrawRect(Width * 0.75, Height * 0.75, 50, 50)\r\n  \r\n  DoIt(False)\r\n"
         TextColor       =   0
         TextFont        =   "System"
         TextSelectionColor=   &h000000
         TextSize        =   0
         ThickInsertionPoint=   true
         Top             =   40
         UseFocusRing    =   True
         Visible         =   True
         Width           =   533
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
   Begin Label ScriptStatus
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      Text            =   "Not Running"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   321
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   676
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

	#tag Property, Flags = &h21
		Private ErrorCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Mode As Integer
	#tag EndProperty


	#tag Constant, Name = Mode_Click, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Mode_Mouse, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Mode_Paint, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = RBDef, Type = String, Dynamic = False, Default = \"<\?xml version\x3D\"1.0\" encoding\x3D\"UTF-8\"\?>\r<highlightDefinition version\x3D\"1.2\">\r\t<name>REALbasic</name>\r\r\t<blockStartMarker indent\x3D\"1\">^\\s*(\?:if.+\?then\\s*(\?!.+\?)|for|while|select|class|module|try|catch|^\\s*(\?:protected|private)\?\\s*(\?&lt;!end)\\s*(\?:sub|function)|else)</blockStartMarker>\r\t<blockEndMarker>^\\s*(\?:end|wend|next|else|catch|elseif)(\?:\\s+|$)</blockEndMarker>\r\t\r\t<symbols>\r\t\t<symbol type\x3D\"Class\">\r\t\t\t<entryRegEx>^\\s*class\\s+\\w+\\s*</entryRegEx>\r\t\t</symbol>\r\t\t<symbol type\x3D\"Method\">\r\t\t\t<entryRegEx>^\\s*(\?:protected|private)\?\\s*(\?&lt;!end)\\s*(\?:sub|function).+\?\\([^\\)]*\\)\\s*(\?:as\\s*\\w+\\s*)\?</entryRegEx>\r\t\t</symbol>\r\t\t<symbol type\x3D\"Module\">\r\t\t\t<entryRegEx>^\\s*module\\s+\\w+\\s*</entryRegEx>\r\t\t</symbol>\t\t\r\t</symbols>\r\t\r\t<contexts defaultColor\x3D\"#0\" caseSensitive\x3D\"no\">\t\t\r        <highlightContext name\x3D\"Doubles\" highlightColor\x3D\"#006532\">\r            <entryRegEx>(\?&lt;\x3D[^\\w\\d]|^)(([0-9]+\\.[0-9]*)|([0-9]{11\x2C}))(\?\x3D[^\\w\\d]|$)</entryRegEx>\r        </highlightContext>    \t\r        \r        <highlightContext name\x3D\"Integers\" highlightColor\x3D\"#326598\">\r            <entryRegEx>(\?&lt;\x3D[^\\w\\d]|^)([0-9]{1\x2C10})(\?\x3D[^\\w\\d]|$)</entryRegEx>\r        </highlightContext>\r\r\t<highlightContext name\x3D\"PreProcessor\" highlightColor\x3D\"#0000FF\">\r            <entryRegEx>(#\\w+)</entryRegEx>\r        </highlightContext>        \r\t\t\r\t\t<highlightContext name\x3D\"Comment\" highlightColor\x3D\"#7F0000\" italic \x3D \"true\">\r\t\t\t<startRegEx>\'</startRegEx>\r\t\t\t<endRegEx>[\\n\\r]</endRegEx>\r\t\t</highlightContext>\r\t\t\r\t\t<highlightContext name\x3D\"C-Comment\" highlightColor\x3D\"#7F0000\" italic \x3D \"true\">\r\t\t\t<startRegEx>//</startRegEx>\r\t\t\t<endRegEx>[\\n\\r]</endRegEx>\r\t\t</highlightContext>\r\t\t\r\t\t<highlightContext name\x3D\"String\" highlightColor\x3D\"#6500FE\">\r\t\t\t<startRegEx>\"</startRegEx>\r\t\t\t<endRegEx>[^\"\\n\\r]*[\"\\n\\r]</endRegEx>\r\t\t</highlightContext>\r\r        <highlightContext name\x3D\"Keywords\" highlightColor\x3D\"#0000FF\" bold\x3D\"true\">\r            <keywords>\r                <string>And</string>\r                <string>Loop</string>\r                <string>Array</string>\r                <string>Me</string>\r                <string>As</string>\r                <string>Mod</string>\r                <string>Boolean</string>\r                <string>Module</string>\r                <string>ByRef</string>\r                <string>Namespace</string>\r                <string>ByVal</string>\r                <string>New</string>\r                <string>Call</string>\r                <string>Next</string>\r                <string>Case</string>\r                <string>Nil</string>\r                <string>Catch</string>\r                <string>Not</string>\r                <string>Class</string>\r                <string>Object</string>\r                <string>Color</string>\r                <string>Of</string>\r                <string>Const</string>\r                <string>Or</string>\r                <string>DebugPrint</string>\r                <string>Private</string>\r                <string>Declare</string>\r                <string>Protected</string>\r                <string>Dim</string>\r                <string>Public</string>\r                <string>Do</string>\r                <string>Raise</string>\r                <string>Double</string>\r                <string>Redim</string>\r                <string>Downto</string>\r                <string>Rem</string>\r                <string>Each</string>\r                <string>Return</string>\r                <string>Else</string>\r                <string>Return</string>\r                <string>ElseIf</string>\r                <string>Select</string>\r                <string>End</string>\r                <string>Self</string>\r                <string>Event</string>\r                <string>Shared</string>\r                <string>Exception</string>\r                <string>Single</string>\r                <string>Exit</string>\r                <string>Static</string>\r                <string>False</string>\r                <string>Step</string>\r                <string>Finally</string>\r                <string>String</string>\r                <string>For</string>\r                <string>Sub</string>\r                <string>Function</string>\r                <string>Then</string>\r                <string>GoTo</string>\r                <string>To</string>\r                <string>Handles</string>\r                <string>True</string>\r                <string>If</string>\r                <string>Try</string>\r                <string>Implements</string>\r                <string>Until</string>\r                <string>In</string>\r                <string>Wend</string>\r                <string>Inherits</string>\r                <string>While</string>\r                <string>Inline68K</string>\r                <string>#bad</string>\r                <string>Integer</string>\r                <string>#else</string>\r                <string>Interface</string>\r                <string>#endif</string>\r                <string>Isa</string>\r                <string>#if</string>\r                <string>Lib</string>\r                <string>#pragma</string>\r                <string>Assigns</string>\r                <string>Extends</string>\r                <string>Paramarray</string>\r            </keywords>\r        </highlightContext>\r\t</contexts>\r</highlightDefinition>", Scope = Private
	#tag EndConstant


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
#tag Events TabPanel1
	#tag Event
		Sub Change()
		  Select Case Me.Value
		  Case 0
		    OnPaint.Enabled = True
		    OnClick.Enabled = False
		    OnMouseMove.Enabled = False
		  Case 1
		    OnPaint.Enabled = False
		    OnClick.Enabled = True
		    OnMouseMove.Enabled = False
		  Case 2
		    OnPaint.Enabled = False
		    OnClick.Enabled = False
		    OnMouseMove.Enabled = True
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OnClick
	#tag Event
		Sub Open()
		  dim def as new HighlightDefinition
		  if def.loadFromXml(RBDef) then
		    Me.SyntaxDefinition = def
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OnMouseMove
	#tag Event
		Sub Open()
		  dim def as new HighlightDefinition
		  if def.loadFromXml(RBDef) then
		    Me.SyntaxDefinition = def
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Script
	#tag Event
		Sub CompilerError(line As Integer, errorNumber As Integer, errorMsg As String)
		  #pragma Unused errorMsg
		  ScriptStatus.Text = "Error in script on line " + Str(line) + ": (" +Str(errorNumber) + ") " + ScriptCanvas.ErrorCodeToString(ErrorNumber)
		  Select Case Mode
		  Case Mode_Paint
		    OnPaint.AddBookmark(line)
		  Case Mode_Click
		    OnClick.AddBookmark(line)
		  Case Mode_Mouse
		    OnMouseMove.AddBookmark(line)
		  End Select
		  ErrorCount = ErrorCount + 1
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
		  ScriptStatus.Text = "Error in script on line " + Str(line) + ": (" +Str(error.ErrorNumber) + ") " + error.Message
		  Select Case Mode
		  Case Mode_Paint
		    OnPaint.AddBookmark(line)
		  Case Mode_Click
		    OnClick.AddBookmark(line)
		  Case Mode_Mouse
		    OnMouseMove.AddBookmark(line)
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OnPaint
	#tag Event
		Sub Open()
		  dim def as new HighlightDefinition
		  if def.loadFromXml(RBDef) then
		    Me.SyntaxDefinition = def
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BevelButton1
	#tag Event
		Sub Action()
		  ScriptStatus.Text = ""
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
		  ErrorCount = 0
		  Script.Reset
		  Script.Context = ScriptCanvas1
		  Script.Source = OnPaint.Text
		  'MsgBox("Test OnPaint")
		  Mode = Mode_Paint
		  Script.Precompile
		  'MsgBox("Test OnPaint done")
		  
		  Script.Reset
		  Script.Source = ""
		  Script.Context = ScriptCanvas1
		  Script.Source = OnClick.Text
		  'MsgBox("Test OnClick")
		  Mode = Mode_Click
		  Script.Precompile
		  'MsgBox("Test OnClick done")
		  
		  Script.Reset
		  Script.Context = ScriptCanvas1
		  Script.Source = OnMouseMove.Text
		  'MsgBox("Test OnMouseMove")
		  Mode = Mode_Mouse
		  Script.Precompile
		  'MsgBox("Test OnMouseMove done")
		  If ErrorCount = 1 Then
		    Return
		  ElseIf ErrorCount > 1 Then
		    ScriptStatus.Text = Format(ErrorCount, "###,##0") + " errors found."
		  Else
		    ScriptStatus.Text = "Check complete, no errors."
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
