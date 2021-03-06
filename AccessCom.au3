;AccessCOM.au3 0_28
Global $oMyError = ObjEvent("AutoIt.Error", "MyErrFunc")
#region Main
#include-once
#include <Misc.au3>
#include <File.au3>
#include <Date.au3>
#include <GuiConstants.au3>
#include <GuiListView.au3>
Global $formatT = "Text(50)", $formatD = "Date", $data2 = @MON & "/" & @MDAY & "/" & StringRight(@YEAR, 2)
;global 	$hndListView_Array1Box_Display = GUICtrlCreateListView($sTemp, 0, 16, $Width, $Height - 40, $LVS_SHOWSELALWAYS, BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
#endregion Main
Func _CreateDB($s_dbname, $USRName = "", $PWD = "")
	$newMdb = ObjCreate("ADOX.Catalog");
	$newMdb.Create ("Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" & $s_dbname & ';')
;~ 	$newMdb.Create ("Provider=Microsoft.Jet.OLEDB.4.0; Data Source="&$s_dbname&';UID=' & $USRName & ';PWD=' & $PWD)
;~ 	$newMdb.Create ("Driver={Microsoft Access Driver (*.mdb)};Dbq="&$s_dbname&';UID=' & $USRName & ';PWD=' & $PWD)
	$newmdb.ActiveConnection.Close
	;$newmdb.Close
EndFunc   ;==>_CreateDB
Func _ExecuteMDB($s_dbname, $addConn, $sQuery, $i_adoMDB = 1, $USRName = "", $PWD = "")
	If Not IsObj($addConn) Then
		_AccessConnectConn($s_dbname, $addConn, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 1
	Else
		$i_NeedToCloseInFunc = 0
	EndIf
	Return $addConn.execute ($sQuery)
EndFunc   ;==>_ExecuteMDB
Func _CopyTableToDB($s_dbname, $s_Tablename, $sNewDB, ByRef $addConn, ByRef $addConn2, $i_adoMDB = 1, $USRName = "", $PWD = "");(byref $sDB1, $sDbTable1, $sNewTable,$i_Execute=1)
	If Not IsObj($addConn) Then
		_AccessConnectConn($s_dbname, $addConn, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 1
	Else
		$i_NeedToCloseInFunc = 0
	EndIf
	If Not IsObj($addConn2) Then
		_AccessConnectConn($sNewDB, $addConn2, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 2
	Else
		$i_NeedToCloseInFunc = 3
	EndIf
	If _TableExists($addConn2, $sNewDB, $s_Tablename) Then _DropTable($sNewDB, $s_Tablename, $addConn2)
	_AccessCloseConn($addConn2)
	;COPY========================================================
	$queryCommand = "SELECT * INTO " & $s_Tablename & " IN '" & $sNewDB & "' FROM " & $s_Tablename;&" IN '" & $s_dbname &"'"
	$addConn.Execute ($queryCommand)
	;CRHANGE2========================================================
	_AccessConnectConn($sNewDB, $addConn2, 0)
	If $i_NeedToCloseInFunc = 1 Then $addConn.Close
	If $i_NeedToCloseInFunc = 2 Then $addConn2.Close
EndFunc   ;==>_CopyTableToDB
Func _CopyTableInDB($s_dbname, $s_Tablename, $sNewTable, ByRef $addConn, $i_adoMDB = 1, $USRName = "", $PWD = "");(byref $sDB1, $sDbTable1, $sNewTable,$i_Execute=1)
	If Not IsObj($addConn) Then
		_AccessConnectConn($s_dbname, $addConn, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 1
	Else
		$i_NeedToCloseInFunc = 0
	EndIf
	If _TableExists($addConn, $s_dbname, $sNewTable) Then _DropTable($s_dbname, $sNewTable, $addConn)
	;COPY========================================================
	$queryCommand = "SELECT * INTO " & $sNewTable & " IN '" & $s_dbname & "' FROM " & $s_Tablename;&" IN '" & $s_dbname &"'"
	$addConn.Execute ($queryCommand)
	;CRHANGE2========================================================
	If $i_NeedToCloseInFunc Then $addConn.Close
EndFunc   ;==>_CopyTableInDB
Func _FieldNames($s_dbname, $s_Tablename, ByRef $o_adoCon, $i_adoMDB = 1, $USRName = "", $PWD = "")
	If Not IsObj($o_adoCon) Then
		_AccessConnectConn($s_dbname, $o_adoCon, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 1
	Else
		$i_NeedToCloseInFunc = 0
	EndIf
	$o_adoRs = ObjCreate("ADODB.Recordset")
	$o_adoRs.Open ("SELECT * FROM " & $s_Tablename, $o_adoCon)
	$name = ""
	For $i = 1 To $o_adoRs.Fields.Count
		$name = $name & $o_adoRs.Fields ($i - 1).Name & "|"
	Next
	$o_adoRs.Close
	If $i_NeedToCloseInFunc Then $o_adoCon.Close
	Return StringTrimRight($name, 1)
EndFunc   ;==>_FieldNames
Func _GetFieldNames($s_dbname, $s_Tablename, ByRef $o_adoCon, $i_adoMDB = 1, $USRName = "", $PWD = "")
	If Not IsObj($o_adoCon) Then
		_AccessConnectConn($s_dbname, $o_adoCon, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 1
	Else
		$i_NeedToCloseInFunc = 0
	EndIf
	Dim $ret[1]
	$o_adoRs = ObjCreate("ADODB.Recordset")
	$o_adoRs.Open ("SELECT * FROM " & $s_Tablename, $o_adoCon)
	$name = ""
	For $i = 1 To $o_adoRs.Fields.Count
		;$name = $name & $o_adoRs.Fields ($i - 1).Name & @CRLF
		ReDim $ret[UBound($ret, 1) + 1]
		$ret[UBound($ret, 1) - 1] = $o_adoRs.Fields ($i - 1).Name
	Next
	$o_adoRs.Close
	If $i_NeedToCloseInFunc Then $o_adoCon.Close
	Return $ret
EndFunc   ;==>_GetFieldNames
Func _TableExists(ByRef $connectionobj, $s_dbname, $s_Table, $i_adoMDB = 1, $USRName = "", $PWD = "")
	Local $i_Exists
	$ar_GetTables = _GetTableNames($connectionobj, $s_dbname, $i_adoMDB, $USRName, $PWD)
	;_ArrayDisplay($ar_GetTables,"")
	For $table In $ar_GetTables
		If $table = $s_Table Then $i_Exists = 1
	Next
	;MsgBox(0,"",$i_Exists)
	Return $i_Exists
EndFunc   ;==>_TableExists
Func _FieldExists(ByRef $connectionobj, $s_Tablename, $s_Fieldname, $i_adoMDB = 1, $USRName = "", $PWD = "")
	Local $i_Exists
	$ar_GetFields = _GetFieldNames($connectionobj, $s_Tablename, $i_adoMDB, $USRName, $PWD)
	For $field In $ar_GetFields
		If $field = $s_Fieldname Then $i_Exists = 1
	Next
	Return $i_Exists
EndFunc   ;==>_FieldExists
Func _GetTableNames(ByRef $connectionobj, $s_dbname, $i_adoMDB = 1, $USRName = "", $PWD = "")
	Dim $ret[1]
	If IsObj($connectionobj) Then
		$adoxConn = ObjCreate("ADOX.Catalog")
		$adoxConn.activeConnection = $connectionobj
		For $table In $adoxConn.tables
			If $table.type = "TABLE" Then
				ReDim $ret[UBound($ret, 1) + 1]
				$ret[UBound($ret, 1) - 1] = $table.name
			EndIf
		Next
		;$adoxConn.activeConnection.close
		;$adoxConn = ""
		;if not isobj($connectionobj)  then
		;$connectionobj=_AccessConnectConn($s_dbname, $connectionobj,$i_adoMDB,$USRName,$PWD)
		;EndIf
	EndIf
	Return $ret
EndFunc   ;==>_GetTableNames
Func _CreateTable($s_dbname, $s_Tablename, ByRef $addConn, $i_adoMDB = 1, $USRName = "", $PWD = "")
	If Not IsObj($addConn) Then
		_AccessConnectConn($s_dbname, $addConn, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 1
	Else
		$i_NeedToCloseInFunc = 0
	EndIf
	$addConn.Execute ("CREATE TABLE " & $s_Tablename)
	If $i_NeedToCloseInFunc Then $addConn.Close
EndFunc   ;==>_CreateTable
Func _DropTable($s_dbname, $s_Tablename, ByRef $addConn, $i_adoMDB = 1, $USRName = "", $PWD = "")
	If Not IsObj($addConn) Then
		_AccessConnectConn($s_dbname, $addConn, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 1
	Else
		$i_NeedToCloseInFunc = 0
	EndIf
	$addConn.Execute ("DROP TABLE " & $s_Tablename)
	If $i_NeedToCloseInFunc Then $addConn.Close
EndFunc   ;==>_DropTable
Func _CreateField($s_dbname, $s_Tablename, $s_Fieldname, $format, ByRef $addField, $i_adoMDB = 1, $USRName = "", $PWD = "")
	If Not IsObj($addField) Then
		_AccessConnectConn($s_dbname, $addField, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 1
	Else
		$i_NeedToCloseInFunc = 0
	EndIf
	;if not _FieldExists($addField, $s_Tablename, $s_Fieldname) then
	$addField.Execute ("ALTER TABLE " & $s_Tablename & " ADD " & $s_Fieldname & " " & $format)
	If $i_NeedToCloseInFunc Then $addField.Close
EndFunc   ;==>_CreateField
Func _AddData($s_dbname, $s_Tablename, $s_Fieldname, $s_i_value, ByRef $o_adoCon, $i_adoMDB = 1, $USRName = "", $PWD = "")
	If Not IsObj($o_adoCon) Then
		_AccessConnectConn($s_dbname, $o_adoCon, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 1
	Else
		$i_NeedToCloseInFunc = 0
	EndIf
	$o_adoRs = ObjCreate("ADODB.Recordset")
	$o_adoRs.CursorType = 1
	$o_adoRs.LockType = 3
	$o_adoRs.Open ("SELECT * FROM " & $s_Tablename, $o_adoCon)
;~ 	MsgBox(0, "_AddData", "$o_adoRs.Recordcount=" & $o_adoRs.RecordCount+1)
	$o_adoRs.AddNew
;~ 	$o_adoRs.Fields ("ROWID").Value = $o_adoRs.RecordCount+1
	$o_adoRs.Fields ($s_Fieldname).Value = $s_i_value
	$o_adoRs.Update
	$o_adoRs.Close
	If $i_NeedToCloseInFunc Then $o_adoCon.Close
EndFunc   ;==>_AddData
Func _ReadOneField($q_sql, $s_dbname, $s_field, ByRef $o_adoCon, $i_adoMDB = 1, $USRName = "", $PWD = "")
	Local $_output
	If Not IsObj($o_adoCon) Then
		_AccessConnectConn($s_dbname, $o_adoCon, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 1
	Else
		$i_NeedToCloseInFunc = 0
	EndIf
	$o_adoRs = ObjCreate("ADODB.Recordset")
	$o_adoRs.CursorType = 1
	$o_adoRs.LockType = 3
	$o_adoRs.Open ($q_sql, $o_adoCon)
	With $o_adoRs
		If .RecordCount Then
			While Not .EOF
				$_output = $_output & .Fields ($s_field).Value & @CRLF
				.MoveNext
			WEnd
		EndIf
	EndWith
	$o_adoRs.Close
	If $i_NeedToCloseInFunc Then $o_adoCon.Close
	Return $_output
EndFunc   ;==>_ReadOneField
Func _AddEntireRecord($s_dbname, $s_Tablename1, $ar_array, ByRef $o_adoCon, $ar_FieldFormatsF = "", $i_adoMDB = 1, $USRName = "", $PWD = "")
	If Not IsObj($o_adoCon) Then
		_AccessConnectConn($s_dbname, $o_adoCon, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 1
	Else
		$i_NeedToCloseInFunc = 0
	EndIf
	$o_adoRs = ObjCreate("ADODB.Recordset")
	$o_adoRs.CursorType = 1
	$o_adoRs.LockType = 3
	$o_adoRs.Open ("SELECT * FROM " & $s_Tablename1, $o_adoCon)
	$records = $ar_array[0][0]
	$records = UBound($ar_array) - 1
	For $i = 1 To $records
		$o_adoRs.AddNew
		For $x = 1 To UBound($ar_array, 2) - 1
			$o_adoRs.Fields ($x - 1).Value = $ar_array[$i][$x]
		Next
;~ 		$o_adoRs.Fields ("ROWID").Value = $o_adoRs.RecordCount+1
		$o_adoRs.Update
	Next
	$o_adoRs.Close
	If $i_NeedToCloseInFunc Then $o_adoCon.Close
EndFunc   ;==>_AddEntireRecord
Func _AddRecord($s_dbname, $s_Tablename1, $ar_array, ByRef $o_adoCon, $ar_FieldFormatsF = "", $i_adoMDB = 1, $USRName = "", $PWD = "")
	If Not IsArray($ar_array) And StringInStr($ar_array, "|") > 0 Then
;~ 		ConsoleWrite("not IsArray($ar_array) and StringInStr($ar_array,|)>0" & @LF)
		$ar_arraylocal = StringSplit($ar_array, "|")
;~ 		_ArrayDelete($ar_arraylocal,0)
		$ar_array = $ar_arraylocal
	ElseIf Not IsArray($ar_array) Then
		Local $ar_arraylocal[2]
		$ar_arraylocal[1] = $ar_array
		$ar_array = $ar_arraylocal
	EndIf
	If Not IsObj($o_adoCon) Then
		_AccessConnectConn($s_dbname, $o_adoCon, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 1
	Else
		$i_NeedToCloseInFunc = 0
	EndIf
	$o_adoRs = ObjCreate("ADODB.Recordset")
	$o_adoRs.CursorType = 1
	$o_adoRs.LockType = 3
	$o_adoRs.Open ("SELECT * FROM " & $s_Tablename1, $o_adoCon)
;~ 	MsgBox(0, "_AddRecord", "$o_adoRs.Recordcount=" & $o_adoRs.RecordCount+1)
	$o_adoRs.AddNew
;~ 	$o_adoRs.Fields ("ROWID").Value = $o_adoRs.RecordCount+1
	For $x = 1 To UBound($ar_array) - 1
		$o_adoRs.Fields ($x - 1).Value = $ar_array[$x]
	Next
	$o_adoRs.Update
	$o_adoRs.Close
	If $i_NeedToCloseInFunc Then $o_adoCon.Close
EndFunc   ;==>_AddRecord
Func _DeleteRecord($s_dbname, $s_Tablename1, $i_DeleteCount, ByRef $o_adoCon, $i_adoMDB = 1, $USRName = "", $PWD = "")
	If Not IsObj($o_adoCon) Then
		_AccessConnectConn($s_dbname, $o_adoCon, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 1
	Else
		$i_NeedToCloseInFunc = 0
	EndIf
	$o_adoRs = ObjCreate("ADODB.Recordset")
	$o_adoRs.CursorType = 1
	$o_adoRs.LockType = 3
	Local $a = 1
	$o_adoRs.Open ("SELECT * FROM " & $s_Tablename1, $o_adoCon)
	With $o_adoRs
		If .RecordCount Then
			.MoveFirst
;~ 			MsgBox(0, "_DeleteRecord", "$o_adoRs.RecordCount=" & $o_adoRs.RecordCount+1)
			While Not .EOF
				If $a = $i_DeleteCount Then
					.delete
					ExitLoop
				EndIf
				.MoveNext
				$a += 1
			WEnd
		EndIf
	EndWith
	$o_adoRs.Update
	$o_adoRs.Close
	If $i_NeedToCloseInFunc Then $o_adoCon.Close
EndFunc   ;==>_DeleteRecord
Func MyErrFunc()
	;#cs
	$HexNumber = Hex($oMyError.number, 8)
	MsgBox(0, "AutoItCOM Test", "We intercepted a COM Error !" & @CRLF & @CRLF & _
			"err.description is: " & @TAB & $oMyError.description & @CRLF & _
			"err.windescription:" & @TAB & $oMyError.windescription & @CRLF & _
			"err.number is: " & @TAB & $HexNumber & @CRLF & _
			"err.lastdllerror is: " & @TAB & $oMyError.lastdllerror & @CRLF & _
			"err.scriptline is: " & @TAB & $oMyError.scriptline & @CRLF & _
			"err.source is: " & @TAB & $oMyError.source & @CRLF & _
			"err.helpfile is: " & @TAB & $oMyError.helpfile & @CRLF & _
			"err.helpcontext is: " & @TAB & $oMyError.helpcontext _
			)
	;#ce
	SetError(1)  ; to check for after this function returns
EndFunc   ;==>MyErrFunc
Func _CountTables(ByRef $connectionobj, $s_dbname, $i_adoMDB = 1, $USRName = "", $PWD = "")
	$ar_GetTables = _GetTableNames($connectionobj, $s_dbname, $i_adoMDB, $USRName, $PWD)
	Return UBound($ar_GetTables) - 1
EndFunc   ;==>_CountTables
Func _ArrayViewQueryTable($ar_Rows, $s_Table)
	_2dArrayDisp($ar_Rows, $s_Table)
;~ 	_ArrayView2D1D($ar_Rows,$s_Table&"$s_Tablename Array")
;~ 	_ArrayViewText($ar_Rows,$s_Table,1,1,1,0,800,600,-1,-1);,$Displayindex=1, $ZeroRowAsHeader=0)
EndFunc   ;==>_ArrayViewQueryTable
Func _AccessConnectConn($s_dbname, ByRef $o_adoCon, $i_adoMDB = 1, $USRName = "", $PWD = "")
	;MsgBox(0, "$USRName/$PWD", $USRName&@lf&$PWD)
	$o_adoCon = ObjCreate("ADODB.Connection")
	If Not $i_adoMDB Then $o_adoCon.Open ("Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" & $s_dbname & ";User Id=" & $USRName & ";Password=" & $PWD & ";")
	If $i_adoMDB Then $o_adoCon.Open ("Driver={Microsoft Access Driver (*.mdb)};Dbq=" & $s_dbname & ';UID=' & $USRName & ';PWD=' & $PWD)
	Return $o_adoCon
EndFunc   ;==>_AccessConnectConn
Func _AccessCloseConn($o_adoCon)
	$o_adoCon.Close
EndFunc   ;==>_AccessCloseConn
Func _RecordSearch($s_dbname, $_query, ByRef $o_adoCon, $i_adoMDB = 1, $USRName = "", $PWD = "")
	If Not IsObj($o_adoCon) Then
		_AccessConnectConn($s_dbname, $o_adoCon, $i_adoMDB, $USRName, $PWD)
		$i_NeedToCloseInFunc = 1
	Else
		$i_NeedToCloseInFunc = 0
	EndIf
	$o_adoRs = ObjCreate("ADODB.Recordset")
	$o_adoRs.CursorType = 1
	$o_adoRs.LockType = 3
	$o_adoRs.Open ($_query, $o_adoCon)
	With $o_adoRs
		Dim $_output[.RecordCount + 1][.Fields.Count + 1]
		$_output[0][0] = .RecordCount
		For $i = 1 To .Fields.Count
			$_output[0][$i] = .Fields ($i - 1).Name
		Next
		If $o_adoRs.RecordCount Then
			$z = 0
			While Not .EOF
				$z = $z + 1
				For $x = 1 To .Fields.Count
					$_output[$z][$x] = .Fields ($x - 1).Value
				Next
				.MoveNext
			WEnd
		EndIf
	EndWith
	$o_adoRs.Close
	If $i_NeedToCloseInFunc Then $o_adoCon.Close
	Return $_output
EndFunc   ;==>_RecordSearch
Func _2dArrayDisp($ar_array, $s_Label = "Display")
	$report = "Number of records matching = " & UBound($ar_array) - 1 & @CRLF
	For $x = 1 To UBound($ar_array) - 1
		For $i = 1 To UBound($ar_array, 2) - 1
			$report = $report & $ar_array[$x][$i] & "|"
		Next
		$report = StringTrimRight($report, 1) & @CRLF
	Next
	MsgBox(0, $s_Label, $report)
EndFunc   ;==>_2dArrayDisp