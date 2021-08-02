#include "dir.bi" 
#include "vbcompat.bi"
dim a as string

Sub list_files (ByRef filespec As String, ByVal attrib As Integer,i as integer)
	dim d as double
    Dim As String filename = Dir(filespec, attrib) 
    Do While Len(filename) > 0 
        Print filename,
        d = FileDateTime( filename )
        Print Format( d, "yyyy-mm-dd hh:mm AM/PM" ),
        if i=0 then
			print
        else
			open filename for binary as 1
				Print lof(1)
			close 1
		end if
        filename = Dir() 
    Loop
End Sub
a=command(1)
if len(a)=0 then a="*"
list_files a, fbDirectory,0
list_files a, fbArchive,1

