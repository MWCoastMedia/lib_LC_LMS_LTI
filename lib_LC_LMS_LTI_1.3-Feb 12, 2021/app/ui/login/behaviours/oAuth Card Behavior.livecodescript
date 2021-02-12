script "oAuth Card Behavior"
on returnInField
   doLogin
end returnInField

on oAuthLogin
   if field "username" is not empty and field "password" is not empty then
      libLC_LTI_SendoAuthCredentials field "username", field "password"
   else
      answer "Fill in username and password!"
   end if
end oAuthLogin
