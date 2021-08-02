Dim As Integer i = 1
Dim As string ax = ""
Dim As string ex = ""
Dim As Integer bx = 1
Dim As Integer cx = 1
Dim As Integer dx = 1
Dim As Integer fx = 1
color 15,5
on error goto exits
ax=Command(1)
Do
    If Len(ax) = 0 Then
        Exit Do
    End If
	bx=instr(ax,"\")
	cx=instr(ax,"%")
	if bx=0 and cx=0 then 
		print mid(ax,1,cx-1);
		Exit Do
	end if
	if bx=0 then bx=cx
	if cx<=bx then 
		if cx<1 then 
			Print ax+" ";
			Exit Do
		else
			i=i+1
			print mid(ax,1,cx-1);command(i);
			fx=len(ax)
			if fx<cx+2 then
				cx=fx
			else
				cx=cx+2
			end if
			ax=mid(ax,cx)
		end if
		
	else	
			if bx<1 then 
				Print ax+" ";
				Exit Do
			else

				print mid(ax,1,bx-1);
				ex=mid(ax,bx+1,1)
				if ex="n" or ex="r" then print
				if ex="t" then print "	";
				if ex="0" then print "\0";
				fx=len(ax)
				if fx<cx+2 then
					cx=fx
				else
					cx=cx+2
				end if
				ax=mid(ax,cx+2)
			end if
    end if
Loop

exits:
