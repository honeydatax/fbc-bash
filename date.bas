on error goto exits
if len(trim(command(1)))=0 then
	Print Date;" ";time
else
	SetDate command(1)
	Settime command(2)
end if
exits:
