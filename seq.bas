color 15,5
dim i as integer=0
dim start as integer=0
dim ends as integer=0
dim steeps as integer=1
on error goto exits

while len(command(i))<>0
	i=i+1
wend
if i=2 then ends=val(trim(command(1)))
if i=3 then 
	ends=val(trim(command(2)))
	start=val(trim(command(1)))
end if
if i=4 then 
	ends=val(trim(command(3)))
	start=val(trim(command(1)))
	steeps=val(trim(command(2)))
end if
if steeps=0 then steeps=1
for i=start to ends step steeps
	print i
next
exits:
