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
dim cc as integer
dim ccc as integer
dim s1 as string
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
				sss=mid(ss,1,instr(ss,"=")-1)
				print Environ(sss)
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
					ss=trim(ss)
					sss=mid(ss,1,instr(ss," ")-1)
					ssss=mid(ss,instr(ss," "))
					while instr(ssss,"$")<>0
						print ssss
						ccc=len(ssss)
						cc=instr(ssss,"$")
						if cc>0 then ccc=instr(cc,ssss," ")
						s1=mid(ssss,cc,ccc-1-cc)
						s1=Environ(s1)
						if instr(s1,"$") then s1=""
						if cc=1 then
							ssss=s1+mid(ssss,cc+1,ccc-1-cc)
						else
							if ccc=len(ssss) then
								ssss=mid(ssss,ccc-1-cc)+s1
							else
								ssss=mid(ssss,1,cc-1)+s1+mid(ssss,ccc+1)
							end if
						end if
					wend
					ss=sss
					exec(sss,ssss)
				end if
			end if
		end if
	end if
wend
close
