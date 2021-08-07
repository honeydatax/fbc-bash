color 15,5
#include "vbcompat.bi"
#include once "crt/unistd.bi"
dim shared counter(0 to 2048) as integer
dim shared progr(0 to 2048) as string
dim shared c as integer
dim shared exitss as integer
dim shared pp as integer
Declare Function kills lib "sigs" alias "kills" (p as integer,sig as integer) As Integer


	Sub producer(s as string,p as integer)
	dim fff as integer= freefile
		counter(c)=p
		progr(c)=s
		c=c+1
		pp=p
		print pp ;
		print "	"+s
	Open Pipe s For Input As #fff
	Dim As String ln
		Do Until EOF(fff)
			Line Input #fff, ln
			Print ln
		Loop

		Close #fff
		system()
	End Sub

Dim As Integer i = 2
dim ss as string
dim sss as string
dim ssss as string
dim process as integer
dim d1 as integer
dim d2 as integer
Open Scrn For Input shared As #1
while instr(lcase(trim(ss)),"exit")=0
	print curdir()+" >>>>";
	line input #1,ss
	if instr(lcase(trim(ss)),"ps")>0 then
		print c ; " programs runing"
		for i=0 to c-1
			print trim(str(counter(i)))+"	"+progr(i)
		next
	else
		if instr(lcase(trim(ss)),"=")>0 then
				SetEnviron(ss)
				print "set "+ss
		else
			if instr(lcase(trim(ss)),"cd")>0 then
				d1=instr(lcase(trim(ss))," ")
				if d1>0 and d1<len(ss)then
					ChDir(mid(ss,d1+1))
				end if
			else
				d1=instr(ss,"&")
				if d1> 0 then 
					ss=mid(ss,1,d1-1)
					process=fork()
					if process<>0 then producer(ss,process)
				else
					shell (ss)
				end if
			end if
		end if
	end if
wend
close
