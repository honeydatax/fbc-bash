#include "dir.bi" 

dim a as string=command(1)
Sub list_files (ByRef filespec As String, ByVal attrib As Integer)
    Dim As String filename = Dir(filespec, attrib) 
    Do While Len(filename) > 0 
        Print filename
        filename = Dir()
    Loop
End Sub
a=trim(command(1))
if len(a)=0 then a="*"
list_files a, fbDirectory
list_files a, fbArchive
