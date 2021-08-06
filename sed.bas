Dim s As String
Dim ss As String
dim t as integer
dim tt as integer
on error goto exits

Open cons For Input As #1
while not(eof(1))
	Line Input #1, s
	if instr(s,command(1))<1 then
		print s
	else
		while instr(s,command(1))<>0
			t=instr(s,command(1))
			tt=len(s)
			if t=1 then
				ss=command(2)+mid(s,t+len(command(1)))
			else
				if tt=len(command(1))+t then
					ss=mid(s,1,t-1)+command(2)
				else
					ss=mid(s,1,t-1)+command(2)+mid(s,t+len(command(1)))
				end if
			end if
			s=ss
		wend
		print s
	end if
wend
Close #1


exits:
