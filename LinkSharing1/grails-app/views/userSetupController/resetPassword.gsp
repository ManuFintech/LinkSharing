<!DOCTYPE html>
<html>
<head>
    <title>ResetPassword</title>
</head>
<body>
<sec:loggedInUserInfo field="username"/>
<g:form controller="userSetup" action="resetPassword">
    <p>Old Password:</p><br>
    <g:textField name="OldPassword"></g:textField><br>
    <p>New Password:</p>
    <g:textField name="NewPassword"></g:textField><br>
    <g:submitButton name="Submit"></g:submitButton>
</g:form>
</body>
</html>