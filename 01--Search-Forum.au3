

; Click to a search page, enter criteria and submit.

;   This sample code will:
;   1) Create a new browser window
;   2) Navigate to http://www.autoitscript.com
;   3) click on the 'forum' link
;   4) click on the 'Search' link
;   5) get the object reference for the form named 'sForm'
;   6) get the object reference for the form field 'keywords' in the form 'sForm'
;   7) enter the value 'ReadyState' into the 'keywords' field
;   8) submit the form to return the search results

#include <IE.au3>



#Region --- IE-Builder generated code Start ---

$o_IE = _IECreate ()
_IENavigate ($o_IE, "http://autoitscript.com")

_IELinkClickByText ($o_IE, "forum")
_IELoadWait($o_IE)
_IELinkClickByText ($o_IE, "Forums")
_IELoadWait($o_IE)
Sleep(1500)
_IELinkClickByText ($o_IE, "Search")
_IELoadWait($o_IE)
Sleep(1000)
_IELinkClickByText ($o_IE, "More Search Options")
_IELoadWait($o_IE)

$o_SearchForm = _IEFormGetObjByName ($o_IE, "sForm")
$o_Keywords = _IEFormElementGetObjByName ($o_SearchForm, "keywords")

_IEFormElementSetValue ($o_Keywords, "Valuater")
_IEFormSubmit ($o_SearchForm)

#EndRegion --- IE-Builder generated code End ---
