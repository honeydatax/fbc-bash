dim s as string
while instr(lcase(s),"exit")=0
	print ">>>";
	line input s
	shell s
wend
