Private Sub Application_NewMailEx(ByVal EntryIDCollection As String)
    Const Con_Keyword_01 = "�yCloud Automator�z�W���u���s����:���s"
    Const Con_Keyword_02 = "B183BCZCloudAutomator"
    Dim objMsg
    ' ��M���b�Z�[�W�̎擾
    Set objMsg = Session.GetItemFromID(EntryIDCollection)
    ' �����Ώۃ��b�Z�[�W�̔���
    If InStr(objMsg.Subject, Con_Keywork_01) > 0 Then
        If InStr(objMsg.Body, Con_Keyword_02) > 0 Then
            '�d�b��������
            callPowershell ("c:\temp\twilio\twilio_call.ps1")
        End If
    End If
    
End Sub
Public Function callPowershell(ByVal cmdStr As String)
'@@powershell�R�}���h�����s
    Dim Wsh
    Set Wsh = CreateObject("Wscript.shell")
    Wsh.Run "powershell -ExecutionPolicy RemoteSigned -Command " & cmdStr, 0
End Function
