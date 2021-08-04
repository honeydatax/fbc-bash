color 15,5
#include "vbcompat.bi"
#include once "crt/unistd.bi"
dim shared exitss as integer
dim shared pp as integer
Declare Function kills lib "sigs" alias "kills" (p as integer,sig as integer) As Integer


	Sub producer(s as string,p as integer)
		pp=p
		shell (s)
		exitss=1
		system()
	End Sub

Dim As Integer i = 2
dim ss as string
dim process as integer
dim d1 as double
dim d2 as double
  d1 = Now()
Do
    Dim As String arg = Command(i)
    If Len(arg) = 0 Then
        Exit Do
    End If

    ss=ss+arg+" " 
    i += 1
Loop

	process=fork()
	if process<>0 then producer(ss,process)
    while DateDiff( "s", d1, d2 )<val(trim(command(1)))
		if exitss=1 then system()
		d2 = Now()
    wend
	kills (pp,2)
	system()
