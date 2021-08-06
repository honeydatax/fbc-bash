Dim s As String

Open command(1) For Input As #1
while not(eof(1))
	Line Input #1, s
	#ifdef __FB_UNIX__
		print s+!"\n"
	#else
		#ifdef __FB_DOS__
		print s+!"\r\n"
		#elseif
		print s+!"\r"
		#endif
	#endif
wend
Close #1


