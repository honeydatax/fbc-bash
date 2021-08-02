Dim OldName As String
Dim NewName As String
Dim result As Integer 

OldName = command(1)
NewName = command(2)

result = Name( OldName, NewName )
If 0 <> result Then 
    Print "error renaming " & oldname & " to " & newname & "."
End If
