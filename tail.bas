Dim s As String
Dim ss As String
dim lns as integer
dim llns as integer
dim c as integer
Open Cons For input  As #1
color 15,5
lns=0
llns=val(trim(command(1)))
while not(eof(1))
	Line Input #1, s
		lns=lns+1
		ss=ss+s+!"\n"
		if lns>llns then
			c=instr(ss,!"\n")
			if c>0 and len(ss)>c+1 then 
				ss=mid(ss,c+1)
			end if
		end if
wend
Close #1
print ss

