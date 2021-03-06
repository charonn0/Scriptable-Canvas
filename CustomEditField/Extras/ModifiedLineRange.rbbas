#tag Class
Protected Class ModifiedLineRange
Inherits DataRange
	#tag Event
		Sub LengthChanged()
		  NeedsReset = NeedsReset + 1
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(offset as integer, length as integer)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(offset as integer, length as integer) -- From DataRange
		  // Constructor() -- From DataRange
		  Super.Constructor(offset, length)
		  mCurrentIndex = offset
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentIndex() As Integer
		  if NeedsReset > 0 then
		    mCurrentIndex = offset
		    NeedsReset = 0
		  end if
		  
		  if mCurrentIndex < 0 then Return mCurrentIndex
		  
		  dim tmp as integer = mCurrentIndex
		  mCurrentIndex = mCurrentIndex + 1
		  
		  if mCurrentIndex >= self.offset + self.length then mCurrentIndex = -1
		  Return tmp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextIndex() As Boolean
		  Return mCurrentIndex >= 0 or NeedsReset > 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OverlapsRange(selection as ModifiedLineRange) As integer
		  if self.offset = selection.offset and self.length = Selection.length then Return OVERLAP_SAME
		  
		  if selection.inRange(self.offset) and self.EndOffset = selection.EndOffset then
		    Return OVERLAP_WITHIN_AT_START
		  end if
		  
		  if self.offset = selection.offset and selection.inRange(self.EndOffset) then
		    Return OVERLAP_WITHIN_AT_END
		  end if
		  
		  if inRange(selection.offset) and not inRange(selection.EndOffset) then //head in self
		    return OVERLAP_END
		  end if
		  
		  if selection.inRange(self.offset) and not selection.inRange(self.EndOffset) then //tail of Selection is within self
		    Return OVERLAP_START
		  end if
		  
		  if selection.inRange(self.offset) and selection.inRange(self.EndOffset) then //self within selection
		    Return OVERLAP_WITHIN
		  end if
		  
		  if self.inRange(selection.offset) and self.inRange(selection.EndOffset) then
		    Return OVERLAP_CONTAINS
		  end if
		  
		  if self.offset + self.length + 1 = selection.offset then
		    Return MERGE_AT_END
		  end if
		  
		  if selection.offset + selection.length + 1 = self.offset then
		    Return MERGE_AT_START
		  end if
		  
		  Return OVERLAP_NONE
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetIndex()
		  NeedsReset = NeedsReset + 1
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCurrentIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NeedsReset As Integer
	#tag EndProperty


	#tag Constant, Name = MERGE_AT_END, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MERGE_AT_START, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_CONTAINS, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_END, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_NONE, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_SAME, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_START, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_WITHIN, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_WITHIN_AT_END, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OVERLAP_WITHIN_AT_START, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="EndOffset"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="DataRange"
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
			Name="length"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="DataRange"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="offset"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="DataRange"
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
