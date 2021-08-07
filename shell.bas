color 15,5
#include "vbcompat.bi"
#include once "crt/unistd.bi"
dim shared exitss as integer
dim shared pp as integer
Declare Function kills lib "sigs" alias "kills" (p as integer,sig as integer) As Integer


	Sub producer(s as string,p as integer)
		pp=p
		print pp 
		print "	"+s
		shell (s)
		exitss=1
		system()
	End Sub

Dim As Integer i = 2
dim ss as string
dim process as integer
dim d1 as integer
dim d2 as integer
open cons for input as 1
while not(eof(1))
	line input #1,ss
	d1=instr(ss,"&")
	if d1> 0 then 
		ss=mid(ss,1,d1-1)
		process=fork()
		if process<>0 then producer(ss,process)
	else
		shell (ss)
	end if

wend


