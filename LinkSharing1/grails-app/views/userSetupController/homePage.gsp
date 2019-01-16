<!DOCTYPE html>
<html>
<head>
    <title>HomePage</title>
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

<a href="${createLink(controller: "Topic" ,action: "getTopics")}">Topics</a>

</body>
</html>