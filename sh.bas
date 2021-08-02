Dim s As String

Open command(1) For Input As #1
while not(eof(1))
	Line Input #1, s
	shell(s)
wend
Close #1


