<%@ page import="com.linksharing.Topic" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>HomePage</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-nav navbar-expand-sm d-flex flex-row" style="background-color: #6f42c1">
    <div class="navbar-text col-lg-6"><font color="white">Link Sharing</font></div>
    <ul class="navbar-nav flex-row d-none d-md-flex">
        <li class="nav-item">
            <form class="form-inline my-2 my-lg-0 d-flex\">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
        </form>
        </li>
        <li class="nav-item">
            <div class="nav-link">
                <a data-target="#myModal" data-toggle="modal"><i class="fa fa-fw fa-comment"></i></a>
            </div>
        </li>
        <li class="nav-item">
            <div class="nav-link">
                <a href=""><i class="fa fa-envelope-o" aria-hidden="true"></i></a>
            </div>
        </li>
        <li class="nav-item">
            <div class="nav-link">
                <a data-target="#myLinkModal" data-toggle="modal"><i class="fa fa-link" aria-hidden="true"></i></a>
            </div>
        <li class="nav-item">
            <div class="nav-link">
                <a data-target="#myDcoumentModal" data-toggle="modal"><i class="fa fa-file-o" aria-hidden="true"></i></a>
            </div>
        </li>
            <li class="nav-item">
              <div class="nav-link">
                  <a href=""><i class="fa fa-user" aria-hidden="true"></i></a>
              </div>
        </li>
        <li class="nav-item">
            <div class="navbar-text"><font color="white"><sec:loggedInUserInfo field="username"></sec:loggedInUserInfo></font></div>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Profile</a>
                <a class="dropdown-item" href="#">Users</a>
                <a class="dropdown-item" href="#">Topics</a>
                <a class="dropdown-item" href="#">Posts</a>
                <a class="dropdown-item" href="#">Logout</a>
            </div>
        </li>
    </ul>

</nav>
%{--<g:form controller="topic" action="createTopic">--}%
    %{--<p>Topic Name:</p>--}%
    %{--<g:textField name="topic"></g:textField><br>--}%
    %{--<br>--}%
    %{--<br>--}%
    %{--<g:select name="visibility" from="${Enums.Visibility}" value="{val}">--}%
    %{--</g:select><br>--}%
    %{--<br><br>--}%

    %{--<g:submitButton name="createTopic">Create</g:submitButton>--}%
%{--</g:form>--}%
%{--<a href="${createLink(controller: "Topic" ,action: "getTopics")}">Topics</a>--}%
%{--<g:link controller="logout" action="index">Logout</g:link>--}%

%{--<p>Recent Shares:</p>--}%
%{--<g:if test="${com.linksharing.LinkResource.count()>0}">--}%
%{--<g:each in="${com.linksharing.LinkResource.list()}" var="printLink" status="count">--}%
    %{--${printLink}--}%
    %{--<br>--}%
%{--</g:each>--}%
%{--</g:if>--}%
%{-------------------------------------------------------------------------------Topic Modal--}%
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Create Topic</h4>
            </div>
            <div class="modal-body">
                <g:form controller="topic" action="createTopic">
               <g:textField name="topic" placeholder="Topic"></g:textField>
               <g:select name="visibility" from="${Enums.Visibility}"></g:select>
               <g:submitButton name="submit" value="Submit"></g:submitButton>
                </g:form>

            <div class="modal-footer d-flex flex-row">
                %{--<button type="button" class="btn-primary" href="">Create</button>--}%
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>

            </div>

        </div>

    </div>
</div>

%{----------------------------------------------------------------------------------------LinkResourceModal--}%

<div class="modal" id="myLinkModal">
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
                <button id="closeLinkButton" type="button" class="btn btn-danger"
                        data-dismiss="modal">Close</button>
            </div>
        </div>

        </div>
    </div>
</div>

%{-----------------------------------------------------------------------------------------------DocumentModal--}%
<div class="modal" id="myDocumentModal">
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
                <g:uploadForm action="upload">
                    <fieldset class="form">
                        <input type="file" name="file" />
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="upload" class="save" value="Upload" />
                    </fieldset>
                </g:uploadForm>
            </g:form>

        </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button id="closeDocumentButton" type="button" class="btn btn-danger"
                        data-dismiss="modal">Close</button>
            </div>
        </div>

        </div>
    </div>
</div>



</body>
</html>