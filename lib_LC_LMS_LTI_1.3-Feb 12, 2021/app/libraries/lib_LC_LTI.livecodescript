script "lib_LC_LTI"
## This stack will hold all of the commands to integrate with a Library

constant libraryVersion = 0.2
local sVersionsA, sURL, sOrg

getProp sURL
   return sURL
end sURL

function getlib_LC_LTI_version
   return libraryVersion
end getlib_LC_LTI_version

command libLC_LTI_SendoAuthCredentials pUserName, pPassword, pAppID
   ## using the lesson on oAuth2
   ## http://lessons.livecode.com/m/2592/l/671591-how-do-i-use-the-oauth2-library
   ## replicate the authorization on the D2L API Test Tool 
   ## https://apitesttool.desire2learnvalence.com/
   ## try out authentication there to see what values you send and what is
   ## returned  then try to replicate what happens there in this stack.
   
   ## To me it looked like AppKey, UserID and UserKey are sent. 
   ## so then these need to be stored for used in sending requests.
   
   set the cAppKey of this stack to tAppkey
   set the cUserID of this stack to tUserID
   set the cUserKey of this stack to tUserkey
   
   
   ## Note from D2L API Test Tool: 
   ## To authenticate against the test server, you can user 
   ## username "DevCoPStudent" and 
   ## password "/10T41.Vf\0w~=O". 
   
   
   #This is just test code.
   answer "My Credentials are:"  && pUserName & comma && pPassword
   ## once credentials are authorized then open main window.
   go stack "Main window"
end libLC_LTI_SendoAuthCredentials


## VERSIONS

## the /d2l/api/versions command does not need authorization
## you need to call this before authorizing to see what the Versions value is.
## You need the versions for each of the products to be able to create request
function libLC_LTI_Get.versions
   put "/d2l/api/versions/" into tRequest
   put "https://" & the cHost of this stack & tRequest into sURL
   put URL sURL into tResponse
   put JSONToArray(tResponse) into sVersionsA
   return sVersionsA
end libLC_LTI_Get.versions

## This returns the latest version of the product passed in the parameter pProduct
function libLC_LTI_FindLatestProductVersion pProduct
   put 0 into tIndex
   repeat for each key tKey in sVersionsA
      if pProduct = sVersionsA[tKey]["ProductCode"] then
         put sVersionsA[tKey]["LatestVersion"] into tLatestVersion
         if tLatestVersion is not empty then
            return tLatestVersion
         end if
         exit repeat
      end if
   end repeat
end libLC_LTI_FindLatestProductVersion

function libLC_LTI_POST.versions.check pData
   put "/d2l/api/versions/check" into tRequest
   put "https://" & the cHost of this stack & tRequest into sURL
   set the httpHeaders to "Content-type: application/json"
   post pData to sURL
   if the result is empty then
      put JSONToArray(it) into tResponse
      put ArrayToJSON(tResponse, "string", true) into tResponsePretty
      return tResponsePretty
   else
      return the result
   end if
end libLC_LTI_POST.versions.check

## OrgUnitID
## for many functions you need the the OrgUnitID as part of the request.

function libLC_LTI_Get.lp.ver.organization.info
   ## TODO complete the code for this request
   ## Here is hwat you need to do to 
   ## write the code to determine organization ID
   
   ## Try this in the API Test Tool
   ## /d2l/api/lp/(version)/organization/info
   
   ## Note you need to fill in the (version) so you have to call
   ## getProductVersions(tProduct)
   ## tProduct is the third item in the path in this case it is 'lp'
   put "/d2l/api/lp/(version)/organization/info" into tRequestPath
   ## use the itemdelimiter to be able to access parts of a string.
   set the itemDelimiter to "/"
   put item 4 of tRequestPath into tProduct
   ## now use tProduct to get the product version
   put getProductVersions(tproduct) into tVersion
   ##  You have different options with how to put the version into the path
   ##   - You can now insert the version into item 5 of the path.
   put tversion into item 5 of tRequestPath
   ##   - you can use replace
   ##      replace "versions" with tVersion in tRequestPath
   ##   - you can concatenate the parts of the URL
   ##      put "/d2l/api/lp/" & tVersion & "/organization/info" into tRequestPath
   
   ## TODO
   ## Once you have the Requestpath you can then follow same steps in libLC_LTI_Get.versions
   ## - create the URL tURL
   ## - send URL request
   ## - get the Organization ID from the returned JSON document
   
   ## to do trouble shooting you can see the URL you can use the put command.  
   ## That will put it in the message box.  You can copy it from there and put it in browser to
   ## see if it works there.
   put tURL  # This puts the URL you created tURL into the message box
   
   ## Because the OrgUnitID cant be retrieved right now because we are not getting authorization
   ## then just return the one on the API test tool  '6606'
   return sOrgUnitID
end libLC_LTI_Get.lp.ver.organization.info


## TODO: first work on a template handler that can be used for 
## writing all commands.

on libLC_LTI_Get.le.version.orgUnitId.grades
   ## TODO 
   ##  write the code here to add the version and orgUnitID for this path
   ##  /d2l/api/le/(version)/(orgUnitId)/grades/
   ## to create tRequestPath
   
   ## then call libLC_LTI_SendGETrequest with that as a parameter.
   
   ## then send it to 
end libLC_LTI_Get.le.version.orgUnitId.grades
   
   ## TODO
   ## do the same as the above handler for all of the LTIadvantage commands listed below
   
   -- /d2l/api/le/(version)/ltiadvantage/deployment/ [GET]	
   -- /d2l/api/le/(version)/ltiadvantage/deployment/ [POST]	
   -- /d2l/api/le/(version)/ltiadvantage/deployment/(deploymentId) [DELETE]	
   -- /d2l/api/le/(version)/ltiadvantage/deployment/(deploymentId) [GET]	
   -- /d2l/api/le/(version)/ltiadvantage/deployment/(deploymentId) [PUT]	
   -- /d2l/api/le/(version)/ltiadvantage/deployment/(deploymentId)/sharing/ [DELETE]	
   -- /d2l/api/le/(version)/ltiadvantage/deployment/(deploymentId)/sharing/ [GET]	
   -- /d2l/api/le/(version)/ltiadvantage/deployment/(deploymentId)/sharing/ [POST]	
   -- /d2l/api/le/(version)/ltiadvantage/deployment/(deploymentId)/sharing/(sharingOrgUnitId) [DELETE]	
   -- /d2l/api/le/(version)/ltiadvantage/deployment/(deploymentId)/sharing/(sharingOrgUnitId) [PUT]	
   -- /d2l/api/le/(version)/ltiadvantage/links/organization/ [GET]	
   -- /d2l/api/le/(version)/ltiadvantage/links/organization/ [POST]	
   -- /d2l/api/le/(version)/ltiadvantage/links/organization/(linkId) [GET]	
   -- /d2l/api/le/(version)/ltiadvantage/links/organization/(linkId) [PUT]	
   -- /d2l/api/le/(version)/ltiadvantage/links/orgunit/(orgUnitId)/ [GET]	
   -- /d2l/api/le/(version)/ltiadvantage/links/orgunit/(orgUnitId)/ [POST]	
   -- /d2l/api/le/(version)/ltiadvantage/links/orgunit/(orgUnitId)/(linkId) [DELETE]	
   -- /d2l/api/le/(version)/ltiadvantage/links/orgunit/(orgUnitId)/(linkId) [GET]	
   -- /d2l/api/le/(version)/ltiadvantage/links/orgunit/(orgUnitId)/(linkId) [PUT]	
   -- /d2l/api/le/(version)/ltiadvantage/migration/links/(linkId) [POST]	
   -- /d2l/api/le/(version)/ltiadvantage/registration/ [GET]	
   -- /d2l/api/le/(version)/ltiadvantage/registration/ [POST]	
   -- /d2l/api/le/(version)/ltiadvantage/registration/(clientId) [DELETE]	
   -- /d2l/api/le/(version)/ltiadvantage/registration/(clientId) [GET]	
   -- /d2l/api/le/(version)/ltiadvantage/registration/(clientId) [PUT]
   
   
   command libLC_LTI_SendGETrequest pRequest
   ## you will need to have a different type of handler to handle each type of
   ## request.  IE this is for GET,  you would need a different one for POST etc.
   
   put field "request" into tRequest
   put  "https://" & the cHost of this stack &\
         tRequest & \
         "?" & \
         "x_a=" & the cAppID of this stack & "q" & \
         "x_b=" & the cUserID of this stack  & "q" & \
         "x_c=" & the cAppKey of this stack  & "q" & \
         "x_d=" & the cUserKey of this stack & "q" & \
         "x_t=" & the seconds & "q"\
         into tURL
   put tURL into field "Request URL"
   put URL tURL into field "response"
   ## add the 
end libLC_LTI_SendGETrequest

command libLC_LTI_SendPOSTrequest pRequest
   ## TODO Write code to create and handle a POST request
end libLC_LTI_SendPOSTrequest


function _SignString pKey, pString
   ## see https://docs.valence.desire2learn.com/basic/auth.html for
   ## explanation of format.
   put textencode(pKey,"UTF-8") into tKeyBytes
   put textencode(pString,"UTF-8") into tBaseStringBytes
   put messageDigest(tKeybytes & tBaseStringBytes, "SHA-256") into tSignatureHash
   put base64encode(tSignatureHash) into tSignatureBytes
   replace "/" with "_" in tSignatureBytes
   replace "+" with "-" in tSignatureBytes
   replace "=" with "" in tSignatureBytes -- no padding
   return tSignatureBytes
end _SignString


