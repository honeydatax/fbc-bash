color 15,5
#include "vbcompat.bi"

Dim s As String
Dim As Integer i = 2
dim ss as string
  

Do
    Dim As String arg = Command(i)
    If Len(arg) = 0 Then
        Exit Do
    End If

    ss=ss+arg+" " 
    i += 1
Loop
	
  shell(ss+" &")
  sleep val(trim(command(1)))

