Dim pathname As String = command(1)
Dim result As Integer = RmDir( pathname )

If 0 <> result Then Print "error: unable to remove folder " & pathname & " in the current path."
