<!DOCTYPE html>
<html>
<head>
    <title>Create Topic</title>
</head>
<body>
%{--<g:link controller="Topic" action="createTopic">--}%
%{--<g:textField name="name"></g:textField><br>--}%
%{--<g:select from="${['PUBLIC','PRIVATE']}" name="Visibillity"></g:select><br>--}%
%{--<g:submitButton name="createTopic" value="createTopic"></g:submitButton>--}%
%{--</g:link>--}%
<g:form controller="Topic" action="createTopic">
    <g:textField name="Topic"></g:textField><br>
    <g:select from="${['PUBLIC','PRIVATE']}" name="Visibillity"></g:select><br>
    <g:submitButton name="Create Topic" value="Create Topic"></g:submitButton>
</g:form>
</body>
</html>