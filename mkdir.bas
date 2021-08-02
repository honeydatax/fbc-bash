Dim pathname As String = command(1)
Dim result As Integer = MkDir( pathname )

If 0 <> result Then Print "error: unable to create folder " & pathname & " in the current path."
