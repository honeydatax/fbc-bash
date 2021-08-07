Dim s As String
Dim ss As String
dim lns as integer
dim llns as integer
dim llnss as integer
dim c as integer
Open Cons For input  As #1
color 15,5
lns=0
llns=val(trim(command(1)))
llnss=val(trim(command(2)))
while not(eof(1))
	Line Input #1, s
		lns=lns+1
		if lns>=llns and lns<=llns+llnss then
			print s
		end if
wend
Close #1


