#include "vbcompat.bi"
color 15,5
Function LoadFile(ByRef filename As String) As String
    
    Dim h As Integer
    Dim txt As String
    
    h = FreeFile
    
    If Open( filename For Binary Access Read As #h ) <> 0 Then Return ""
    
    If LOF(h) > 0 Then
        
        txt = String(LOF(h), 0)
        If Get( #h, ,txt ) <> 0 Then txt = ""
        
    End If
    
    Close #h
    
    Return txt
    
End Function

Dim ExampleStr As String
ExampleStr = LoadFile(command(1))
Print ExampleStr

