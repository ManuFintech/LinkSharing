<!DOCTYPE html>
<html>
<head>
    <title>Create Topic</title>
</head>
<body>
<g:form controller="topic" action="createTopic">
    <p>Topic Name:</p>
    <g:textField name="topic"></g:textField><br>
    <br>
    <br>
    <g:select name="visibility" from="${Enums.Visibility}"></g:select><br>
    <br><br>
    <g:submitButton name="createTopic">Create</g:submitButton>
</g:form>
</body>
</html>