Dim s As String
dim lns as integer
Open Cons For input  As #1
color 15,5
lns=0
while not(eof(1))
	Line Input #1, s
		lns=lns+1
		if lns<=val(trim(command(1))) then print s
wend
Close #1


