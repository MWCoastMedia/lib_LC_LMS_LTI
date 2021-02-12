script "Login stack Behavior"
constant cAuthURL = "https://auth.brightspace.com/oauth2/auth"
constant cTokenURL = "https://auth.brightspace.com/core/connect/token"
constant kClientID = "31brpbcCLsVim_K4jJ8vzw"
constant kClientSecret = "sagYSTT_HOts39qrGQTFWA"
## scopes can be found here https://docs.valence.desire2learn.com/http-scopestable.html
constant kScopes = "incoming-webhook"
constant kPort = 53986


on openStack
   put empty into field "userName" of card "oAuth"
   put empty into field "Password" of card "oAuth"
   go card "oAuth"
end openStack

on sendCredentials pType, pUserName, pPassword
   answer "Loging in using" && pType && "as" && pUserName && "with" && pPassword & "."
   --   put "DevCoPStudent" & ":" & "/10T41.Vf\0w~=O" into tLoginCredentials
   --   post data to URL "https://devcop.brightspace.com/d2l/lp/auth/login/login.d2l"
   --   if the result is not empty then
   --      answer the result
   --   else 
   --      answer it
   --   end if
   go stack "Main Window"
end sendCredentials
