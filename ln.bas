Dim s As String
dim lns as integer
Open Cons For input  As #1
lns=0
while not(eof(1))
	Line Input #1, s
		lns=lns+1
		print trim(str(lns))+"		"+ s
wend
Close #1


