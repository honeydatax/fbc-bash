Dim s As String

Open Cons For input  As #1
while not(eof(1))
	Line Input #1, s
	if instr(s,command(1))>0 then print s
wend
Close #1


