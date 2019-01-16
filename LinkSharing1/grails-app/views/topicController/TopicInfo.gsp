<%@ page import="com.linksharing.Topic" %>
<!DOCTYPE html>
<html>
<head>
    <title>TopicInformation</title>
</head>

<body>
<g:each in="${list}" var="topic" status="counter">
    <div>
        <p>${counter + 1}: ${topic.name},${topic.visibility},${topic.createdBy.firstName}</p>
        <%
            System.out.println topic.id
        %>
        <a href='${createLink(controller: "Subscription", action: "addSubscription", params: [value: topic.id])}'
           name="Subscription">Subscribe</a>
    </div>
</g:each>
</body>
</html>