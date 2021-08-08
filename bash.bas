color 15,5
#define SIGINT 2
#define SIG_IGN cptr(sighandler_t, 1)

Type sighandler_t As Sub cdecl (ByVal As Integer)

Declare Function signal cdecl alias "signal" ( ByVal signum As Integer, ByVal handler As sighandler_t ) As sighandler_t

#include "vbcompat.bi"
#include once "crt/unistd.bi"
dim shared nnames(0 to 2048) as string
dim shared vvalues(0 to 2048) as string
dim shared vars as integer
dim shared counter(0 to 2048) as integer
dim shared progr(0 to 2048) as string
dim shared c as integer
dim shared exitss as integer
dim shared pp as integer
Declare Function kills lib "sigs" alias "kills" (p as integer,sig as integer) As Integer
	Sub intercept cdecl (ByVal sig As Integer)
		Print "^c" 
	End Sub



	sub listvar()
		dim eee as integer=-1
		dim i as integer
		for i=0 to vars
				print nnames(i)+"="+vvalues(i)
		next
	end sub
	sub setvar(names as string,values as string)
		dim eee as integer=-1
		dim i as integer
		for i=0 to vars
			if names=nnames(i) then 
				eee=i
				vvalues(i)=values
				i=vars
			end if
		next
		if eee=-1 then
			nnames(vars)=names
			vvalues(vars)=values
			vars=vars+1
		end if
	end sub

	function getvars(names as string)as string
		dim retss as string=""
		dim eee as integer=-1
		dim i as integer
		for i=0 to vars
			if names=nnames(i) then 
				eee=i
				return vvalues(i)
				i=vars
			end if
		next
		return ""
	end function
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
dim ppos as integer
dim script as integer
dim cond as integer
dim files1 as integer
dim files2 as integer
If signal(SIGINT, @intercept) = SIG_IGN Then signal(SIGINT, SIG_IGN)
files1=freefile
Open Scrn For Input shared As #files1
while instr(lcase(trim(ss)),"exit")=0
	if script=0 then 
		print curdir()+" >>>>";
		line input #files1,ss
	else
		line input #files2,ss
	end if
	if instr(lcase(trim(ss)),"ps")>0 then
		print c ; " programs runing"
		for i=0 to c-1
			print trim(str(counter(i)))+"	"+progr(i)
		next
	else
		if instr(lcase(trim(ss)),"=")>0 then
				SetEnviron(ss)
				ss=trim(ss)
				sss=mid(ss,1,instr(ss,"=")-1)
				ssss=mid(ss,instr(ss,"=")+1)
				setvar sss,ssss
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
					if instr(lcase(trim(ss)),"read")>0 then
						SetEnviron(ss)
						sss=mid(ss,instr(ss," ")+1)
						line input ssss
						setvar sss,ssss
					else
						if instr(lcase(trim(ss)),"set")>0 then	
							listvar()
						else
							if instr(lcase(trim(ss)),".lst")>0 then	
								script=1
								files2=freefile
								ss=trim(ss)
								sss=mid(ss,1,instr(ss," ")-1)
								Open sss For Input shared As #files2
							else

								ss=trim(ss)
								sss=mid(ss,1,instr(ss," ")-1)
								ssss=mid(ss,instr(ss," "))
								while instr(ssss,"$")<>0
									ccc=len(ssss)
									cc=instr(ssss,"$")
									if cc>0 then ccc=instr(cc,ssss," ")
									if ccc<1 then ccc=len(ssss)
									s1=trim(mid(ssss,cc+1,ccc-(cc)))
									s1=trim(getvars(s1))
									s1=s1+" "
									if instr(s1,"$")>0 then s1=""
									if cc=1 then
										ssss=s1+mid(ssss,ccc+1)
									else
										if ccc=len(ssss) or ccc=len(ssss)-1 or ccc-1=len(ssss) then
											ssss=mid(ssss,1,cc-1)+s1
										else
											ssss=mid(ssss,1,cc-1)+s1+mid(ssss,ccc+1)
										end if
									end if
								wend
									exec(sss,ssss)
							end if	
						end if	
					end if
				end if
			end if
		end if
	end if
	if script=1 and eof(files2) then
		close files2
		script=0
	end if
wend
close
