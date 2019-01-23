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
    <g:select name="visibility" from="${Enums.Visibility}" value="{val}">
    </g:select><br>
    <br><br>

    <g:submitButton name="createTopic">Create</g:submitButton>
</g:form>
<%
    System.out.println(val)
%>

<a href="${createLink(controller: "Topic" ,action: "getTopics")}">Topics</a>

<div class="nav" role="navigation">
    <ul><li><g:link class="list" action="list">Document List</g:link></li></ul>
</div>
<div class="content scaffold-create" role="main">
    <h1>Upload New Document</h1>
    <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
    <g:uploadForm action="upload">
        <fieldset class="form">
            <input type="file" name="file" />
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="upload" class="save" value="Upload" />
        </fieldset>
    </g:uploadForm>
</div>

<g:link controller="logout" action="index">Logout</g:link>

</body>
</html>