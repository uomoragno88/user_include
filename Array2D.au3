;Array2D.au3 ; version 4_18 
;		from 2_3 onward, includes Array2s.au3
;		_ArrayViewText($ar3_Array, 'Title',  $i_RowStart, $i_ColumnStart, $i_ZeroRowAsHeader,$Transpose,  $Width, $Height, $Left, $Right)
;[in Array2.au3 as below];
;]UDFs to help Array2D usage; various authors; in development or anyone to re-write better?...
;		_Array2DCreateFromArray($ar1_Array_Row1,$Displayindex=1, $ZeroRowAsHeader=0)
;		_Array2DCreateFirstRow( $aRowArray)
;		_ArrayInsert2D(ByRef $avArray, $aRowArray, $nRow = '')
;		_ArrayDelete2D(ByRef $avArray, $nRow = '')
;		_ArrayReplace2DRow(ByRef $avArray, $aRowArray, $nRow = '')
;		_ArrayReplace2DColumn(ByRef $avArray, $nRow = '')
;		_ArrayInsert2DColumn(ByRef $avArray, $aRowArray, $nRow = '')
;		_ArrayDelete2DColumn(ByRef $avArray, $nRow = '')
;		_ArrayToBase1($ar_Array2DF)
;		_ArrayToBase0($ar_Array)
;		_StringSplit_B0($s_String,$s_Delimiter="|",$i_Flag="0")
;		_Array2DTranspose(ByRef $ar_Array)
;		_Array2DToD(ByRef $ar_Array, $s_Title = "Array contents", $n_Index = 1, $Line = 0, $s_i_Column = 0)
;=======================================
;Array2s.au3 ; version 2_3
;Array2.au3 ; version _1_21 ; ; Dec5th2005
;UDFs to help Array2D usage; various authors; in development or anyone to re-write better?...
;		_SubSortDo(byref $ar_Array2d,byref $ar_Temp,byref $i_temp,$i_Asc,$col,$row)
;		_SubSort(byref $ar_Array2d,$ar_Index,$indexcol, $i_Asc)
;		_ArrayFieldSort( byref $ar_Array2d,$i_Index="1")
;		_Array2DToArStrings(byref $ar3_Array,byref $s_Row2)
;		_Array2DTo1String(byref $ar3_Array,$s_Row)
;		_Array2dDisplay(ByRef $ar_Array, $s_Title="Array contents", $n_Index=1)
;		_FileTo2dArray($sFilePath, ByRef $aArray)
;		_Array2DCreateFromArray($ar1_Array_Row1,$Displayindex=1, $ZeroRowAsHeader=0)
;		_Array2DCreateFirstRow( $aRowArray)
;		_ArrayInsert2D(ByRef $avArray, $aRowArray, $nRow = '')
;		_ArrayDelete2D(ByRef $avArray, $nRow = '')
;		_ArrayReplace2DRow(ByRef $avArray, $aRowArray, $nRow = '')
;		_ArrayReplace2DColumn(ByRef $avArray, $nRow = '')
;		_ArrayInsert2DColumn(ByRef $avArray, $aRowArray, $nRow = '')
;		_ArrayDelete2DColumn(ByRef $avArray, $nRow = '')
;		_ArrayToBase1($ar_Array2DF)
;		_ArrayToBase0($ar_Array)
;		_StringSplit_B0($s_String,$s_Delimiter="|",$i_Flag="0")
;		_Array2DTranspose(ByRef $ar_Array)
;		_Array2DToD(ByRef $ar_Array, $s_Title = "Array contents", $n_Index = 1, $Line = 0, $s_i_Column = 0)
;[in Array2D]		_ArrayViewText($ar3_Array, 'Title',  $i_RowStart, $i_ColumnStart, $i_ZeroRowAsHeader,$Transpose,  $Width, $Height, $Left, $Right)
;============================================
#region Main
#include-once
#include <Misc.au3>
#include <File.au3>
#include <Array.au3>
#include <GuiConstants.au3>
#include <GuiListView.au3>
;~ #include <_GUICtrlListView.au3>
;global 	$hndListView_Array1Box_Display = GUICtrlCreateListView($sTemp, 0, 16, $Width, $Height - 40, $LVS_SHOWSELALWAYS, BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
#endregion Main
Func _Array2DCreateFromArray($ar1_Array_Arrays, $i_Base = 0, $i_Transpose = 0)
	$code = 'function Array2DCreatefromArrays( byref ar1Arrays,Base)'
	$code &= @LF & '	dim r,c,NewUbound,ar2ArrayArrays()'
	$code &= @LF & '	For r = Base To ubound(ar1Arrays) '
	$code &= @LF & '		aRowArray = ar1Arrays(r)'
	$code &= @LF & '		if ubound(aRowArray)>NewUbound then'
	$code &= @LF & '			NewUbound=ubound(aRowArray)'
	$code &= @LF & '		end if'
	$code &= @LF & '	next'
	$code &= @LF & '	ReDim preserve ar2ArrayArrays(NewUbound,ubound(ar1Arrays)-Base)'
	$code &= @LF & '		For r = Base To ubound(ar1Arrays) '
	$code &= @LF & '		aRowArray = ar1Arrays(r)'
	$code &= @LF & '			For c = 0 To ubound(aRowArray)'
	$code &= @LF & '						ar2ArrayArrays(c,r-Base) = aRowArray(c)'
	$code &= @LF & '			Next'
	$code &= @LF & '		Next'
	$code &= @LF & '	Array2DCreatefromArrays=ar2ArrayArrays'
	$code &= @LF & 'End function   '
	$vbs = ObjCreate("ScriptControl")
	$vbs.language = "vbscript"
	$vbs.addcode ($code)
	$ar6_Array = $vbs.run ("Array2DCreatefromArrays", $ar1_Array_Arrays, $i_Base)
	$vbs = ""
	If $i_Transpose Then _Array2DTranspose($ar6_Array)
	Return $ar6_Array
EndFunc   ;==>_Array2DCreateFromArray
Func __ArrayDelete(ByRef $ar_Array, $i_iIndexRow = 1)
	$code = 'function ArrayDelete(arlistview,iIndexRow)'
	$code &= @LF & '	dim iLoop,count'
	$code &= @LF & '	count = ubound (arlistview)'
	$code &= @LF & '     For iLoop = iIndexRow to UBound(arlistview) - 1'
	$code &= @LF & '       arlistview(iLoop) = arlistview(iLoop + 1)'
	$code &= @LF & '     Next'
	$code &= @LF & '	redim preserve arlistview(count-1)'
	$code &= @LF & '	ArrayDelete= arlistview'
	$code &= @LF & 'end function'
	$vbs = ObjCreate("ScriptControl")
	$vbs.language = "vbscript"
	$vbs.addcode ($code)
	$ar_Array = $vbs.run ("ArrayDelete", $ar_Array, $i_iIndexRow)
	$vbs = ""
EndFunc   ;==>__ArrayDelete
Func _Array2DCreateFromArraySt($ar1_Array_Strings, $i_Base = 0, $i_Transpose = 0)
	$code = 'function Array2DCreate( byref ar1Strings,Base)'
	$code &= @LF & '	dim r,c,NewUbound,ar2ArrayStrings()'
	$code &= @LF & '	For r = Base To ubound(ar1Strings) '
	$code &= @LF & '		aRowArray = split(ar1Strings(r),"|")'
	$code &= @LF & '		if ubound(aRowArray)>NewUbound then'
	$code &= @LF & '			NewUbound=ubound(aRowArray)'
	$code &= @LF & '		end if'
	$code &= @LF & '	next'
	$code &= @LF & '	ReDim preserve ar2ArrayStrings(NewUbound,ubound(ar1Strings)-base)'
	$code &= @LF & '		For r = Base To ubound(ar1Strings)'
	$code &= @LF & '		aRowArray = split(ar1Strings(r),"|")'
	$code &= @LF & '			For c = 0 To ubound(aRowArray)'
	$code &= @LF & '				ar2ArrayStrings(c,r-base) = aRowArray(c)'
	$code &= @LF & '			Next'
	$code &= @LF & '		Next'
	$code &= @LF & '	Array2DCreate=ar2ArrayStrings'
	$code &= @LF & 'End function   '
	$vbs = ObjCreate("ScriptControl")
	$vbs.language = "vbscript"
	$vbs.addcode ($code)
	$ar6_Array = $vbs.run ("Array2DCreate", $ar1_Array_Strings, $i_Base)
	$vbs = ""
	If $i_Transpose Then _Array2DTranspose($ar6_Array)
	Return $ar6_Array
EndFunc   ;==>_Array2DCreateFromArraySt
Func _Array2DToArStrings(ByRef $ar5_Array, ByRef $a_Rowa2);_Array2DToArStrings
	$code = 'function Array2DtoArrayStrings( byref ar2ArrayStrings)'
	$code &= @LF & '	dim r,c,intPointer,ar1ArrayStrings()'
	$code &= @LF & '	ReDim preserve ar1ArrayStrings(ubound(ar2ArrayStrings,2))'
	$code &= @LF & '		For r = 0 To ubound(ar2ArrayStrings,2) '
	$code &= @LF & '			For c = 0 To ubound(ar2ArrayStrings)'
	$code &= @LF & '						ar1ArrayStrings(r)=ar1ArrayStrings(r)&"|"&ar2ArrayStrings(c,r) '
	$code &= @LF & '			Next'
	$code &= @LF & '			ar1ArrayStrings(r)=mid(ar1ArrayStrings(r),2,len(ar1ArrayStrings(r))-1)'
	$code &= @LF & '		Next'
	$code &= @LF & '	Array2DtoArrayStrings=ar1ArrayStrings'
	$code &= @LF & 'end function'
	$vbs = ObjCreate("ScriptControl")
	$vbs.language = "vbscript"
	$vbs.addcode ($code)
	$a_Rowa2 = $vbs.run ("Array2DtoArrayStrings", $ar5_Array)
	$vbs = ""
	;Return $a_Rowa2
EndFunc   ;==>_Array2DToArStrings
Func _Array2DToArArrays(ByRef $ar3_Array, ByRef $s_Row2)
	$code = 'function Array2DtoArrayArrays( byref ar2ArrayStrings)'
	$code &= @LF & '	dim r,c,intPointer,Array1Arrays(),Array1ArraysC()'
	$code &= @LF & '	ReDim preserve ar1ArrayStrings(ubound(ar2ArrayStrings,2))'
	$code &= @LF & '	ReDim preserve Array1ArraysC(ubound(ar2ArrayStrings))'
	$code &= @LF & '		For r = 0 To ubound(ar2ArrayStrings,2) '
	$code &= @LF & '			For c = 0 To ubound(ar2ArrayStrings)'
	$code &= @LF & '						Array1ArraysC(c)=ar2ArrayStrings(c,r) '
	$code &= @LF & '			Next'
	$code &= @LF & '			ar1ArrayStrings(r)=mid(ar1ArrayStrings(r),2,len(ar1ArrayStrings(r))-1)'
	$code &= @LF & '		Array1Arrays(r)=Array1ArraysC'
	$code &= @LF & '		Next'
	$code &= @LF & '	Array2DtoArrayArrays=Array1Arrays'
	$code &= @LF & 'end function'
	$vbs = ObjCreate("ScriptControl")
	$vbs.language = "vbscript"
	$vbs.addcode ($code)
	$s_Row2 = $vbs.run ("Array2DtoArrayArrays", $ar3_Array)
	$vbs = ""
	;Return $a_Rowa2
EndFunc   ;==>_Array2DToArArrays
Func _Array2DFormatCols(ByRef $ar_Array2d, $i_IndexF = "all", $s_Format = "s")
	;$s_Format="n" as numbers; ** LATER "s" as strings, "j" as Julian Dates, "d" as local short dates, "" aslocal long dates
	If $i_IndexF = "all" Then
		Local $ar_IndexF[UBound($ar_Array2d, 2) ]
		For $col = 0 To UBound($ar_IndexF) - 1
			$ar_IndexF[$col] = $col
		Next
	Else
		$ar_IndexF = StringSplit($i_IndexF, "|")
		_ArrayDelete($ar_IndexF, 0)
		For $col = 0 To UBound($ar_IndexF) - 1
			$ar_IndexF[$col] = Abs($ar_IndexF[$col]) - 1
		Next
	EndIf
	Switch $s_Format
		Case "n"
			For $col = 0 To UBound($ar_IndexF) - 1
				For $row = 0 To UBound($ar_Array2d) - 1
					$ar_Array2d[$row][$ar_IndexF[$col]] = Number($ar_Array2d[$row][$ar_IndexF[$col]])
				Next
			Next
		Case "s"
			For $col = 0 To UBound($ar_IndexF) - 1
				For $row = 0 To UBound($ar_Array2d) - 1
					;MsgBox(0,"","$ar_Array2d[$row][$ar_IndexF[$col]]="&$ar_Array2d[$row][$ar_IndexF[$col]])
					$ar_Array2d[$row][$ar_IndexF[$col]] = String($ar_Array2d[$row][$ar_IndexF[$col]])
				Next
			Next
			;$msg = "s  done"
		Case "j"
			$msg = "j not done"
		Case "d"; dates
			$msg = "d not done"
		Case "l"
			$msg = "l not done"
		Case Else
			$msg = "What do you mean?"
	EndSwitch
EndFunc   ;==>_Array2DFormatCols
Func _Array2D1DFieldSortSt(ByRef $arEither2D1D, $iIndex = "1"); 1D must be "|" delimited!
	If UBound($arEither2D1D, 2) > 1 Then
		Local $arSingle
		_Array2DToArStrings($arEither2D1D, $arSingle)
		$arEither2D1D = $arSingle
	EndIf
	$code = 'function SubSort( byref arSingle,iIndex)'
	$code &= @LF & '	arIndexN=split(iIndex,"|")'
	$code &= @LF & '	dim iAsc:iAsc=0'
	$code &= @LF & '	if arIndexN(0)<0 then iAsc=1'
	$code &= @LF & '	dim arIndex()'
	$code &= @LF & '	redim preserve arIndex(1)';:arIndex(1) =0
	$code &= @LF & '	for a= 0 to ubound(arIndexN)'
	$code &= @LF & '		arIndexN(a)=csng(arIndexN(a))'
	$code &= @LF & '		if arIndexN(a)<>"" and arIndexN(a)<>0 then'
	$code &= @LF & '			redim preserve arIndex(a)'
	$code &= @LF & '			arIndex(a)=abs(arIndexN(a))-1'
	$code &= @LF & '			arIndexN(a)=csng(Iif(arIndexN(a)<0,arIndexN(a)+1,arIndexN(a)-1))'
	$code &= @LF & '		End If'
	$code &= @LF & '	next'
	$code &= @LF & '	ArraySort arSingle, iAsc,  0, UBound(arSingle), arIndex(0)  ';SortArray, iAsc,First, Last,iViewColNum
	$code &= @LF & '	for indexcol=1 to ubound(arIndex)';col=2'; start with check on 2nd  index'; define first index as col 1 (in call, 1)
	$code &= @LF & '		SubSort1 arSingle,arIndex,indexcol,iif(arIndexN(indexcol)<0,-1,1)  ';->, sort order
;~ 	$code &= @LF & '		SubSort1 arSingle,arIndex,indexcol,(arIndex(indexcol)+1)/(arIndexN(indexcol)  ';->, sort order
	$code &= @LF & '	Next'
	$code &= @LF & '	SubSort=arSingle'
	$code &= @LF & 'end function   ';==>ArrayFieldSort
	$code &= @LF & 'function SubSort1(byref arArray,arIndex,indexcol, iAsc)'
	$code &= @LF & '	dim Row,col:col=arIndex(indexcol)'
	$code &= @LF & '	dim pcol:pcol=arIndex(indexcol-1)'
	$code &= @LF & '	iAsc=Iif(iAsc<0,1,0)'
	$code &= @LF & '	dim arTemp(),itemp,	sMarker:sMarker="Equal"';,sTemp(1)
	$code &= @LF & '	redim preserve arTemp(1) ';redim extra row
	$code &= @LF & '	for Row=1 to UBound(arArray) '; go through all rows of 2d array in that column to check for dupes
	$code &= @LF & '			arRow=split(arArray(row),"|")'
	$code &= @LF & '			arRowB4=split(arArray(row-1),"|")'
	$code &= @LF & '		if indexcol>1 then ';check cols in each row first if more than 2 index cols
	$code &= @LF & '			for c=0 to indexcol-1'
	$code &= @LF & '				if arRow(arIndex(c))<>arRowB4(arIndex(c)) Then'
	$code &= @LF & '					sMarker="pColsNotEqual"'
	$code &= @LF & '					c=indexcol'
	$code &= @LF & '				End If'
	$code &= @LF & '			Next'
	$code &= @LF & '		End If'
	$code &= @LF & '		if arRow(pcol)=arRowB4(pcol) and sMarker="Equal" Then ';dupes in the prev col.
	$code &= @LF & '			arTemp(itemp)=arArray(row-1)';Array2DToD( arArray2d,"",0,row-1,1) '; set first line of new potential sort array
	$code &= @LF & '			redim preserve arTemp(itemp+1) ';redim extra row
	$code &= @LF & '			arTemp(itemp+1)=arArray(row)';Array2DToD( arArray2d,"",0,row-1,1) '; set first line of new potential sort array
	$code &= @LF & '			itemp=itemp+1'
	$code &= @LF & '		Else'
	$code &= @LF & '			sMarker="Equal"'
	$code &= @LF & '			SubSortDo1 arArray,arTemp,itemp,iAsc,col,row'
	$code &= @LF & '		End If'
	$code &= @LF & '	Next'
	$code &= @LF & '	SubSortDo1 arArray,arTemp,itemp,iAsc,col,row'
	$code &= @LF & 'end function   '
	$code &= @LF & 'function SubSortDo1(byref arArray,byref arTemp,byref itemp,iAsc,col,row)'
	$code &= @LF & '	dim sTemp()'
	$code &= @LF & '	if itemp>0 then'
	$code &= @LF & '		ArraySort arTemp,  iAsc,0, UBound(arTemp), col ';sort on current col (pcol+1), asc?
	$code &= @LF & '		for i= 0 to ubound(arTemp)'
	$code &= @LF & '			arArray(row-ubound(arTemp)+i-1)=arTemp(i)'
	$code &= @LF & '		Next'
	$code &= @LF & '	End If'
	$code &= @LF & '	redim preserve arTemp(1)'
	$code &= @LF & '	itemp=0'; change backto single, then get into 2d array properly, then go on to check next line'; row=row-1??
	$code &= @LF & '	SubSortDo1= SortArray'
	$code &= @LF & 'end function'
	$code &= @LF & 'Function IIf( expr, truepart, falsepart )'
	$code &= @LF & '   IIf = falsepart'
	$code &= @LF & '   If expr Then IIf = truepart'''
	$code &= @LF & 'End Function'
	$code &= @LF & 'function ArraySort(ByRef SortArray, iAsc,First, Last,iViewColNum)'
	$code &= @LF & '	dim strWrite,arCol,arColumn()'
	$code &= @LF & '	ReDim Preserve arColumn(ubound(SortArray))'
	$code &= @LF & '	Dim intPointer, booIsNumeric: booIsNumeric = True'
	$code &= @LF & '	For intPointer = First To Last'
	$code &= @LF & '		arCol = Split( SortArray(intPointer), "|", -1,0 )'
	$code &= @LF & '		If Not IsNumeric( arCol(iViewColNum) ) Then'
	$code &= @LF & '			booIsNumeric = False'
	$code &= @LF & '			Exit For'
	$code &= @LF & '		End If'
	$code &= @LF & '	Next'
	$code &= @LF & '	For intPointer = First To Last'
	$code &= @LF & '		arCol = Split( SortArray(intPointer), "|", -1,0 )'
	$code &= @LF & '			If booIsNumeric Then'
	$code &= @LF & '			arColumn(intPointer)  = CSng( arCol(iViewColNum) )'
	$code &= @LF & '		else'
	$code &= @LF & '			arColumn(intPointer)  =  arCol(iViewColNum)'
	$code &= @LF & '		End If'
	$code &= @LF & '	Next'
	$code &= @LF & '	QuickSortColumn  SortArray, arColumn,First, Last,iViewColNum '
	$code &= @LF & '	if iasc=1 then ReverseElements SortArray, 0, ubound(SortArray)'
	$code &= @LF & '	ArraySort= SortArray'
	$code &= @LF & 'End function   '
	$code &= @LF & 'function QuickSortColumn(ByRef SortArray, ByRef arColumn, First, Last,iViewColNum)'
	$code &= @LF & '	dim Low,High,collitem,arCol'
	$code &= @LF & '	dim Temp,ListSeparator'
	$code &= @LF & '	Low = First'
	$code &= @LF & '	High = Last'
	$code &= @LF & '	ListSeparator=arColumn((First + Last) / 2)'
	$code &= @LF & '	Do'
	$code &= @LF & '		While (arColumn(Low) < ListSeparator)'
	$code &= @LF & '			Low = Low + 1'
	$code &= @LF & '		WEnd'
	$code &= @LF & '		While (arColumn(High) > ListSeparator)'
	$code &= @LF & '			High = High - 1'
	$code &= @LF & '		WEnd'
	$code &= @LF & '		If (Low <= High) Then'
	$code &= @LF & '			Temp = SortArray(Low)'
	$code &= @LF & '			SortArray(Low) = SortArray(High)'
	$code &= @LF & '			SortArray(High) = Temp'
	$code &= @LF & '			Temp = arColumn(Low)'
	$code &= @LF & '			arColumn(Low) = arColumn(High)'
	$code &= @LF & '			arColumn(High) = Temp'
	$code &= @LF & '			Low = Low + 1'
	$code &= @LF & '			High = High - 1'
	$code &= @LF & '		End If'
	$code &= @LF & '	Loop While (Low <= High)'
	$code &= @LF & '	If (First < High) Then QuickSortColumn  SortArray, arColumn,First, High,iViewColNum '
	$code &= @LF & '	If (Low < Last) Then QuickSortColumn  SortArray, arColumn,Low, Last,iViewColNum '
	$code &= @LF & 'End function   '
	$code &= @LF & 'Sub ReverseElements( arrToReverse, intAlphaRow, intOmegaRow )'
	$code &= @LF & '    Dim intPointer, intUpper, intLower, varHolder'
	$code &= @LF & '    For intPointer = 0 To Int( (intOmegaRow - intAlphaRow) / 2 )'
	$code &= @LF & '        intUpper = intAlphaRow + intPointer'
	$code &= @LF & '        intLower = intOmegaRow - intPointer'
	$code &= @LF & '        varHolder = arrToReverse(intLower)'
	$code &= @LF & '        arrToReverse(intLower) = arrToReverse(intUpper)'
	$code &= @LF & '        arrToReverse(intUpper) = varHolder'
	$code &= @LF & '    Next'
	$code &= @LF & 'End Sub'
	$vbs = ObjCreate("ScriptControl")
	$vbs.language = "vbscript"
	$vbs.addcode ($code)
	$arEither2D1D = $vbs.run ("SubSort", $arEither2D1D, $iIndex)
	$vbs = ""
EndFunc   ;==>_Array2D1DFieldSortSt
Func __ArraySort(ByRef $ar_Array, $i_Asc = 0, $First = 0, $Last = 0, $i_Dim = 1, $i_ViewColNum = 1)
	;MsgBox(0,"","$i_ViewColNum="&$i_ViewColNum)
	Local $ar_Temp[1]
	If $Last = 0 Then $Last = UBound($ar_Array) - 1
	If UBound($ar_Array, 2) > 1 Then
		_Array2DToArStrings($ar_Array, $ar_Temp)
	Else
		$ar_Temp = $ar_Array
	EndIf
	$code = "function Quick_SortColumn1(ByRef SortArray,iAsc, First, Last,i_ViewColNum)"
	$code &= @LF & "	dim strWrite,ar_Col,ar_Column()"
	$code &= @LF & "	ReDim Preserve ar_Column(ubound(SortArray))"
	$code &= @LF & "	Dim intPointer, booIsNumeric: booIsNumeric = True"
	$code &= @LF & "	For intPointer = First To Last"
	$code &= @LF & '		ar_Col = Split( SortArray(intPointer), "|", -1,0 )'
	$code &= @LF & "		If Not IsNumeric( ar_Col(i_ViewColNum) ) Then"
	$code &= @LF & "			booIsNumeric = False"
	$code &= @LF & "			Exit For"
	$code &= @LF & "		End If"
	$code &= @LF & "	Next"
	$code &= @LF & "	For intPointer = First To Last"
	$code &= @LF & '		ar_Col = Split( SortArray(intPointer), "|", -1,0 )'
	$code &= @LF & '			If booIsNumeric Then'
	$code &= @LF & "			ar_Column(intPointer)  = CSng( ar_Col(i_ViewColNum) )"
	$code &= @LF & "		else"
	$code &= @LF & "			ar_Column(intPointer)  =  ar_Col(i_ViewColNum)"
	$code &= @LF & "		End If"
	$code &= @LF & "	Next"
	$code &= @LF & "	Quick_SortColumn  SortArray, ar_Column,First, Last,i_ViewColNum "
	$code &= @LF & "	if iAsc=1 then "
	$code &= @LF & "		ReverseElements SortArray, 0, ubound(SortArray)"
	$code &= @LF & "	End If"
	$code &= @LF & "	Quick_SortColumn1= SortArray"
	$code &= @LF & "End function   "
	$code &= @LF & "function Quick_SortColumn(ByRef SortArray, ByRef ar_Column, First, Last,i_ViewColNum)"
	$code &= @LF & "	dim Low,High,collitem,ar_Col"
	$code &= @LF & "	dim Temp,List_Separator"
	$code &= @LF & "	Low = First"
	$code &= @LF & "	High = Last"
	$code &= @LF & "	List_Separator=ar_Column((First + Last) / 2)"
	$code &= @LF & "	Do"
	$code &= @LF & "		While (ar_Column(Low) < List_Separator)"
	$code &= @LF & "			Low = Low + 1"
	$code &= @LF & "		WEnd"
	$code &= @LF & "		While (ar_Column(High) > List_Separator)"
	$code &= @LF & "			High = High - 1"
	$code &= @LF & "		WEnd"
	$code &= @LF & "		If (Low <= High) Then"
	$code &= @LF & "			Temp = SortArray(Low)"
	$code &= @LF & "			SortArray(Low) = SortArray(High)"
	$code &= @LF & "			SortArray(High) = Temp"
	$code &= @LF & "			Temp = ar_Column(Low)"
	$code &= @LF & "			ar_Column(Low) = ar_Column(High)"
	$code &= @LF & "			ar_Column(High) = Temp"
	$code &= @LF & "			Low = Low + 1"
	$code &= @LF & "			High = High - 1"
	$code &= @LF & "		End If"
	$code &= @LF & "	Loop While (Low <= High)"
	$code &= @LF & "	If (First < High) Then Quick_SortColumn  SortArray, ar_Column,First, High,i_ViewColNum "
	$code &= @LF & "	If (Low < Last) Then Quick_SortColumn  SortArray, ar_Column,Low, Last,i_ViewColNum "
	$code &= @LF & "End function   "
	$code &= @LF & "Sub ReverseElements( arrToReverse, intAlphaRow, intOmegaRow )"
	$code &= @LF & "    Dim intPointer, intUpper, intLower, varHolder"
	$code &= @LF & "    For intPointer = 0 To Int( (intOmegaRow - intAlphaRow) / 2 )"
	$code &= @LF & "        intUpper = intAlphaRow + intPointer"
	$code &= @LF & "        intLower = intOmegaRow - intPointer"
	$code &= @LF & "        varHolder = arrToReverse(intLower)"
	$code &= @LF & "        arrToReverse(intLower) = arrToReverse(intUpper)"
	$code &= @LF & "        arrToReverse(intUpper) = varHolder"
	$code &= @LF & "    Next"
	$code &= @LF & "End Sub"
	$vbs = ObjCreate("ScriptControl")
	$vbs.language = "vbscript"
	$vbs.addcode ($code)
	$ar_Temp = $vbs.run ("Quick_SortColumn1", $ar_Temp, $i_Asc, $First, $Last, $i_ViewColNum)
	If UBound($ar_Array, 2) > 1 Then
		$ar_Array = _Array2DCreateFromArraySt($ar_Temp)
	Else
		$ar_Array = $ar_Temp
	EndIf
	$vbs = ""
EndFunc   ;==>__ArraySort
Func _Array2DToDau3(ByRef $ar_Array, $s_Title = "Array contents", $n_Index = 1, $Line = 0, $s_i_Column = 0)
	; Change Line "X" to 1 dimensional array; [Randallc - I have ***lifted it from Forum at some stage]
	Local $output = ""
	Local $r, $e, $Swap
	If $n_Index <> 0 Then $n_Index = 1; otherwise I can't cope!
	If $s_i_Column <> 0 Then $s_i_Column = 1; otherwise I can't cope!
	If $Line < 0 Then $Line = 0; otherwise I can't cope!
	;If $Line>UBound($ar_Array,1+($s_i_Column=0))+($n_Index=0)-2 then $Line=UBound($ar_Array,)+($n_Index=0)-2	; otherwise I can't cope!
	If $Line > UBound($ar_Array, 1+ ($s_i_Column = 0)) + ($n_Index = 0) - 2 Then $Line = UBound($ar_Array, 1+ ($s_i_Column = 0)) + ($n_Index = 0) - 2; otherwise I can't cope!
	Dim $Array[UBound($ar_Array, 1 + $s_i_Column) + ($n_Index = 0) ]
	$Array[0] = UBound($ar_Array, 1 + $s_i_Column) + ($n_Index = 0)
	If Not IsArray($ar_Array) Then Return -1
	For $r = $n_Index To UBound($ar_Array, 1 + $s_i_Column) - 1
		$e = $r
		$NewLine = $Line
		If $s_i_Column = 1 Then
			$NewLine = $r
			$e = $Line
		EndIf
		$Array[$r+ ($n_Index = 0) ] = $ar_Array[$e][$NewLine]
	Next
	;_ArrayDisplay($Array,$s_Title&"Line"&$Line)
	Return $Array
EndFunc   ;==>_Array2DToDau3
Func _Array2DToD($ar8_Array, $s_Title = "Array contents", $n_Index = 1, $Line = 0, $s_i_Column = 0)
	If $s_i_Column Then _Array2DTranspose($ar8_Array)
	$code = 'function Array2DtoD( byref ar2ArrayStrings,Index,row,column)'
	$code &= @LF & '	dim r,c,intPointer,Array1ArraysC()'
	$code &= @LF & '	if column<>0 then'
	$code &= @LF & '		ReDim preserve Array1ArraysC(ubound(ar2ArrayStrings))'
	$code &= @LF & '		For c = Index To ubound(ar2ArrayStrings)'
	$code &= @LF & '			Array1ArraysC(c)=ar2ArrayStrings(c,row) '
	$code &= @LF & '		Next'
	$code &= @LF & '	else'
	$code &= @LF & '		ReDim preserve Array1ArraysC(ubound(ar2ArrayStrings,2))'
	$code &= @LF & '		For r = index To ubound(ar2ArrayStrings,2)'
	$code &= @LF & '			Array1ArraysC(r)=ar2ArrayStrings(row,r) '
	$code &= @LF & '		Next'
	$code &= @LF & '	end if'
	$code &= @LF & '	Array2DtoD=Array1ArraysC'
	$code &= @LF & 'End function   '
	$vbs = ObjCreate("ScriptControl")
	$vbs.language = "vbscript"
	$vbs.addcode ($code)
	$ar_Array = $vbs.run ("Array2DtoD", $ar8_Array, $n_Index, $Line, $s_i_Column)
	$vbs = ""
;~ 	if  $s_i_Column then _Array2DTranspose($ar8_Array)
	Return $ar_Array
EndFunc   ;==>_Array2DToD
Func _Array2DTo1String(ByRef $ar7_Array, $Line = 0, $s_Title = "Array contents", $n_Index = 1, $s_i_Column = 0)
	$code = 'function Array2Dto1String( byref ar2ArrayStrings,Index,row,column)'
	$code &= @LF & '	dim r,c,intPointer,ar1String'
	$code &= @LF & '	if column<>0 then'
	$code &= @LF & '		For c = Index To ubound(ar2ArrayStrings)'
	$code &= @LF & '			ar1String=ar1String&"|"&ar2ArrayStrings(c,row) '
	$code &= @LF & '		Next'
	$code &= @LF & '	else'
	$code &= @LF & '		For r = index To ubound(ar2ArrayStrings,2)'
	$code &= @LF & '			ar1String=ar1String&"|"&ar2ArrayStrings(row,r)'
	$code &= @LF & '		Next'
	$code &= @LF & '	end if'
	$code &= @LF & '	Array2Dto1String=mid(ar1String,2,len(ar1String)-1)'
	$code &= @LF & 'End function   '
	$vbs = ObjCreate("ScriptControl")
	$vbs.language = "vbscript"
	$vbs.addcode ($code)
	$s_DelimString = $vbs.run ("Array2Dto1String", $ar7_Array, $n_Index, $Line, $s_i_Column)
	$vbs = ""
	Return $s_DelimString
EndFunc   ;==>_Array2DTo1String
Func _Array2dDisplay2(ByRef $ar_Array, $s_Title = "Array contents", $n_Index = 1)
	;-------------------------------------
	; Display 2 dimensional array
	Local $output = ""
	Local $r, $c
	If Not IsArray($ar_Array) Then Return -1
	For $r = $n_Index To UBound($ar_Array, 1) - 1
		$output = $output & @LF
		For $c = 0 To UBound($ar_Array, 2) - 1
			$output = $output & $ar_Array[$r][$c] & " "
		Next
	Next
	MsgBox(4096, $s_Title, $output)
	Return
EndFunc   ;==>_Array2dDisplay2
Func _FileTo2dArray($sFilePath, ByRef $aArray)
	;--------------------------------------
	Local $hFile
	Local $str
	Local $r, $c
	Local $aLocal[1]
	Local $aStr
	_FileReadToArray($sFilePath, $aLocal)
	$aStr = StringSplit($aLocal[1], ",")
	ReDim $aArray[$aLocal[0]][$aStr[0]]
	For $r = 1 To $aLocal[0]
		$aStr = StringSplit($aLocal[$r], ",")
		For $c = 1 To UBound($aArray, 2)
			$aArray[$r - 1][$c - 1] = $aStr[$c]
		Next
	Next
	;_Array2dDisplay($aArray, "Before Sort",0)
	Return
EndFunc   ;==>_FileTo2dArray
Func _Array2DCreateFirstRow($aRowArray)
	Local $avArray[1][1]
	_ArrayInsert2D($avArray, $aRowArray)
	Return $avArray
EndFunc   ;==>_Array2DCreateFirstRow
Func _Array2DCreateFirstRowSt($aRowString)
	Local $avArray[1][1]
	_ArrayInsert2Dst($avArray, $aRowString)
	Return $avArray
EndFunc   ;==>_Array2DCreateFirstRowSt
Func _ArrayInsert2DFrom2Dline(ByRef $XLArray3F, ByRef $XLArray1F, $i_Line)
	If UBound($XLArray3F, 2) <> UBound($XLArray1F, 2) Then
		ReDim $XLArray3F[UBound($XLArray3F) ][UBound($XLArray1F, 2) ]
	Else
		ReDim $XLArray3F[UBound($XLArray3F) + 1][UBound($XLArray1F, 2) ]
	EndIf
	For $e = 0 To UBound($XLArray3F, 2) - 1
		$XLArray3F[UBound($XLArray3F) - 1][$e] = $XLArray1F[$i_Line][$e]
	Next
EndFunc   ;==>_ArrayInsert2DFrom2Dline
Func _ArrayInsert2D(ByRef $avArray, $aRowArray, $nRow = '')
	Local $number_of_columns = UBound($avArray, 2), $number_of_rows = UBound($avArray), $nSize = 0, $arraysize
	If $number_of_columns < (UBound($aRowArray)) Then $number_of_columns = UBound($aRowArray)
	If $nRow > $number_of_rows - 1 Then
		SetError(2)
		Return (2)
	EndIf
	If $avArray[0][0] <> '' Or UBound($avArray) - 1 > 0 Then $number_of_rows = $number_of_rows + 1
	If $number_of_columns < UBound($aRowArray) Then $number_of_columns = UBound($aRowArray)
	ReDim $avArray[$number_of_rows ][$number_of_columns]
	If $nRow == '' Then
		$arraysize = UBound($aRowArray);Find array size
		For $c = 0 To $arraysize - 1
			$avArray[$number_of_rows - 1][$c] = $aRowArray[$c]
		Next
		SetError(0)
		Return (0)
	EndIf
	For $r = $number_of_rows - 1 To $nRow Step - 1
		For $c = 0 To UBound($avArray, 2) - 1
			If $r <> $nRow Then
				$avArray[$r][$c] = $avArray[$r - 1][$c]
				$avArray[$r - 1][$c] = ''
			Else
				If Not ($c > UBound($aRowArray) - 1) Then
					$avArray[$r][$c] = $aRowArray[$c]
				EndIf
			EndIf
		Next
	Next
	SetError(0)
	Return (0)
EndFunc   ;==>_ArrayInsert2D
Func _ArrayInsert2Dst(ByRef $avArray, $aRowString, $nRow = '')
	;MsgBox(0,"","_ArrayInsert2Dst $avArray[0][0]="&$avArray[0][0])
	$aRowArray = _StringSplit_B0($aRowString)
	;_ArrayDisplay($aRowArray,"$aRowArray")
	_ArrayInsert2D($avArray, $aRowArray, $nRow)
EndFunc   ;==>_ArrayInsert2Dst
Func _ArrayReplace2DRow(ByRef $avArray, $aRowArray, $nRow = '')
	Local $number_of_columns = UBound($avArray, 2), $number_of_rows = UBound($avArray), $nSize = 0
	If $number_of_columns < (UBound($aRowArray)) Then $number_of_columns = UBound($aRowArray)
	If $nRow > $number_of_rows - 1 Then
		SetError(2)
		Return (2)
	EndIf
	If $number_of_columns < UBound($aRowArray) Then $number_of_columns = UBound($aRowArray)
	ReDim $avArray[$number_of_rows ][$number_of_columns]
	For $c = 0 To UBound($avArray, 2) - 1
		If Not ($c > UBound($aRowArray) - 1) Then
			$avArray[$nRow][$c] = $aRowArray[$c]
		EndIf
	Next
	SetError(0)
	Return (0)
EndFunc   ;==>_ArrayReplace2DRow
Func _ArrayReplace2DRowSt(ByRef $avArray, $aRowString, $nRow = '')
	$aRowArray = _StringSplit_B0($aRowString)
	_ArrayReplace2DRow($avArray, $aRowArray, $nRow)
EndFunc   ;==>_ArrayReplace2DRowSt
Func _ArrayReplace2DColumn(ByRef $avArray, $aRowArray, $nColumn = '')
	Local $number_of_columns = UBound($avArray, 2), $number_of_rows = UBound($avArray), $nSize = 0
	If $number_of_columns < (UBound($aRowArray)) Then $number_of_columns = UBound($aRowArray)
	If $nColumn > $number_of_columns - 1 Then
		ConsoleWrite("ERROR _ArrayReplace2DColumn" & @LF)
		SetError(2)
		Return (2)
	EndIf
	If $number_of_columns < UBound($aRowArray) - 1 Then $number_of_columns = UBound($aRowArray) - 1
	ReDim $avArray[$number_of_rows ][$number_of_columns]
	For $c = 0 To UBound($avArray, 1) - 1
		If Not ($c > UBound($aRowArray) - 1) Then
			$avArray[$c][$nColumn] = $aRowArray[$c]
		EndIf
	Next
	SetError(0)
	Return (0)
EndFunc   ;==>_ArrayReplace2DColumn
Func _ArrayReplace2DColumnSt(ByRef $avArray, $aRowString, $nColumn = '')
	$aRowArray = _StringSplit_B0($aRowString)
	_ArrayReplace2DColumn($avArray, $aRowArray, $nColumn)
EndFunc   ;==>_ArrayReplace2DColumnSt
Func _ArrayDelete2D(ByRef $avArray, $nRow = '')
	Local $number_of_columns = UBound($avArray, 2), $number_of_rows = UBound($avArray), $nSize = 0
	If $nRow > $number_of_rows - 1 Then
		SetError(2)
		Return (2)
	EndIf
	If $number_of_rows == 1 Or StringLower($nRow) == 'all' Then
		ReDim $avArray[1][1]
		$avArray[0][0] = ''
		SetError(0)
		Return (0)
	EndIf
	If $nRow == '' Then
		$avArray[$number_of_rows - 1][0] = ''
		For $x = 0 To $number_of_rows - 1
			If $nSize < UBound($avArray, 2) Then $nSize = UBound($avArray, 2)
		Next
		ReDim $avArray[$number_of_rows - 1][$nSize + 1]
		SetError(0)
		Return (0)
	EndIf
	$avArray[$nRow][0] = ''
	For $x = 0 To $number_of_rows - 1
		If $nSize < UBound($avArray, 2) Then $nSize = UBound($avArray, 2)
	Next
	For $r = $nRow To $number_of_rows - 2
		For $c = 0 To $number_of_columns - 1
			$avArray[$r][$c] = ''
		Next
		$avArray[$r][0] = $avArray[$r + 1][0]
		For $c = 1 To UBound($avArray, 2) - 1
			$avArray[$r][$c] = $avArray[$r + 1][$c]
		Next
	Next
	ReDim $avArray[$number_of_rows - 1][$nSize ]
	SetError(0)
	Return (0)
EndFunc   ;==>_ArrayDelete2D
Func _ArrayInsert2DColumn(ByRef $avArray, $aRowArray = "", $nColumn = '')
	_Array2DTranspose($avArray)
	_ArrayInsert2D($avArray, $aRowArray, $nColumn)
	_Array2DTranspose($avArray)
	Return @error
EndFunc   ;==>_ArrayInsert2DColumn
Func _ArrayInsert2DColumnSt(ByRef $avArray, $aRowString = "", $nColumn = '')
	;$aRowArray = _Stringsplit_B0($aRowString)
	_Array2DTranspose($avArray)
	;_Array2DManage($avArray, $aRowArray,1,$nColumn)
	_ArrayInsert2Dst($avArray, $aRowString, $nColumn)
	_Array2DTranspose($avArray)
	Return @error
EndFunc   ;==>_ArrayInsert2DColumnSt
Func _ArrayDelete2DColumn(ByRef $avArray, $nColumn = '')
	_Array2DTranspose($avArray)
	;_Array2DManage($avArray, "",2,$nColumn)
	_ArrayDelete2D($avArray, $nColumn)
	_Array2DTranspose($avArray)
	Return @error
EndFunc   ;==>_ArrayDelete2DColumn
Func _ArrayToBase1($ar_Array2DF)
	Local $Array_1[UBound($ar_Array2DF) + 1]
	$Array_1[0] = UBound($ar_Array2DF)
	For $i = 1 To UBound($ar_Array2DF)
		$Array_1[$i] = $ar_Array2DF[$i - 1]
	Next
	Return $Array_1
EndFunc   ;==>_ArrayToBase1
Func _ArrayToBase0($ar_Array)
	Local $ar_Array_0[UBound($ar_Array) - 1]
	For $i = 0 To UBound($ar_Array_0) - 1
		$ar_Array_0[$i] = $ar_Array[$i + 1]
	Next
	Return $ar_Array_0
EndFunc   ;==>_ArrayToBase0
Func _StringSplit_B0($s_String, $s_Delimiter = "|", $i_Flag = "0")
	; SYNTAX _StringSplit_0($s_String[,[$s_Delimiter="|"],[$i_Flag="0"]])
	$ar_Array = StringSplit($s_String, $s_Delimiter)
	_ArrayDelete($ar_Array, 0)
	Return $ar_Array
EndFunc   ;==>_StringSplit_B0
Func _Array2DTranspose(ByRef $ar_Array)
	If IsArray($ar_Array) Then
		$code = 'function Array2DTranspose( byref ar2ArrayStrings)'
		$code &= @LF & '	dim j,numb,arExcelValueTrans()'
		$code &= @LF & '		ReDim preserve arExcelValueTrans(UBound(ar2ArrayStrings, 2) ,UBound(ar2ArrayStrings, 1) ) '
		$code &= @LF & '		For j = 0 To UBound(ar2ArrayStrings, 2) '
		$code &= @LF & '			For numb = 0 To UBound(ar2ArrayStrings, 1) '
		$code &= @LF & '				arExcelValueTrans(j,numb) = ar2ArrayStrings(numb,j)'
		$code &= @LF & '			Next'
		$code &= @LF & '		Next'
		$code &= @LF & '	Array2DTranspose=arExcelValueTrans'
		$code &= @LF & 'end function'
		$vbs = ObjCreate("ScriptControl")
		$vbs.language = "vbscript"
		$vbs.addcode ($code)
		$ar_Array = $vbs.run ("Array2DTranspose", $ar_Array)
		$vbs = ""
	EndIf
EndFunc   ;==>_Array2DTranspose
Func _Array2DTransposeAU3(ByRef $ar_Array)
	If IsArray($ar_Array) Then
		Dim $ar_ExcelValueTrans[UBound($ar_Array, 2) ][UBound($ar_Array, 1) ] ;ubound($s_i_ExcelValue,2)-1, ubound($s_i_ExcelValue,1)-1)
		For $j = 0 To UBound($ar_Array, 2) - 1
			For $numb = 0 To UBound($ar_Array, 1) - 1
				$ar_ExcelValueTrans[$j][$numb] = $ar_Array[$numb][$j]
			Next
		Next
		$ar_Array = $ar_ExcelValueTrans
	Else
		;MsgBox(0, "", "No Array to transpose")
	EndIf
EndFunc   ;==>_Array2DTransposeAU3
Func _hndButton_Array1Box_Transpose($hndListView_Array1Box_Display, $ar_Array2DF, $sTitle, $i_StartRow, $i_StartColumn, $i_ZeroRowAsHeader, ByRef $i_Transpose, $Width = 500, $Height = 500, $Left = -1, $Top = -1)
	_LockAndWait()
	$ArrayDimensions = UBound($ar_Array2DF, 0)
	If $ArrayDimensions = 2 Then
		_GUICtrlListViewDeleteAllItems($hndListView_Array1Box_Display)
		If $i_Transpose = 0 Then
			$i_Transpose = 1
			$Dim1 = 2
			$Dim2 = 1
			$sTemp = 'Index'
			For $i = 0 To UBound($ar_Array2DF, $Dim2) - 1
				If $i < 252 Then $sTemp = $sTemp & '|' & $i
			Next
			GUICtrlDelete($hndListView_Array1Box_Display)
			$hndListView_Array1Box_Display = GUICtrlCreateListView($sTemp, 0, 16, $Width, $Height - 40, BitOR($LVS_SHOWSELALWAYS, $LVS_EDITLABELS), BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
			GUICtrlSetResizing($hndListView_Array1Box_Display, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DockBottom))
			For $i = 0 To UBound($ar_Array2DF, $Dim1) - 1
				If $i > 4000 Then ExitLoop
				$sTemp = $ar_Array2DF[0][$i]
				For $j = 1 To UBound($ar_Array2DF, $Dim2) - 1
					If $j = 252 Then ExitLoop
					$sTemp = $sTemp & '|' & $ar_Array2DF[$j][$i]
				Next ;$j
				If $i_ZeroRowAsHeader = 1 And $i = 0 Then
					$sTemp = $sTemp & '|';& '|'
					GUICtrlDelete($hndListView_Array1Box_Display)
					$hndListView_Array1Box_Display = GUICtrlCreateListView("Index|" & $sTemp, 0, 16, $Width, $Height - 40, BitOR($LVS_SHOWSELALWAYS, $LVS_EDITLABELS), BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
					GUICtrlSetResizing($hndListView_Array1Box_Display, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DockBottom))
				EndIf
				If ($i = 0 And $i_StartColumn = 0) Or ($i > 0) Then GUICtrlCreateListViewItem('[' & StringRight('     ' & $i, 4) & ']|' & $sTemp, $hndListView_Array1Box_Display)
				If $i_StartRow Then _GUICtrlListViewHideColumn($hndListView_Array1Box_Display, 1)
			Next ;$i						Next ;$i
		Else
			$i_Transpose = 0
			$Dim1 = 1
			$Dim2 = 2
			$sTemp = 'Index'
			For $i = 0 To UBound($ar_Array2DF, $Dim2) - 1
				If $i < 252 Then $sTemp = $sTemp & '|' & $i
			Next
			GUICtrlDelete($hndListView_Array1Box_Display)
			$hndListView_Array1Box_Display = GUICtrlCreateListView($sTemp, 0, 16, $Width, $Height - 40, BitOR($LVS_SHOWSELALWAYS, $LVS_EDITLABELS), BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
			GUICtrlSetResizing($hndListView_Array1Box_Display, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DockBottom))
			For $i = 0 To UBound($ar_Array2DF, $Dim1) - 1
				If $i > 4000 Then ExitLoop
				$sTemp = $ar_Array2DF[$i][0]
				For $j = 1 To UBound($ar_Array2DF, $Dim2) - 1
					If $j = 252 Then ExitLoop
					$sTemp = $sTemp & '|' & $ar_Array2DF[$i][$j]
				Next ;$j
				If $i_ZeroRowAsHeader = 1 And $i = 0 Then
					$sTemp = $sTemp & '|';& '|'
					GUICtrlDelete($hndListView_Array1Box_Display)
					$hndListView_Array1Box_Display = GUICtrlCreateListView("Index|" & $sTemp, 0, 16, $Width, $Height - 40, BitOR($LVS_SHOWSELALWAYS, $LVS_EDITLABELS), BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
					GUICtrlSetResizing($hndListView_Array1Box_Display, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DockBottom))
				EndIf
				If ($i = 0 And $i_StartRow = 0) Or ($i > 0) Then GUICtrlCreateListViewItem('[' & StringRight('     ' & $i, 4) & ']|' & $sTemp, $hndListView_Array1Box_Display)
				If $i_StartColumn = 1 Then _GUICtrlListViewHideColumn($hndListView_Array1Box_Display, 1)
			Next ;$i
		EndIf
	EndIf
	_ResetLockWait()
EndFunc   ;==>_hndButton_Array1Box_Transpose
Func _ArrayViewText($ar_Array2DF, $sTitle = 'Array Box', $i_StartRow = 0, $i_StartColumn = 0, $i_ZeroRowAsHeader = 0, $i_Transpose = 0, $Width = 800, $Height = 600, $Left = -1, $Top = -1) ;,$Displayindex=1, $ZeroRowAsHeader=0)
;~ Func _ArrayViewText(ByRef $ar_Array2DF, $sTitle = 'Array Box', $i_StartRow = 0, $i_StartColumn = 0, $i_ZeroRowAsHeader = 0, $i_Transpose = 0, $Width = 800, $Height = 600, $Left = -1, $Top = -1) ;,$Displayindex=1, $ZeroRowAsHeader=0)
	;===============================================================================
	;_ArrayViewText($ar3_Array, 'Title',  $i_RowStart, $i_ColumnStart, $i_ZeroRowAsHeader,$Transpose,  $Width, $Height, $Left, $Right)
	; Function Name: _ArrayViewText  ; was _Array1Box()
	; Description: Shows an array in a GUI window. Improved version of _Array1Display
	; Parameter(s): $ar_Array2DF - An array, 1d or 2d, 0-based or 1-based
	; $i_StartRow ; 1 or 0 or 2- tells whether to display first (zero) array row
	; $i_StartColumn ; 1 or 0 or 2- tells whether to display first (zero) array Column
	; $i_Transpose ;1 or 0 - tells when to transpose display
	; $ZeroRowAsHeader ; 1 or 0  tells how to display Header
	; $sTitle - the title to put on the output window
	; $Width, $Height, $Left, $Top - Set the size and position of the output window
	; Requirement(s): $ar_Array2DF must be 1d or 2d.
	; Return Value(s): Integer, 0 or more = 0-based index of selected item
	;                  -1 = no item was selected
	;                  Error=1 = $ar_Array2DF is not an array
	; Author(s): Mike Ratzlaff <mike@ratzlaff.org> // modified randall Clapp <randallc@ozemail.com.au>
	; Revision: 20050728A
	;
	;===============================================================================
	Local $AllDone = 0, $msg, $i, $j, $ArrayMax, $sTemp
	Local $hndForm_Array1Box_Main, $hndListView_Array1Box_Display, $hndButton_Array1Box_Close
	Local $sTxtFile, $i_TempStartColumn = 0
	$Dim1 = 1
	$Dim2 = 2
	If UBound($ar_Array2DF, 2) <= 1 And (StringInStr($ar_Array2DF[0], "|") Or StringInStr($ar_Array2DF[1], "|")) Then
		$ar_Array2d = _Array2DCreateFromArraySt($ar_Array2DF)
		$ar_Array2DF = $ar_Array2d
	EndIf
	$ArrayDimensions = UBound($ar_Array2DF, 0)
	If $i_Transpose = 1 Then
		$Dim1 = 2
		$Dim2 = 1
	EndIf
	If ($i_Transpose = 1 And $i_StartRow = 1) Or ($i_Transpose = 0 And $i_StartColumn = 1) Then
		$i_TempStartColumn = 1
	EndIf
	If $ArrayDimensions = 0 Then
		SetError(1)
		Return 'Given variable is not an array'
	EndIf
	Select
		Case $ArrayDimensions = 1
			$ArrayMax = UBound($ar_Array2DF) - 1
		Case $ArrayDimensions = 2
			$ArrayMax = UBound($ar_Array2DF, $Dim1) - 1
	EndSelect
	If $Height < 100 Then $Height = 100
	If $Width < 500 Then $Width = 500
	$hndForm_Array1Box_Main = GUICreate($sTitle, $Width, $Height, $Left, $Top, $WS_OVERLAPPEDWINDOW + $WS_VISIBLE + $WS_CLIPSIBLINGS)
	Local $editCtrl = "Edit1";name of the Edit control that pops up when edit a listitem....
	Local $editFlag = 0, $start, $diff, $doubleclicked;, $msg, $listview, $Gui
	If $ArrayDimensions = 1 Then
		$sTemp = 'Index|Value'
	ElseIf $ArrayDimensions = 2 Then
		$sTemp = 'Index'
		For $i = $i_TempStartColumn To UBound($ar_Array2DF, $Dim2) - 1
			$sTemp = $sTemp & '|' & $i
		Next
	EndIf
	GUICtrlCreateLabel('Basic Array Rows = (' & UBound($ar_Array2DF) & ')' & '.....Basic Array Columns = (' & UBound($ar_Array2DF, 2) & ')', 0, 0, $Width, 16)
	GUICtrlSetResizing(-1, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DOCKHEIGHT))
	$hndListView_Array1Box_Display = GUICtrlCreateListView($sTemp, 0, 16, $Width, $Height - 40, BitOR($LVS_SHOWSELALWAYS, $LVS_EDITLABELS), BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
	GUICtrlSetResizing($hndListView_Array1Box_Display, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DockBottom))
	;Create Controls, Show GUI
	$hndButton_Array1Box_Close = GUICtrlCreateButton('&Close', $Width - 80, $Height - 24, 70, 24)
	GUICtrlSetResizing($hndButton_Array1Box_Close, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	GUICtrlSetState($hndButton_Array1Box_Close, BitOR($GUI_DefButton, $GUI_FOCUS))
	$hndButton_Array1Box_Transpose = GUICtrlCreateButton('&Transpose', $Width - 160, $Height - 24, 70, 24)
	GUICtrlSetResizing($hndButton_Array1Box_Transpose, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	GUICtrlSetState($hndButton_Array1Box_Transpose, ($GUI_DefButton))
	$hndButton_Array1Box_Header = GUICtrlCreateButton('&Header', $Width - 240, $Height - 24, 70, 24)
	GUICtrlSetResizing($hndButton_Array1Box_Header, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	GUICtrlSetState($hndButton_Array1Box_Header, ($GUI_DefButton))
	$hndButton_Array1Box_ZeroRow = GUICtrlCreateButton('&ZeroRow', $Width - 320, $Height - 24, 70, 24)
	GUICtrlSetResizing($hndButton_Array1Box_ZeroRow, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	GUICtrlSetState($hndButton_Array1Box_ZeroRow, ($GUI_DefButton))
	$hndButton_Array1Box_ZeroColumn = GUICtrlCreateButton('&ZeroColumn', $Width - 400, $Height - 24, 70, 24)
	GUICtrlSetResizing($hndButton_Array1Box_ZeroColumn, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	GUICtrlSetState($hndButton_Array1Box_ZeroColumn, ($GUI_DefButton))
	$hndButton_Array1Box_TextSelect = GUICtrlCreateButton('&Text' & 'Selected', $Width - 480, $Height - 24, 70, 24)
	GUICtrlSetResizing($hndButton_Array1Box_TextSelect, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	GUICtrlSetState($hndButton_Array1Box_TextSelect, ($GUI_DefButton))
	;$hndButton_Array1Box_ExcelSelect = GUICtrlCreateButton('&Excel' & 'Selected', $Width - 280, $Height - 24, 80, 24)
	;GUICtrlSetResizing($hndButton_Array1Box_ExcelSelect, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	;GUICtrlSetState($hndButton_Array1Box_ExcelSelect, ($GUI_DefButton))
	GUISetState(@SW_SHOW, $hndForm_Array1Box_Main)
	Dim $B_DESCENDING[_GUICtrlListViewGetSubItemsCount($hndListView_Array1Box_Display) ]
	;Display Array
	Select
		Case $ArrayDimensions = 1  ;1-Dimensional Array
			For $i = 0 To $ArrayMax
				If $i > 4000 Then ExitLoop
				GUICtrlCreateListViewItem($i & '|' & $ar_Array2DF[$i], $hndListView_Array1Box_Display)
			Next  ;$i
		Case ($ArrayDimensions = 2) ;And ($i_Transpose = 0) and $i_StartColumn=1000;2-Dimensional Array
			;==============================================================================================
			_LockAndWait()
			$sTemp = 'Index'
			For $i = 0 To UBound($ar_Array2DF, 2) - 1
				If $i < 252 Then $sTemp = $sTemp & '|' & $i
			Next
			GUICtrlDelete($hndListView_Array1Box_Display)
			$hndListView_Array1Box_Display = GUICtrlCreateListView($sTemp, 0, 16, $Width, $Height - 40, BitOR($LVS_SHOWSELALWAYS, $LVS_EDITLABELS), BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
			GUICtrlSetResizing($hndListView_Array1Box_Display, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DockBottom))
			For $i = 0 To UBound($ar_Array2DF, 1) - 1
				If $i > 4000 Then ExitLoop
				$sTemp = $ar_Array2DF[$i][0]
				For $j = 1 To UBound($ar_Array2DF, 2) - 1
					If $j = 252 Then ExitLoop
					$sTemp = $sTemp & '|' & $ar_Array2DF[$i][$j]
				Next ;$j
				GUICtrlCreateListViewItem('[' & StringRight('     ' & $i, 4) & ']|' & $sTemp, $hndListView_Array1Box_Display)
			Next ;$i
			If ($ArrayDimensions = 2) And ($i_Transpose = 1) Then
				$i_Transpose = _Iif($i_Transpose = 1, 0, 1)
				_hndButton_Array1Box_Transpose($hndListView_Array1Box_Display, $ar_Array2DF, $sTitle, $i_StartRow, $i_StartColumn, $i_ZeroRowAsHeader, $i_Transpose, $Width, $Height, $Left, $Top)
			Else
				_ResetLockWait()
			EndIf
			;==============================================================================================
		Case Else ;Unhandled Type
	EndSelect
	Do
		$dll = DllOpen("user32.dll")
		$msg = GUIGetMsg(1)
		If $msg[0] = $GUI_EVENT_PRIMARYDOWN Then
			Local $focus = ControlGetFocus(WinGetTitle($hndForm_Array1Box_Main))
			If (StringInStr($focus, "SysListView3")) Then
				$diff = TimerDiff($start)
				; Read the current mouse-doubleclick-settings from registry
				$mousespeed = RegRead("HKCU\Control Panel\Mouse", "DoubleClickSpeed")
				If $mousespeed = "" Then $mousespeed = 500
				If $diff < $mousespeed And $doubleclicked = 0 Then
					DllClose($dll)
					$ar_Items = _GUICtrlListViewGetItemTextArray($hndListView_Array1Box_Display)
					If IsArray($ar_Items) Then
						$rowIndex = Number(StringReplace(StringReplace($ar_Items[1], "[", ""), "]", ""))
						If ($rowIndex > -1) Then
							$ar_SingleArray = _Array2DToDau3($ar_Array2DF, $sTitle, 0, $rowIndex , ($i_Transpose = 0))
							_Main($ar_SingleArray)
							$sTemp = _ArrayToString($ar_SingleArray, "|")
							If $i_Transpose = 1 Then _ArrayReplace2DColumnSt($ar_Array2DF, $sTemp, $rowIndex)
							If $i_Transpose = 0 Then _ArrayReplace2DRowSt($ar_Array2DF, $sTemp, $rowIndex)
							$i_Check= (($i_Transpose = 0) * ($i_StartColumn)) Or (($i_Transpose) * ($i_StartRow))
							$i_Check = _Iif($i_Check = True, 1, 0)
							_GUICtrlListViewInsertItem($hndListView_Array1Box_Display, $rowIndex, '[' & StringRight('     ' & $rowIndex, 4) & ']|' & $sTemp)
							_GUICtrlListViewDeleteItemsSelected($hndListView_Array1Box_Display)
							$dll = DllOpen("user32.dll")
							$doubleclicked = 1
						EndIf
					EndIf
				Else
					$doubleclicked = 0
				EndIf
				$start = TimerInit()
			EndIf
		EndIf
		Select
			Case $msg[0] = $GUI_EVENT_CLOSE
				$AllDone = 1
			Case $msg[0] = $hndButton_Array1Box_Close
				$AllDone = 1
			Case $msg[0] = $hndButton_Array1Box_Header
				$i_ZeroRowAsHeader = _Iif($i_ZeroRowAsHeader = 1, 0, 1)
				$i_Transpose = _Iif($i_Transpose = 1, 0, 1)
				_hndButton_Array1Box_Transpose($hndListView_Array1Box_Display, $ar_Array2DF, $sTitle, $i_StartRow, $i_StartColumn, $i_ZeroRowAsHeader, $i_Transpose, $Width, $Height, $Left, $Top)
			Case $msg[0] = $hndButton_Array1Box_ZeroRow
				$i_StartRow = _Iif($i_StartRow = 1, 0, 1)
				If $i_StartRow And Not $i_Transpose Then     ;$i_StartRow=0
					_GUICtrlListViewDeleteItem($hndListView_Array1Box_Display, 0)
				ElseIf $i_StartRow Then 	;$i_StartRow=0
					_GUICtrlListViewHideColumn($hndListView_Array1Box_Display, 1)
				Else 	;really $i_StartRow=1, but here  $i_StartRow=0
					$ar_SingleArray = _Array2DToDau3($ar_Array2DF, $sTitle, 0, 0 , ($i_Transpose = 0))
					$i_Check= ($i_Transpose = 1) * ($i_StartRow = 1); rem these are around wrong way
					$i_Check = _Iif($i_Check = True, 1, 0)
					$sTemp = _ArrayToString($ar_SingleArray, "|", $i_Check)
					If $i_Transpose = 0 Then _GUICtrlListViewInsertItem($hndListView_Array1Box_Display, 0, '[' & StringRight('     ' & 0, 4) & ']|' & $sTemp)
					If $i_Check = 0 Then
						_GUICtrlListViewSetColumnWidth($hndListView_Array1Box_Display, 1, $LVSCW_AUTOSIZE);$LVSCW_AUTOSIZE
					EndIf
				EndIf
			Case $msg[0] = $hndButton_Array1Box_ZeroColumn
				$i_StartColumn = _Iif($i_StartColumn = 1, 0, 1)
				If $i_StartColumn And $i_Transpose Then
					_GUICtrlListViewDeleteItem($hndListView_Array1Box_Display, 0)
				ElseIf $i_StartColumn Then
					_GUICtrlListViewHideColumn($hndListView_Array1Box_Display, 1)
				Else
					$ar_SingleArray = _Array2DToDau3($ar_Array2DF, $sTitle, 0, 0 , ($i_Transpose = 0))
					$i_Check= ($i_Transpose = 1) * ($i_StartColumn = 1); rem these are around wrong way
					$i_Check = _Iif($i_Check = True, 1, 0)
					$sTemp = _ArrayToString($ar_SingleArray, "|", $i_Check)
					If $i_Transpose = 1 Then _GUICtrlListViewInsertItem($hndListView_Array1Box_Display, 0, '[' & StringRight('     ' & 0, 4) & ']|' & $sTemp)
					If $i_Check = 0 Then
						_GUICtrlListViewSetColumnWidth($hndListView_Array1Box_Display, 1, $LVSCW_AUTOSIZE);$LVSCW_AUTOSIZE
					EndIf
				EndIf
			Case $msg[0] = $hndButton_Array1Box_Transpose
				_hndButton_Array1Box_Transpose($hndListView_Array1Box_Display, $ar_Array2DF, $sTitle, $i_StartRow, $i_StartColumn, $i_ZeroRowAsHeader, $i_Transpose, $Width, $Height, $Left, $Top)
			Case $msg[0] = $hndButton_Array1Box_TextSelect
				$sTxtFile = @ScriptDir & "\ListView.txt"
				Local $a_indices = _GUICtrlListViewGetSelectedIndices($hndListView_Array1Box_Display, 1)
				If (IsArray($a_indices)) Then
					Local $i
					$f = FileOpen($sTxtFile, 2)
					For $i = 1 To $a_indices[0]
						$ExcelLine = StringReplace(_GUICtrlListViewGetItemText($hndListView_Array1Box_Display, $a_indices[$i]), "|", @TAB)
						FileWriteLine($f, $ExcelLine)
					Next
					FileClose($f);
				EndIf
				RunWait("Notepad.exe " & $sTxtFile)
			Case $msg[0] = $hndListView_Array1Box_Display
				$i_OrderNumber = GUICtrlGetState($hndListView_Array1Box_Display) ;Sort the list by the column header clicking
				GUISetState(@SW_LOCK)
				_GUICtrlListViewSort($hndListView_Array1Box_Display, $B_DESCENDING, GUICtrlGetState($hndListView_Array1Box_Display))
				GUISetState(@SW_UNLOCK)
;~ 				GUISetState(@SW_LOCK)
;~ 				_GUICtrlListViewSort ($hndListView_Array1Box_Display, $B_DESCENDING, GUICtrlGetState($hndListView_Array1Box_Display))
;~ 				GUISetState(@SW_UNLOCK)
		EndSelect
		DllClose($dll)
	Until $AllDone
	;Destroy GUI, Return index of selected item
	$i = ControlListView(WinGetTitle($sTitle), '', $hndListView_Array1Box_Display, "GetSelected")
	If $i = '' Then $i = -1
	GUIDelete($hndForm_Array1Box_Main)
	Return $i
EndFunc   ;==>_ArrayViewText
Func _MonitorEditState(ByRef $h_gui, ByRef $editCtrl, ByRef $editFlag, ByRef $listview, ByRef $dll, ByRef $msg, ByRef $start, ByRef $diff, ByRef $doubleclicked)
	If $msg[0] = $GUI_EVENT_PRIMARYDOWN Then
		Local $focus = ControlGetFocus(WinGetTitle($h_gui))
		Local $pos = ControlGetPos($h_gui, "", $focus)
		Local $mpos = MouseGetPos()
		If ControlCommand($h_gui, "", $editCtrl, "IsVisible", "") Then
			If $mpos[0] < $pos[0] Or $mpos[0] > $pos[0] + $pos[2] Or _
					$mpos[1] < $pos[1] Or $mpos[1] > $pos[1] + $pos[3] Then
				CancelEdit($listview)
				$editFlag = 0
			EndIf
		Else
			If (StringInStr($focus, "SysListView3")) Then
				$diff = TimerDiff($start)
				; Read the current mouse-doubleclick-settings from registry
				$mousespeed = RegRead("HKCU\Control Panel\Mouse", "DoubleClickSpeed")
				If $mousespeed = "" Then $mousespeed = 700
				If $diff < $mousespeed And $doubleclicked = 0 Then
					Rename($listview)
					$doubleclicked = 1
				Else
					$doubleclicked = 0
				EndIf
				$start = TimerInit()
			EndIf
		EndIf
	EndIf
	Local $pressed = _IsPressedMod($dll)
	If $editFlag And $pressed = 13 Then; pressed enter
		Update($h_gui, $editCtrl, $listview)
	ElseIf $editFlag And $pressed = 27 Then; pressed esc
		CancelEdit($listview)
		$editFlag = 0
	ElseIf Not $editFlag And $pressed = 113 Then; pressed f2
		Rename($listview)
		$editFlag = 1
	EndIf
	Sleep(50)
	If ControlCommand($h_gui, "", $editCtrl, "IsVisible", "") Then
		If $editFlag = 0 Then
			$editFlag = 1
			Rename($listview)
		EndIf
	Else
		$editFlag = 0
	EndIf
EndFunc   ;==>_MonitorEditState
Func Rename(ByRef $listview)
	Local $itemIndex = _GUICtrlListViewGetCurSel($listview)
	GUICtrlSendMsg($listview, $LVM_EDITLABEL, $itemIndex, 0)
	HotKeySet("{Enter}", "Enter")
EndFunc   ;==>Rename
Func _Main(ByRef $Array1)
	Local $editCtrl = "Edit1";name of the Edit control that pops up when edit a listitem....
	Local $editFlag = 0, $listview, $Gui, $start, $diff, $doubleclicked, $msg
	$Gui = GUICreate("Edit-able ListViewItems")
	$CloseButton = GUICtrlCreateButton("Close", 300, 300, 100, 20)
	$listview = GUICtrlCreateListView("Items", 10, 10, 300, 200, $LVS_EDITLABELS);Important Style!!!
	; Populate list and make it wide enough to see
	For $i = 0 To UBound($Array1) - 1
		GUICtrlCreateListViewItem($Array1[$i], $listview)
	Next
	GUICtrlSendMsg($listview, 0x101E, 0, -1);$listview, LVM_SETCOLUMNWIDTH, 0,  resize to widest value
	GUISetState(@SW_SHOW)
	$dll = DllOpen("user32.dll")
	While 1
		$msg = GUIGetMsg(1)
		_MonitorEditState($Gui, $editCtrl, $editFlag, $listview, $dll, $msg, $start, $diff, $doubleclicked)
		Select
			Case $msg[0] = $GUI_EVENT_CLOSE Or $msg[0] = $CloseButton
				For $i = 0 To _GUICtrlListViewGetItemCount($listview) - 1
					$Array1[$i] = _GUICtrlListViewGetItemText($listview, $i)
				Next
				GUIDelete($Gui)
				ExitLoop
			Case Else
		EndSelect
	WEnd
	DllClose($dll)
EndFunc   ;==>_Main
Func Enter()
	; just a dummy function
EndFunc   ;==>Enter
Func Update(ByRef $h_gui, ByRef $editCtrl, ByRef $listview)
	Local $newText = ControlGetText($h_gui, "", $editCtrl)
	Local $item = GUICtrlRead($listview)
	GUICtrlSetData($item, $newText)
	HotKeySet("{Enter}")
	Send("{Enter}");quit edit mode
	$editFlag = 0
	$update = 0
EndFunc   ;==>Update
Func CancelEdit(ByRef $listview)
	GUICtrlSendMsg($listview, $LVM_CANCELEDITLABEL, 0, 0)
EndFunc   ;==>CancelEdit
Func _IsPressedMod($dll = "user32.dll")
	Local $aR, $bRv, $hexKey, $i
	For $i = 8 To 128
		$hexKey = '0x' & Hex($i, 2)
		$aR = DllCall($dll, "int", "GetAsyncKeyState", "int", $hexKey)
		If $aR[0] <> 0 Then Return $i
	Next
	Return 0
EndFunc   ;==>_IsPressedMod
Func _LockAndWait()
	Local $Cursor_WAIT
	GUISetState(@SW_LOCK)
	GUISetCursor($Cursor_WAIT, 1)
EndFunc   ;==>_LockAndWait
Func _ResetLockWait()
	Local $Cursor_ARROW
	GUISetState(@SW_UNLOCK)
	GUISetCursor($Cursor_ARROW, 1)
EndFunc   ;==>_ResetLockWait