#include "vbcompat.bi"
Declare function chmod cdecl Alias "chmod" (pathname As ZString Ptr,mode as integer)as integer

on error goto exits
dim z as zstring * 2000
z=>command(2)
dim c as integer = chmod(cast(zstring ptr,varptr(z)) ,val(trim(command(1))))

exits:
