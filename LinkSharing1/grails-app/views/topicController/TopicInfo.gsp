<!DOCTYPE html>
<html>
<head>
    <title>TopicInformation</title>
</head>

<body>
<p>Under Development</p>
%{--<g:each in="${list}" var="topic" status="counter">--}%
    %{--<div>--}%
        %{--<p>${counter + 1}: ${topic.name},${topic.visibility},${topic.createdBy.firstName}</p>--}%
        %{--<g:select name="seriousness" from="${Seriousness.values()}" value="${val}"></g:select>--}%
        %{--<a href='${createLink(controller: "Subscription", action: "addSubscription", params: [value: topic.id,serious1: val])}'--}%
           %{--name="Subscription">Subscribe</a>--}%
    %{--</div>--}%
%{--</g:each>--}%
%{--<g:form id="form" controller="subscription" action="addSubscription">--}%
    %{--<g:each in="${list}" var="topic" status="counter">--}%
    %{--<div>--}%
    %{--<p>${counter + 1}: ${topic.name},${topic.visibility},${topic.createdBy.firstName}</p>--}%
    %{--<g:select name="seriousness" from="${Seriousness.values()}" value="${val}"></g:select>--}%
    %{--<g:submitButton name="submit" value="SUBMIT"></g:submitButton>--}%
    %{--</div>--}%
    %{--</g:each>--}%
%{--</g:form>--}%

<input type="button" onclick="callAjax()" value="kkkkkkkkkkk">





<asset:javascript src="jquery-3.3.1.min.js"/>
<script type="text/javascript">
function callAjax() {

    $.ajax(
            {
                url: '${createLink(controller: 'topic', action: 'printAjax')}',
                method: "POST",
                data:{
                    param1: 2,
                    param2: 5
                },
                success: function(answer) {
                    console.log(answer)

                }
            }
    );

}
</script>


</body>
</html>