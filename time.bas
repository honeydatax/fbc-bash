color 15,5
#include "vbcompat.bi"

Dim s As String, d1 As Double, d2 As Double
Dim As Integer i = 1
dim ss as string
  d1 = Now()

Do
    Dim As String arg = Command(i)
    If Len(arg) = 0 Then
        Exit Do
    End If

    ss=ss+arg+" " 
    i += 1
Loop
	
  shell(ss)
  d2 = Now()


  Print " " & DateDiff( "yyyy", d1, d2 ) & " years past."
  Print " " & DateDiff( "d", d1, d2 ) & " days past."
  Print " " & DateDiff( "s", d1, d2 ) & " seconds past."


