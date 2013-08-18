#tag Class
Class LineHighlighter
Inherits Thread
	#tag Event
		Sub Run()
		  if owner = nil then Return
		  
		  //do some heavy processing here!! :P
		  //reprocess all changed lines...
		  while changedLines.RangeCount > 0
		    dim currentRange as ModifiedLineRange = changedLines.NextRange
		    dim highlightedLinesInRange as new Dictionary
		    dim index as Integer
		    dim highlightingScreenLines as Boolean = False
		    
		    while currentRange.NextIndex
		      while owner.VisibleLineRange.NextIndex
		        index = owner.VisibleLineRange.CurrentIndex
		        HighlightLine(index, highlightedLinesInRange)
		        highlightingScreenLines = true
		      wend
		      
		      if highlightingScreenLines then 
		        highlightingScreenLines = False
		        DoneWithScreenLines
		      end if
		      
		      index = currentRange.CurrentIndex
		      HighlightLine(index, highlightedLinesInRange)
		    wend
		    
		  wend
		  
		  HighlightingDone
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(owner as customEditField, definition as highlightdefinition, changedLines as modifiedLineRangeManager, buffer as gapBuffer, lines as linemanager)
		  self.definition = definition
		  self.changedLines = changedLines
		  self.buffer = buffer
		  self.lines = lines
		  self.Reference = new WeakRef(owner)
		  
		  self.Priority = Thread.NormalPriority
		  run
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoneWithScreenLines()
		  dim msg as new Message(self, self)
		  msg.addInfo(1, ScreenLinesHighlightedMsg)
		  MessageCenter.sendMessage(msg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HighlightingDone()
		  dim msg as new Message(self, self)
		  msg.addInfo(1, HighlightDoneMsg)
		  MessageCenter.queueMessage(msg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HighlightLine(index as integer, highlightedLinesInRange as Dictionary = nil)
		  dim line, previous, nextLine as TextLine
		  dim context, previousContext as HighlightContext
		  dim processed as Integer
		  
		  dim lineFoldingsEnabled as Boolean = owner.EnableLineFoldings
		  
		  //get line
		  line = lines.getLine(index)
		  if line = nil then return //line can be nil if no longer in document
		  if highlightedLinesInRange <> nil and highlightedLinesInRange.HasKey(index) then Return
		  
		  //get context of previous line
		  previous = lines.getLine(index - 1)
		  if previous <> nil then Context = previous.Context
		  
		  previousContext = line.Context
		  context = line.Highlight(definition, buffer, context)
		  if highlightedLinesInRange <> nil then highlightedLinesInRange.Value(index) = nil
		  
		  //restore fold markers
		  //if the line is a blockStart, or if it was and it's folded, check the fold markers
		  if lineFoldingsEnabled and (line.isBlockStart or (line.folded and not line.isBlockStart)) then
		    nextLine = lines.getLine(lines.nextBlockEndLine(index, true))
		    if nextLine <> nil and ((line.folded <> not nextLine.visible) or (line.folded and not line.isBlockStart)) then
		      //if we got to this point, is because it's a startblock in an invalid state.
		      line.isBlockStart = true
		      call lines.toggleLineFolding(index)
		    end if
		  end if
		  
		  LineHighlighted(index)
		  processed = processed + 1
		  
		  if context <> nil then
		    //scan next
		    do
		      index = index + 1
		      line = lines.getLine(index)
		      if line = nil then exit do
		      if line.Context = context then Continue
		      context = line.Highlight(definition, buffer, context)
		      processed = processed + 1
		      LineHighlighted(index)
		      if highlightedLinesInRange <> nil then highlightedLinesInRange.Value(index) = nil
		    Loop Until context = nil
		    
		    //add final line
		    line = lines.getLine(index + 1)
		    if line <> nil then
		      owner.InvalidateLine(index + 1)
		      call changedLines.AddRange(new ModifiedLineRange(index + 1, 1))//it will be highlighted in a future pass
		    end if
		    
		    //if context changed
		  elseif previousContext <> Context then
		    
		    index = index + 1
		    line = lines.getLine(index)
		    while line <> nil and line.Context = previousContext
		      if highlightedLinesInRange <> nil then highlightedLinesInRange.Value(index) = nil
		      context = line.Highlight(definition, buffer, context)
		      processed = processed + 1
		      LineHighlighted(index)
		      index = index + 1
		      line = lines.getLine(index)
		    wend
		    
		    //final line
		    if line <> nil then
		      call changedLines.AddRange(new ModifiedLineRange(index, 1))
		      owner.InvalidateLine(index)
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LineHighlighted(index as integer)
		  dim msg as new Message(self, self)
		  msg.addInfo(1, LineHighlightedMsg)
		  msg.addInfo(2, index)
		  MessageCenter.sendMessage(msg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub OldRun()
		  'if owner = nil then Return
		  '
		  ''if definition = nil then
		  ''changedLines.Clear
		  ''Return
		  ''end if
		  '
		  '//do some heavy processing here!! :P
		  'dim index as Integer
		  'dim line, previous, nextLine as TextLine
		  'dim context, previousContext as HighlightContext
		  'dim processed as Integer
		  '
		  'dim lineFoldingsEnabled as Boolean = owner.EnableLineFoldings
		  '
		  '//reprocess all changed lines...
		  'while changedLines.Count > 0
		  '
		  '//get index of line
		  'if changedLines.HasKey(owner.CaretLine) then
		  'index = owner.CaretLine
		  'else
		  'index = changedLines.Key(0)
		  'end if
		  '
		  'changedLines.Remove(index)
		  '
		  '//get line
		  'line = lines.getLine(index)
		  'if line = nil then Continue while //line can be nil if no longer in document
		  '
		  '//get context of previous line
		  'previous = lines.getLine(index - 1)
		  'if previous <> nil then Context = previous.Context
		  '
		  'previousContext = line.Context
		  'context = line.Highlight(definition, buffer, context)
		  '
		  '//restore fold markers
		  '//if the line is a blockStart, or if it was and it's folded, check the fold markers
		  'if lineFoldingsEnabled and (line.isBlockStart or (line.folded and not line.isBlockStart)) then
		  'nextLine = lines.getLine(lines.nextBlockEndLine(index, true))
		  'if nextLine <> nil and ((line.folded <> not nextLine.visible) or (line.folded and not line.isBlockStart)) then
		  '//if we got to this point, is because it's a startblock in an invalid state.
		  'line.isBlockStart = true
		  'call lines.toggleLineFolding(index)
		  'end if
		  'end if
		  '
		  ''owner.InvalidateLine(index)
		  'LineHighlighted(index)
		  'processed = processed + 1
		  '
		  'if context <> nil then
		  '//scan next
		  'do
		  'index = index + 1
		  'line = lines.getLine(index)
		  'if line = nil then exit do
		  'if line.Context = context then Continue
		  'context = line.Highlight(definition, buffer, context)
		  'processed = processed + 1
		  ''owner.InvalidateLine(index)
		  'LineHighlighted(index)
		  'if changedLines.HasKey(index) then changedLines.Remove(index)
		  'Loop Until context = nil
		  '
		  '//add final line
		  'line = lines.getLine(index + 1)
		  'if line <> nil then
		  'owner.InvalidateLine(index + 1)
		  ''LineHighlighted(index + 1)
		  'changedLines.Value(index + 1) = true //it will be highlighted in a future pass
		  'end if
		  '
		  '//if context changed
		  'elseif previousContext <> Context then
		  '
		  'index = index + 1
		  'line = lines.getLine(index)
		  'while line <> nil and line.Context = previousContext
		  'if changedLines.HasKey(index) then changedLines.Remove(index)
		  'context = line.Highlight(definition, buffer, context)
		  'processed = processed + 1
		  ''owner.InvalidateLine(index)
		  'LineHighlighted(index)
		  'index = index + 1
		  'line = lines.getLine(index)
		  'wend
		  '
		  '//final line
		  'if line <> nil then
		  'changedLines.Value(index) = true
		  'owner.InvalidateLine(index)
		  ''LineHighlighted(index)
		  'end if
		  '
		  'end if
		  'wend
		  '
		  'HighlightingDone
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected buffer As gapBuffer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected changedLines As ModifiedLineRangeManager
	#tag EndProperty

	#tag Property, Flags = &h0
		definition As highlightdefinition
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lines As linemanager
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  if me.Reference <> nil then
			    return CustomEditField(me.Reference.Value)
			  else
			    //stop thread, since the owner is no longer valid
			    self.Kill
			    return nil
			  end if
			End Get
		#tag EndGetter
		Private owner As CustomEditField
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Reference As weakRef
	#tag EndProperty


	#tag Constant, Name = HighlightDoneMsg, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = LineHighlightedMsg, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ScreenLinesHighlightedMsg, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass