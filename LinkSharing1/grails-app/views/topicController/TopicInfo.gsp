<%@ page import="Enums.Seriousness" %>
<!DOCTYPE html>
<html>
<head>
    <title>TopicInformation</title>
    <asset:javascript src="jquery-3.3.1.min.js"/>
</head>
<body>
<sec:loggedInUserInfo field="username"></sec:loggedInUserInfo>
<p>Under Development</p>
<p>Subscribed:</p>
<div>
<g:each in="${subscribedList}" var="unsubscribedTopic" status="counter">

    <div id="divValue${counter+1}">
        ${unsubscribedTopic}
        <input id="subscribedTopic${counter+1}" type="button" onclick="unsubscribe(${unsubscribedTopic.id},${counter+1})" value="Unsubscribe">
    </div>
</g:each>
</div>
<br>
<p>Unsubscribed:</p>
<div>
<g:each in="${unsubscribedList}" var="Subscribed" status="count">
    <div id="unsubscribeddiv${count+1}">
        ${Subscribed}
        <g:set var="dropdownValue" value="dropdown${count}"></g:set>
        <%
        System.out.println("====================${dropdownValue}")
        %>
        <g:select name="seriousness" from="${Seriousness.values()}" id="${dropdownValue}"></g:select>
        <div id="div${count}">
        <input id="unsubscribebutton${count+1}" type="button" value="Subscribe" onclick="subscribe('${Subscribed.id}',document.getElementById('${dropdownValue}').value,'${count}')">
    </div>
        </div>

</g:each>
</div>

<div id="comingList"></div>


%{--<g:each in="${map}" var="m">--}%
    %{--${m.value}--}%
    %{--<br>--}%
    %{--${m.getValue()}--}%
%{--</g:each>--}%
%{--<g:each in="${map}" var="m" status="count">--}%
    %{--<g:if test="${m.key.equals("subscribedByUser")}">--}%
        %{--<g:each in="${m.value}" var="value">--}%
          %{--<div>--}%
              %{--<p>${value}</p>--}%
              %{--<input id= type="button" onclick="unsubscribe(${value})" value="Unsubscribe">--}%

          %{--</div>--}%


            %{--<br>--}%
        %{--</g:each>--}%
    %{--</g:if>--}%
    %{--<g:else>--}%
        %{--<g:each in="${m.value}" var="val">--}%
            %{--<div>--}%
                %{--<p>${val}</p>--}%

            %{--<g:set var="dropdownValue" value="dropdown${count}${num1}"></g:set>--}%
            %{--<g:set var="buttonID" value="button${count}${num1}"></g:set>--}%
            %{--<g:select name="seriousness" from="${Enums.Seriousness.values()}" id="${dropdownValue}"></g:select>--}%
                %{--<input value="Subscribe" id="buttonId${num1}" type="button" onclick="subscribe()">--}%

            %{--</div>--}%

            %{--<br>--}%
        %{--</g:each>--}%
    %{--</g:else>--}%
%{--</g:each>--}%
<script type="text/javascript">

    function subscribe(x,y,z) {

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
            //    $('#unsubscribebutton'+z).replaceWith(data.content)



            }
        }
    );

}

function unsubscribe(x,y) {
        console.log(x+" "+y)
    var count=y
$.ajax({
    url: '${createLink(controller: 'subscription', action: 'deleteSubscriptions')}',
    method: 'POST',
    data:{
      param1:x
    },
    success: function(data){
        $("#subscribedTopic"+y).onclick(function () {
            alert("Unsubscribed Successfull")
        })
        $('#comingList').html(data)
        $('#div'+count).hide()


    }
});
}

$(document).ready(function () {
    console.log("Ready")
    
})



</script>
<g:link controller="linkResource" action="index">ShareLink</g:link>
<g:link controller="logout" action="index">Logout</g:link>



</body>
</html>