<%@ page import="Enums.Seriousness" %>
<!DOCTYPE html>
<html>
<head>
    <title>TopicInformation</title>
    <asset:javascript src="jquery-3.3.1.min.js"/>


</head>
<body>
<p>Under Development</p>
<g:each in="${list}" var="topic" status="counter">
    <div>
        <g:set var="dropDownValue" value="dropdown${counter}"></g:set>
        <g:textArea name="xyz" value="${topic}"></g:textArea>
        <g:select name="seriousness" from="${Seriousness.values()}" id="${dropDownValue}"></g:select>
        <div id="changeSubscription">
        <input id="subscribebutton${counter+1}" type="button" onclick="callAjax(${topic.id},document.getElementById('${dropDownValue}').value,${counter+1});" value="Subscribe">
    </div>
        </div>
</g:each>

<script type="text/javascript">

    function callAjax(x,y,z) {

        console.log(x+" "+y+" "+z)
        $.ajax(
        {
            url: '${createLink(controller: 'subscription', action: 'addSubscription')}',
            method: "POST",
            data: {
                param1: x,
                param2: y,
                param3: z

            },
            success: function (data) {
                console.log(data.content)
                $('#subscribebutton'+z).replaceWith(data.content)

            }
        }
    );

}

function unsubscribe(x) {
        console.log(x)
$.ajax({
    url: '${createLink(controller: 'subscription', action: 'deleteSubscriptions')}',
    method: 'POST',
    data:{
      param1:x
    },
    success: function(data){
        console.log("Hit is coming")
    }
})
}


</script>
</body>
</html>