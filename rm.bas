#include "file.bi"
Dim filename As String = command(1)
Dim result As Integer = Kill( filename )
If result <> 0 Then Print "error trying to kill " ; filename ; " !"

