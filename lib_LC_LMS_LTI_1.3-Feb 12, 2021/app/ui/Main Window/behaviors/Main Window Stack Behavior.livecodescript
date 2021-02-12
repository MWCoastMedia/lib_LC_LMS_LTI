script "Main Window Stack Behavior"
## Here I am using constants for baseURL and port but you could also use the
## custom properties cHost and cPort

## This is to Connect to Brightspace
constant kBaseURL = "https://devcop.brightspace.com"
constant kPort = "53443"
constant klib_LC_LTI_version = "0.2"

on resetOAuth2Values
   put kBaseURL into field "Host" of this card
   put "" into field "App ID" of this card
   put "" into field "User ID" of this card
   put kPort into field "Port" of this card
   put "" into field "App Key" of this card
   put "" into field "User Key" of this card
end resetOAuth2Values

on getURI pURL
   put kBaseURL & field "request" & colon & kPort into tCommandURL
   get Url tCommandURL
   put it into tResponse
   answer it
end getURI

## when you set a custom property you can perform other actions using the setprop
## command.   The value that is set is in the parmeter pValue.

## TODO:  create a setProp handler for each of the custom properties 
## of stack "Main Window"
setProp cUserID pvalue
   put pvalue into field "User ID"
   ## you need to pass the message cUserID so that the custom property will 
   ## actually be set.
   pass cUserID
end cUserID


on openCard
   put klib_LC_LTI_version into field "lib_LC_LTI_version"
end openCard
