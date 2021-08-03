public const ins=0
public const outs=1
Declare Function wiringpisetup cdecl lib "wiringPi" Alias "wiringPiSetup"  () As integer
Declare sub pinmode cdecl lib "wiringPi" Alias "pinMode"  (n as integer,mode as integer )
Declare function digitalRead cdecl lib "wiringPi" Alias "digitalRead"  (n as integer)as integer
Declare sub digitalWrite cdecl lib "wiringPi" Alias "digitalWrite"  (n as integer,value as integer)

dim m as integer=0
on error goto exits
if wiringpisetup()=-1 then system()
if lcase(trim(command(3)))="output" then m=1
if lcase(trim(command(1)))="mode" then pinmode val(trim(command(2))),m
if lcase(trim(command(1)))="read" then 
	print digitalRead (val(trim(command(2))))
end if
if lcase(trim(command(1)))="write" then digitalWrite val(trim(command(2))),val(trim(command(3)))

exits:
