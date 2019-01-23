<%@ page import="com.linksharing.Topic" %>
<!DOCTYPE html>
<html>
<head>
    <title>HomePage</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<body>
<g:form controller="topic" action="createTopic">
    <p>Topic Name:</p>
    <g:textField name="topic"></g:textField><br>
    <br>
    <br>
    <g:select name="visibility" from="${Enums.Visibility}" value="{val}">
    </g:select><br>
    <br><br>

    <g:submitButton name="createTopic">Create</g:submitButton>
</g:form>
<a href="${createLink(controller: "Topic" ,action: "getTopics")}">Topics</a>
<g:link controller="logout" action="index">Logout</g:link>

<p>Recent Shares:</p>
<g:if test="${com.linksharing.LinkResource.count()>0}">
<g:each in="${com.linksharing.LinkResource.list()}" var="printLink" status="count">
    ${printLink}
    <br>
</g:each>
</g:if>



</body>
</html>