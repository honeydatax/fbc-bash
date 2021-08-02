Dim s As String
Dim ss As String
dim t as integer
dim tt as integer
on error goto exits

Open command(1) For Input As #1
while not(eof(1))
	Line Input #1, s
	if instr(s,command(2))<1 then
		print s
	else
		while instr(s,command(2))<>0
			t=instr(s,command(2))
			tt=len(s)
			if t=1 then
				ss=command(3)+mid(s,t+len(command(2)))
			else
				if tt=len(command(2))+t then
					ss=mid(s,1,t-1)+command(3)
				else
					ss=mid(s,1,t-1)+command(3)+mid(s,t+len(command(2)))
				end if
			end if
			s=ss
		wend
		print s
	end if
wend
Close #1


exits:
