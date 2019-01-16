<!DOCTYPE html>
<html>
<head>
    <title>ResetPassword</title>
</head>
<body>
<sec:loggedInUserInfo field="username"/>
<g:form controller="userSetup" action="sendMail">
    <p>Email:</p>
    <g:textField name="email">Email:</g:textField><br><br>
    <g:submitButton name="Submit"></g:submitButton>
    </g:form>

</body>
</html>