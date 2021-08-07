Dim s As String
dim m as integer
dim n as integer
dim c as integer
dim c1 as integer
dim i as integer
dim cc as string
dim cx as integer
dim count as integer
Open Cons For input  As #1
while not(eof(1))
	Line Input #1, s
	m=1
		while len(command(m))<>0
					m=m+1
		wend
		for n=1 to m-1
			c=1
			c1=0
			cc=s
			cx=1
				for i=0 to val(trim(command(n)))-1
					if val(trim(command(n))) = 0 then  
						cx=len(cc)
						cc=ltrim(cc)
						cx=cx-(len(cc))
						c=1
					else
						c=instr(cc," ")
						if c<> 0 then cc=mid(cc,c)
						if c=0 then exit for
						cx=len(cc)
						cc=ltrim(cc)
						cx=cx-(len(cc))
					end if
				next
			c1=0
			if c<>0 then c1=instr(cc," ")
			if c1=0 then c1=len(cc)-1
			if c<>0 then print space(cx)+mid(cc,1,c1);
		next 
		print
wend
Close #1


