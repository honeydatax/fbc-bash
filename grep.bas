Dim s As String

Open command(1) For Input As #1
while not(eof(1))
	Line Input #1, s
	if instr(s,command(2))>0 then print s
wend
Close #1


