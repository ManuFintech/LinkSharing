<%@ page import="com.linksharing.Topic; Enums.Seriousness" %>
<!DOCTYPE html>
<html>
<head>
    <title>TopicInformation</title>
    <asset:javascript src="jquery-3.3.1.min.js"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

</head>

<body>
<sec:loggedInUserInfo field="username"></sec:loggedInUserInfo>
<p>Under Development</p>

<p>Subscribed:</p>

<div>
    <g:each in="${subscribedList}" var="unsubscribedTopic" status="counter">

        <div id="divValue${counter + 1}">
            ${unsubscribedTopic}
            <input id="subscribedTopic${counter + 1}" type="button"
                   onclick="unsubscribe(${unsubscribedTopic.id}, ${counter+1})" value="Unsubscribe">
        </div>
    </g:each>
</div>
<br>

<p>Unsubscribed:</p>

<div>
    <g:each in="${unsubscribedList}" var="Subscribed" status="count">
        <div id="unsubscribeddiv${count + 1}">
            ${Subscribed}
            <g:set var="dropdownValue" value="dropdown${count}"></g:set>
            <%
                System.out.println("====================${dropdownValue}")
            %>
            <g:select name="seriousness" from="${Seriousness.values()}" id="${dropdownValue}"></g:select>
            <div id="div${count}">
                <input id="unsubscribebutton${count + 1}" type="button" value="Subscribe"
                       onclick="subscribe('${Subscribed.id}', document.getElementById('${dropdownValue}').value, '${count}')">
            </div>
        </div>

    </g:each>
</div>

<div id="comingList"></div>

<div class="container">
    <!-- Button to Open the Modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        Share Link
    </button>

    <!-- The Modal -->

    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Share Link</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <g:form controller="linkResource" action="saveLink">
                    <!-- Modal body -->
                    <div class="modal-body">

                        <p>Link: <g:textField name="link"></g:textField></p>
                        <br>

                        <p>Description: <g:textArea name="description"></g:textArea></p>
                        <br>

                        <p>Topic: <g:select name="topicID" from="${com.linksharing.Topic.list()}" value="Topics"
                                            id="dropdownList"
                                            optionKey="id" optionValue="name"></g:select></p>
                    </div>

                    <div id="container">
                        <div class="modal-footer">
                    <g:submitButton id="shareButton" name="shareLink" value="share"
                                    class="btn btn-primary"></g:submitButton>

                </g:form>

            </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button id="closeButton" type="button" class="btn btn-danger"
                            data-dismiss="modal">Close</button>
                </div>
            </div>

            </div>
        </div>
    </div>

</div>
<script type="text/javascript">

    function subscribe(x, y, z) {

        console.log(x + " " + y + " " + z)
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

    function unsubscribe(x, y) {
        console.log(x + " " + y)
        var count = y
        $.ajax({
            url: '${createLink(controller: 'subscription', action: 'deleteSubscriptions')}',
            method: 'POST',
            data: {
                param1: x
            },
            success: function (data) {
                $("#subscribedTopic" + y).onclick(function () {
                    alert("Unsubscribed Successfull")
                })
                $('#comingList').html(data)
                $('#div' + count).hide()


            }
        });
    }

    $(document).ready(function () {
        console.log("Ready")

    })



</script>

<g:link controller="logout" action="index">Logout</g:link>

</body>
</html>