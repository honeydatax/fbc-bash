color 15,5
dim i as integer=0
dim starts as integer=0
dim ends as integer=0
dim steeps as double=0
dim last as double=0
on error goto exits

while len(command(i))<>0
	i=i+1
wend
ends=i
starts=0
steeps=val(trim(command(1)))
last=0
for i=2 to ends-1
	if asc(trim(command(i)))=asc("+") or asc(trim(command(i)))=asc("-") or asc(trim(command(i)))=asc("x") or asc(trim(command(i)))=asc(":") then
		if asc(trim(command(i)))=asc("+") then starts=0
		if asc(trim(command(i)))=asc("-") then starts=1
		if asc(trim(command(i)))=asc("x") then starts=2
		if asc(trim(command(i)))=asc(":") then starts=3
	else
		if starts=0 then steeps=steeps+val(trim(command(i)))
		if starts=1 then steeps=steeps-val(trim(command(i)))
		if starts=2 then steeps=steeps*val(trim(command(i)))
		if starts=3 then steeps=steeps/val(trim(command(i)))
	end if
next
print steeps
exits:
