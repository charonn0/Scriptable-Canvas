#tag Class
Protected Class HighlightDefinition
	#tag Method, Flags = &h0
		Sub addContext(context as HighlightContext)
		  if Context=nil then Return
		  subContexts.Append(Context)
		  
		  if Context <> PlaceholderContextDef then
		    context.PlaceholderContextDef = PlaceholderContextDef
		  end if
		  
		  subExpressionCount = subExpressionCount + 1
		  subExpressionIndex.Append subExpressionCount
		  
		  // add pattern to search string
		  if searchPattern <> "" then searchPattern = searchPattern + "|"
		  searchPattern = searchPattern + "(" + context.contextRegEx + ")"
		  fixSubExpressionCount(context.contextRegEx)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addSymbol(symbol as symbolsDefinition)
		  if Symbol = nil then Return
		  Symbols.Append Symbol
		  
		  symbolCount = symbolCount + 1
		  symbolIndex.Append symbolCount
		  
		  // add pattern to search string
		  if symbolPattern <> "" then symbolPattern = symbolPattern + "|"
		  symbolPattern = symbolPattern + "(" + symbol.EntryRegex + ")"
		  fixSymbolCount(symbol.EntryRegex)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function bool2YN(value as boolean) As string
		  if value then Return "yes"
		  Return "no"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  //init regex scanner
		  scanner = new regex
		  scanner.Options.DotMatchAll=true
		  
		  //add a blank space context, this will tokenize strings.
		  dim blankSpaceContext as new HighlightContext(false, false)
		  blankSpaceContext.EntryRegEx = "([ ]|\t|\x0A|(?:\x0D\x0A?))"'"([\s])"
		  blankSpaceContext.Name = "fieldwhitespace"
		  
		  addContext(blankSpaceContext)
		  blockEndDef = new Dictionary
		  blockStartDef = new Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contexts() As highlightcontext()
		  dim current, tmp() as HighlightContext
		  
		  for each current in subContexts
		    if current.Name <> "fieldwhitespace" then tmp.Append current
		  next
		  
		  Return tmp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub fixSubExpressionCount(pattern as string)
		  // determine subexpression count
		  // This method is original from Nick Lockwood: http://www.charcoaldesign.co.uk/oss#tokenizer
		  // It speeds up the matching of the matched regex.
		  dim escaped, inCharClass, prevBracket as Boolean = false
		  escaped = false
		  for i as integer = 1 to pattern.Len
		    select case pattern.mid(i,1)
		    case "\"
		      escaped = true
		      prevBracket = false
		    case "("
		      dim nextChar as String = pattern.Mid(i+1,1)
		      if not inCharClass and not escaped and nextChar <> "?" then subExpressionCount = subExpressionCount + 1
		      prevBracket = false
		      escaped = false
		    case "["
		      if inCharClass or escaped then
		        prevBracket = false
		        escaped = false
		      else
		        inCharClass = true
		        prevBracket = true
		      end
		    case "]"
		      if not prevBracket then inCharClass = false
		      prevBracket = false
		    else
		      prevBracket = false
		      escaped = false
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub fixSymbolCount(pattern as string)
		  // determine subexpression count
		  // This method is original from Nick Lockwood: http://www.charcoaldesign.co.uk/oss#tokenizer
		  // It speeds up the matching of the matched regex.
		  dim escaped, inCharClass, prevBracket as Boolean = false
		  escaped = false
		  for i as integer = 1 to pattern.Len
		    select case pattern.mid(i,1)
		    case "\"
		      escaped = true
		      prevBracket = false
		    case "("
		      dim nextChar as String = pattern.Mid(i+1,1)
		      if not inCharClass and not escaped and nextChar <> "?" then symbolCount = symbolCount + 1
		      prevBracket = false
		      escaped = false
		    case "["
		      if inCharClass or escaped then
		        prevBracket = false
		        escaped = false
		      else
		        inCharClass = true
		        prevBracket = true
		      end
		    case "]"
		      if not prevBracket then inCharClass = false
		      prevBracket = false
		    else
		      prevBracket = false
		      escaped = false
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function highlight(text as string, tokens() as textsegment, placeholders() as textplaceholder, forceMatch as highlightContext = nil) As highlightcontext
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  #pragma DisableAutoWaitCursor
		  
		  dim match as RegExMatch
		  dim subExpression as String
		  dim context as HighlightContext
		  dim startPos, startPosB as Integer
		  dim openContext as HighlightContext
		  
		  if text.Encoding <> nil and text.Encoding.Equals(Encodings.UTF16) then
		    text = text.ConvertEncoding(Encodings.UTF8)
		  end if
		  
		  if forceMatch = nil then
		    //init the regex pattern and perform the initial search
		    scanner.SearchPattern = searchPattern'syntaxRegEx
		    match=scanner.Search(Text)
		  end if
		  
		  dim charPos, charPosB as Integer
		  while forceMatch <> nil or match<>nil
		    if match = nil Then
		      subExpression = ""
		    else
		      subExpression = match.SubExpressionString(0)
		    end if
		    
		    // determine which token was matched
		    if forceMatch = nil then
		      dim tknIndex as integer
		      for i as integer = 1 to match.SubExpressionCount - 1
		        if match.SubExpressionString(i) = subExpression then
		          tknIndex = subExpressionIndex.IndexOf(i)
		          exit
		        end
		      next
		      
		      if tknIndex < 0 then //definition can't handle source!?
		        exit while
		      end if
		      
		      //find the context for the match
		      Context = subContexts(tknIndex)'findContextForMatch(subExpression)
		    else
		      Context = forceMatch
		      forceMatch = nil
		    end if
		    
		    //find the actual character position within the string, since SubExpressionStartB returns the byte position,
		    //and if you have multi-byte strings you get an offsetted highlight.
		    if match = nil then
		      charPos = 0
		    else
		      charPos = text.leftb(match.SubExpressionStartB(0)).len
		      charposB = match.SubExpressionStartB(0)
		    end if
		    
		    //Highlight everything up to this point with the default color.
		    if charPos - startPos > 0 then
		      tokens.Append(new TextSegment(startPos, charPos-startPos, TextSegment.TYPE_WORD, DefaultColor))
		    end if
		    
		    startPos = charPos
		    startPosB = charPosB
		    
		    //forward execution to the context for any further processing.
		    if Context<>nil and not context.isPlaceholder then
		      if Context.Highlight(text, subExpression, startPos, startPosB, scanner, tokens, placeholders) then openContext = Context
		      startPos = text.leftb(scanner.SearchStartPosition).len
		      startPosB = scanner.SearchStartPosition
		      
		    ElseIf Context <> nil and context.isPlaceholder then
		      dim label as String = match.SubExpressionString(match.SubExpressionCount - 1)
		      dim tmp as Integer = text.leftb(match.SubExpressionStartB(match.SubExpressionCount - 1)).len
		      dim placeholder as new TextPlaceholder(startPos, subExpression.Len, tmp, label.len, context.HighlightColor, context.BackgroundColor, context.Bold, context.Italic, context.Underline)
		      tokens.Append(placeholder)
		      placeholders.Append(placeholder)
		      
		      startPos = text.leftb(scanner.SearchStartPosition).len
		      startPosB = scanner.SearchStartPosition
		    end if
		    
		    //and search again
		    scanner.SearchPattern = searchPattern'syntaxRegEx
		    match=scanner.Search
		  wend
		  
		  //Highlight the rest of the text with the default color.
		  if text.len - startPos > 0 then
		    tokens.Append(new TextSegment(startPos, text.len - startPos, TextSegment.TYPE_WORD, DefaultColor))
		  end if
		  
		  Return openContext
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IndentNode(node As XmlNode, level As Integer, indentCloseTag As Boolean = False)
		  Dim i As Integer
		  Dim s As String
		  s = EndOfLine
		  For i = 1 To level
		    s = s + Chr(9) // Tab
		  Next
		  node.Parent.Insert(node.OwnerDocument.CreateTextNode(s), node)
		  If indentCloseTag Then
		    node.AppendChild(node.OwnerDocument.CreateTextNode(s))
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isBlockEnd(lineText as string) As boolean
		  if blockEndDef.Count = 0 then Return False
		  
		  dim scanner as new regex
		  scanner.SearchPattern = blockEndDef.Key(0)
		  
		  if scanner.Search(lineText) <> nil then Return true
		  
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isBlockStart(lineText as string) As integer
		  if blockStartDef.Count = 0 then Return 0
		  
		  dim scanner as new regex
		  scanner.SearchPattern = blockStartDef.Key(0)
		  
		  if scanner.Search(lineText) <> nil then Return blockStartDef.Value(blockStartDef.Key(0))
		  
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Keywords() As string()
		  //get all the keyword strings in this definition.
		  dim tmp() as String
		  for i as Integer = 0 to UBound(subContexts)
		    subContexts(i).ListKeywords(tmp)
		  next
		  
		  tmp.Sort
		  Return tmp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function loadFromXml(data as folderItem) As boolean
		  if data=nil then Return False
		  
		  //read a file...
		  dim tis as TextInputStream=data.OpenAsTextFile
		  if tis=nil then Return False
		  
		  dim xml as String=tis.ReadAll(Encodings.UTF8)
		  tis.Close
		  
		  Return loadFromXml(xml)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function loadFromXml(data as string) As boolean
		  dim xml as XmlDocument
		  Dim root, node as XMLNode
		  Dim context as HighlightContext
		  dim Symbol as SymbolsDefinition
		  Dim i, j as Integer
		  
		  //load a xml syntax definition.
		  try
		    xml=new XmlDocument
		    xml.LoadXml(data)
		    
		    root=xml.Child(0)
		    //doc check
		    if root.Name<>"highlightDefinition" then Return False
		    if val(root.GetAttribute("version")) > version then Return False
		    
		    for i=0 to root.ChildCount-1
		      node=root.Child(i)
		      select case node.Name
		      case "name"
		        //syntax name
		        Name=node.FirstChild.Value
		        
		      case "blockStartMarker"
		        //indent is the number of indentations.
		        blockStartDef.Value(node.FirstChild.Value) = val(node.GetAttribute("indent"))
		        
		      case "blockEndMarker"
		        blockEndDef.Value(node.FirstChild.Value) = nil
		        
		      case "symbols"
		        for j = 0 to node.ChildCount - 1
		          Symbol = new SymbolsDefinition
		          Symbol.loadFromXmlNode(node.Child(j))
		          addSymbol(Symbol)
		        next
		        
		      case "placeholders"
		        placeholderContextDef = new HighlightContext(False, False)
		        placeholderContextDef.EntryRegEx = node.FirstChild.Value
		        placeholderContextDef.isPlaceholder = true
		        placeholderContextDef.Name = "Placeholders"
		        
		        dim tmpObj as Variant
		        if node.GetAttribute("highlightColor") <> "" then
		          tmpObj = "&h" + node.GetAttribute("highlightColor").Mid(1)
		          PlaceholderContextDef.HighlightColor = tmpObj.ColorValue
		        end if
		        
		        if node.GetAttribute("backgroundColor") <> "" then
		          tmpObj = "&h" + node.GetAttribute("backgroundColor").Mid(1)
		          PlaceholderContextDef.BackgroundColor = tmpObj.ColorValue
		        end if
		        
		        dim tmp as String
		        //Bold
		        tmp = node.GetAttribute("bold")
		        if tmp <> "" then placeholderContextDef.Bold = tmp = "true"
		        
		        //Italic
		        tmp = node.GetAttribute("italic")
		        if tmp <> "" then placeholderContextDef.Italic = tmp = "true"
		        
		        //Underline
		        tmp = node.GetAttribute("underline")
		        if tmp <> "" then placeholderContextDef.Underline = tmp = "true"
		        
		        self.addContext placeholderContextDef
		        
		      case "contexts"
		        //contexts
		        dim tmpObj as Variant
		        tmpObj = "&h" + node.GetAttribute("defaultColor").Mid(1)
		        defaultColor=tmpObj.ColorValue
		        caseSensitive = YN2Bool(node.GetAttribute("caseSensitive"))
		        for j=0 to node.ChildCount-1
		          Context=new HighlightContext(caseSensitive)
		          Context.loadFromXmlNode(node.Child(j))
		          addContext(Context)
		        next
		      end select
		    Next
		    
		    Return true
		  Catch
		    Return False
		  end try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function saveAsXml(file as folderItem) As boolean
		  if file=nil then Return False
		  
		  //save definition as an xml
		  try
		    dim tos as TextOutputStream = file.CreateTextFile
		    tos.Write(toXml)
		    tos.Close
		    
		    Return true
		  catch
		    Return False
		  end try
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScanSymbols(forText as string) As dictionary
		  //symple symbol scan
		  if symbolPattern = "" then Return nil
		  
		  if forText.Encoding <> nil and forText.Encoding.Equals(Encodings.UTF16) then
		    forText = forText.ConvertEncoding(Encodings.UTF8)
		  end if
		  
		  dim scanner as new regex
		  scanner.SearchPattern = symbolPattern
		  
		  dim match as RegExMatch
		  dim symbol as String
		  dim pos as integer
		  dim local as new Dictionary
		  dim tknIndex as integer
		  dim symbolDef as SymbolsDefinition
		  
		  match = scanner.Search(forText)
		  while match <> nil
		    Symbol = match.SubExpressionString(0)
		    pos = forText.leftb(match.SubExpressionStartB(0)).len
		    
		    for i as integer = 1 to match.SubExpressionCount - 1
		      if match.SubExpressionString(i) = symbol then
		        tknIndex = symbolIndex.IndexOf(i)
		        exit
		      end
		    next
		    
		    if tknIndex < 0 then //definition can't handle source!?
		      exit while
		    end if
		    
		    symbolDef = Symbols(tknIndex)
		    
		    Symbol = Symbol.Trim //strip spaces
		    if Symbol <> "" then
		      local.Value(Symbol) = new DocumentSymbol(Symbol, pos, symbolDef.Type)
		    end if
		    
		    match = scanner.Search
		  wend
		  
		  if local.Count = 0 then Return nil
		  Return local
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SupportsCodeBlocks() As boolean
		  Return blockStartDef.Count > 0 and blockEndDef.Count > 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function syntaxRegEx() As string
		  dim tmp as String
		  dim current as HighlightContext
		  
		  //returns the regex pattern for all contexts
		  tmp="("
		  for Each current in subContexts
		    tmp=tmp+current.contextRegEx+"|"
		  next
		  tmp=Left(tmp,tmp.Len-1)+")"
		  Return tmp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toXml() As string
		  Dim xml as XmlDocument
		  Dim root, node as XMLNode
		  Dim context as HighlightContext
		  dim Symbol as SymbolsDefinition
		  
		  xml = New XmlDocument
		  //root
		  root = xml.AppendChild(xml.CreateElement("highlightDefinition"))
		  root.SetAttribute("version",format(version,"#.0"))
		  
		  //name
		  node = root.AppendChild(xml.CreateElement("name"))
		  node.AppendChild(xml.CreateTextNode(name))
		  IndentNode(node,1)
		  
		  //block markers
		  if blockStartDef.Count > 0 then
		    node = root.AppendChild(xml.CreateElement("blockStartMarker"))
		    node.AppendChild(xml.CreateTextNode(blockStartDef.Key(0)))
		    node.SetAttribute("indent", format(blockStartDef.Value(blockStartDef.Key(0)), "#"))
		    IndentNode(node,1)
		    
		    node = root.AppendChild(xml.CreateElement("blockEndMarker"))
		    node.AppendChild(xml.CreateTextNode(blockEndDef.key(0)))
		    IndentNode(node,1)
		  end if
		  
		  node = root.AppendChild(xml.CreateElement("symbols"))
		  for each Symbol in Symbols
		    Symbol.appendToXMLNode(node)
		  next
		  IndentNode(node,1, true)
		  
		  if PlaceholderContextDef <> nil then
		    node = root.AppendChild(xml.CreateElement("placeholders"))
		    dim tmpObj as Variant
		    
		    //HighlightColor
		    tmpObj = HighlightColor
		    node.SetAttribute("highlightColor","#"+Hex(tmpObj.IntegerValue))
		    
		    //BackgroundColor
		    if PlaceholderContextDef.HasBackgroundColor then
		      tmpObj = PlaceholderContextDef.BackgroundColor
		      node.SetAttribute("backgroundColor","#"+Hex(tmpObj.IntegerValue))
		    end if
		    
		    //bold
		    if PlaceholderContextDef.Bold then
		      node.SetAttribute("bold", "true")
		    end if
		    //italic
		    if PlaceholderContextDef.Italic then
		      node.SetAttribute("italic", "true")
		    end if
		    //Underline
		    if PlaceholderContextDef.Underline then
		      node.SetAttribute("underline", "true")
		    end if
		    
		    node.AppendChild(xml.CreateTextNode(PlaceholderContextDef.EntryRegEx))
		    
		    IndentNode(node,1, false)
		  end if
		  
		  node = root.AppendChild(xml.CreateElement("contexts"))
		  dim tmpObj as Variant=defaultColor
		  node.SetAttribute("defaultColor","#"+Hex(tmpObj.IntegerValue))
		  node.SetAttribute("caseSensitive",bool2YN(caseSensitive))
		  
		  //process contexts
		  for Each Context in subContexts
		    if Context.Name = "fieldwhitespace" or context.isPlaceholder then Continue for
		    
		    Context.appendToXMLNode(node)
		  next
		  
		  IndentNode(node,1, true)
		  IndentNode(root,0, true)
		  
		  Return xml.ToString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function YN2Bool(value as string) As boolean
		  if value="yes" then Return true
		  Return False
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Info
		
		HighlightDefinition
		By Alex Restrepo
		send comments, suggestions, fixes to alexrestrepo@mac.com
		
		A little experiment on SyntaxHighlighting
		Contains the rules of how to Highlight the contents of the EditField.
		A definition is composed of one or more HighlightContexts
		
		Methods:
		addContext(context as HighlightContext): adds the HighlightContext to the contexts array
		Highlight(text as string, style as styledText): highlights the provided text using the provided syledtext object.
		loadFromXml(data as string): loads a HighlightDefinition stored in a xml string
		loadFromXml(data as folderItem): loads a HighlightDefinition stored in a xml file
		saveAsXml(file as folderitem): saves the HighlightDefinition as an xml file.
		 
		Properties:
		CaseSensitive: gets or sets if the contained syntax is case-sensitive
		DefaultColor: gets or sets the default color for the text
		Name: the name of the definition (ie: Xml or REALbasic)
		
		
		Open source under the creative commons license.
		Use in whatever way you like... at your own risk :P
		let me know if you find it useful.
		If you decide to use it in your projects, please give me credit in your about window or documentation, thanks.
	#tag EndNote


	#tag Property, Flags = &h21
		Private blockEndDef As dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private blockStartDef As dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return _caseSensitive
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  _caseSensitive=value
			  scanner.Options.CaseSensitive=value
			End Set
		#tag EndSetter
		CaseSensitive As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return _defaultColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  _defaultColor=value
			End Set
		#tag EndSetter
		DefaultColor As color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return _name
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  _name=value
			End Set
		#tag EndSetter
		Name As string
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private PlaceholderContextDef As HighlightContext
	#tag EndProperty

	#tag Property, Flags = &h21
		Private scanner As regex
	#tag EndProperty

	#tag Property, Flags = &h21
		Private searchPattern As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private subContexts() As HighlightContext
	#tag EndProperty

	#tag Property, Flags = &h21
		Private subExpressionCount As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private subExpressionIndex() As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private symbolCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private symbolIndex() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private symbolPattern As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Symbols() As SymbolsDefinition
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _caseSensitive As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _defaultColor As color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private _name As string
	#tag EndProperty


	#tag Constant, Name = version, Type = Double, Dynamic = False, Default = \"1.2", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="caseSensitive"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultColor"
			Group="Behavior"
			InitialValue="&h000000"
			Type="color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass