Dim As Integer i = 1
color 15,5
Do
    Dim As String arg = Command(i)
    If Len(arg) = 0 Then
        Exit Do
    End If

    Print arg+" ";
    i += 1
Loop
Print
