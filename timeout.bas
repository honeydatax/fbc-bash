#include "vbcompat.bi"
    Dim Shared s As string
    Dim Shared As Any Ptr producer_id
	Dim Shared As Any Ptr produced
	Sub producer( ByVal param As Any Ptr )
		MutexUnlock produced
		Mutexlock produced
		shell (s)
		MutexDestroy produced
		end 1
	End Sub

Dim As Integer i = 2
dim ss as string

Do
    Dim As String arg = Command(i)
    If Len(arg) = 0 Then
        Exit Do
    End If

    ss=ss+arg+" " 
    i += 1
Loop
s=ss	
    produced = MutexCreate
    If( ( produced = 0 )  ) Then
        End 1
    End If

    MutexLock produced
    producer_id = ThreadCreate(@producer)
    If( ( producer_id = 0 ) ) Then
        End 1
    End If

	ThreadWait producer_id
    Sleep val(trim(command(1)))
    MutexDestroy produced
	end 1
