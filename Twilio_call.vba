Private Sub Application_NewMailEx(ByVal EntryIDCollection As String)
    Const Con_Keyword_01 = "【Cloud Automator】ジョブ実行結果:失敗"
    Const Con_Keyword_02 = "B183BCZCloudAutomator"
    Dim objMsg
    ' 受信メッセージの取得
    Set objMsg = Session.GetItemFromID(EntryIDCollection)
    ' 処理対象メッセージの判定
    If InStr(objMsg.Subject, Con_Keywork_01) > 0 Then
        If InStr(objMsg.Body, Con_Keyword_02) > 0 Then
            '電話をかける
            callPowershell ("c:\temp\twilio\twilio_call.ps1")
        End If
    End If
    
End Sub
Public Function callPowershell(ByVal cmdStr As String)
'@@powershellコマンドを実行
    Dim Wsh
    Set Wsh = CreateObject("Wscript.shell")
    Wsh.Run "powershell -ExecutionPolicy RemoteSigned -Command " & cmdStr, 0
End Function
