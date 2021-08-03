#include once "crt/unistd.bi"
dim shared pp as integer
Declare Function kills lib "sigs" alias "kills" (p as integer,sig as integer) As Integer


	Sub producer(s as string,p as integer)
		pp=p
		shell (s)
		end 1
	End Sub

Dim As Integer i = 2
dim ss as string
dim process as integer

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
    Sleep val(trim(command(1)))
	kills (pp,2)
	end 1
