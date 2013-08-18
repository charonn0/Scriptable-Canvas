#tag Class
Protected Class UndoManager
	#tag Method, Flags = &h1
		Protected Sub addActionToRedoStack(action as undoableAction)
		  RedoStack.Append action
		  UndoValue = UndoValue - 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub addActionToUndoStack(action as undoableAction)
		  UndoStack.Append action
		  UndoValue = UndoValue + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isDirty() As boolean
		  Return UndoValue <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isUndoing() As boolean
		  Return undoing
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Push(action as undoableAction)
		  if undoing then Return
		  if action = nil then Return
		  addActionToUndoStack(action)
		  
		  redim RedoStack(-1)
		  EnableMenuItems
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redo()
		  if not CanRedo then Return
		  dim ID as Integer = RedoStack(UBound(RedoStack)).EventID
		  redo(ID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redo(id as integer)
		  if not CanRedo then Return
		  
		  undoing = true
		  dim match as Boolean
		  
		  if id = RedoStack(UBound(RedoStack)).EventID then
		    dim action as UndoableAction = RedoStack.Pop
		    addActionToUndoStack(action)
		    
		    action.Redo
		    match = true
		  end if
		  
		  undoing = False
		  if id <> 0 and CanRedo and match then Redo(ID)
		  
		  EnableMenuItems
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  ReDim UndoStack(-1)
		  ReDim RedoStack(-1)
		  UndoValue = 0
		  undoing = False
		  EnableMenuItems
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetDirtyFlag()
		  UndoValue = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Undo()
		  if not CanUndo then Return
		  dim ID as Integer = UndoStack(UBound(UndoStack)).EventID
		  Undo(ID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Undo(ID as integer)
		  if not CanUndo then Return
		  
		  undoing = true
		  dim match as Boolean
		  
		  if id = UndoStack(UBound(UndoStack)).EventID then
		    dim action as UndoableAction = UndoStack.Pop
		    addActionToRedoStack(action)
		    
		    action.Undo
		    match = true
		  end if
		  
		  undoing = False
		  if id <> 0 and CanUndo and match then undo(ID)
		  
		  EnableMenuItems
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return UBound(RedoStack) > -1
			End Get
		#tag EndGetter
		CanRedo As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return UBound(UndoStack) > -1
			End Get
		#tag EndGetter
		CanUndo As boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected RedoStack() As undoableAction
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected undoing As boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected UndoStack() As undoableAction
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected UndoValue As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="CanRedo"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanUndo"
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
		#tag EndViewProperty
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