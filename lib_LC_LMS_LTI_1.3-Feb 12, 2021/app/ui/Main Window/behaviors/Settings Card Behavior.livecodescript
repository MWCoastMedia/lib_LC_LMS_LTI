script "Settings Card Behavior"
on mouseup
   if the short name of the target is the short name of this card of me then
      exit mouseUp
   end if
   switch the short name of the target
      case "Create Requests"
         go card "Requests"
         break
   end switch
end mouseup


## The following was to Connect to Slack
--constant kAuthURL = "https://slack.com/oauth/authorize"
--constant kTokenURL = "https://slack.com/api/oauth.access"
--constant kClientID = "XXXXXXXXX.XXXXXXXX"
--constant kClientSecret = "XXXXXXXXXXXXXXXXXXXXX"
--constant kScopes = "incoming-webhook"
--constant kPort = 53004
--local sAuth

--on openstack
--   put getlib_LC_LTI_version() into field "lib_LC_LTI_version" of card 1 of this stack
--end openstack


--on getOauth2Tokens
--   if sAuth["access_token"] is empty then
--      OAuth2 kAuthURL, kTokenURL, kClientID, kClientSecret, kScopes, kPort
--      if the result is not empty then
--         return "Not authorized!" for error
--      else
--         put it into sAuth
--      end if
--   end if
--end getOauth2Tokens

--command resetoAuth2Values
--   set the cHost of this stack to field "host"
--   set the cAppID of this stack to field "App ID"
--   set the cUserID of this stack to empty
--   put empty into field "User ID"
--   set the cPort of this stack to empty
--   put empty into field "Port"
--   set the cAppKey of this stack to empty
--   put empty into field "App key"
--   set the cUserKey of this stack to empty
--   put empty into field "User Key"
--end resetoAuth2Values
