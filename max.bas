dim a as double
dim b as double
a=val(trim(command(1)))
b=val(trim(command(2)))
if a>b then
	print trim(str(a))
else
	print trim(str(b))
end if
