script "Requests Card Behavior"
on openCard
   put empty into field "data"
   put empty into field "response"
end openCard

on sendRequest pHTTPMethod
   put field "request" of me into tRequest
   
   ## for each of the HTTP Methods there will be a different way
   ## of creating a request so you will need a different Handler for each of these. 
   ## I have created a calls for GET and POST to handlers in the library  
   switch pHTTPMethod
      case "GET"
         libLC_LTI_SendGETrequest tRequest
         break
      case "POST"
         libLC_LTI_SendPOSTrequest tRequest
         break
     
   end switch
   
   ## You will also need to show and hide fields on this card
   ## for example if it is a POST you need to show a card to enter the data
   ## that will be posted.
   ## For now we are not uploading files so just need a field or fields to enter 
   ## text data for testing.
   
   
   ## In each Switch case you can then call a handler
   ## that you create that carries out the request 
   ## These handlers would be in the library Stack "lib_LC_LTI"
   
end sendRequest


on mouseup
   if the short name of the target is the short name of this card of me then exit mouseup
   switch the short name of the target
      case "Get Product Versions"
         getProductVersions
         break
      case "Find Product Version"
         findProductVersion
         break
      case "versions check"
         versionsCheck
         break
   end switch
end mouseup

command getProductVersions
   ## this should be done in the openstack handler so that the array 
   ## of productVersions is loaded for future requests.
   put "/d2l/api/versions/" into field "request"
   set the hilitedButton of group "HTTP Method" to 1 ## set to GET
   put empty into field "response"
   put empty into field "data"
   wait 1 seconds ## this is just so you can see the Response field empty and then new text added
   put libLC_LTI_Get.versions() into tVersionsArray
   put ArrayToJSON(tVersionsArray, "string", true) into field "response"
   get the sURL of stack "lib_LC_LTI"
   put it into field "Request URL"
end getProductVersions

command findProductVersion
   ask "Enter Product Code to find latest version." & CR & " eg 'lp'"
   put libLC_LTI_FindLatestProductVersion(it) into tLatestProductVersion
   if tLatestProductVersion is not empty then
      answer tLatestProductVersion
   else
      answer "Product Code is invalid."
   end if
end findProductVersion

command versionsCheck
   put field "Data" into tData
   put libLC_LTI_POST_versions_check(tData)into field "Response"
end versionsCheck
