<!DOCTYPE html>
<html>
<head>
    <title>HomePage</title>
</head>
<body>


<g:link controller="Topic" action="createTopic">
    <g:form>
        <g:textField name="Topic"></g:textField><br>
        <g:select from="${['PUBLIC','PRIVATE']}" name="Visibillity"></g:select><br>
        <g:submitButton name="Create Topic" value="Create Topic"></g:submitButton>
    </g:form>
</g:link>
</body>
</html>