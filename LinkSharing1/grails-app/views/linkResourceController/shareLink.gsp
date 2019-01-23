<%@ page import="com.linksharing.Topic" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <style>
    #container {
        text-align: center;
    }

    #closeButton {
        display: inline-block;

    }
    </style>
</head>

<body>
<div class="container">
    <h2>Share Link</h2>
    <!-- Button to Open the Modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        Open modal
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

                        <p>Topic: <g:select name="topicID" from="${Topic.list()}" value="Topics" id="dropdownList"
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
</script>

</body>
</html>
