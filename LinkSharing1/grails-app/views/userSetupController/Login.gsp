<!DOCTYPE html>
%{--<html>--}%
%{--<head>--}%
%{--<title>Login</title>--}%
%{--</head>--}%
%{--<body>--}%
%{--<g:form controller="login" action="homePage">--}%
%{--<div>--}%

%{--<legend>Login:</legend>--}%
%{--<p>UserName:</p><input type="text" name="username"><br>--}%
%{--<p>Password</p><input type="text" name="password"><br>--}%
%{--<input type="submit" name="submit" value="Login"><br>--}%

%{--</div>--}%
%{--</g:form>--}%

%{--</body>--}%
%{--</html>--}%
<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message message="LOGIN"/></title>
    <style type="text/css" media="screen">
    #login {
        margin: 15px 0px;
        padding: 0px;
        text-align: center;
    }
    #login .inner {
        width: 340px;
        padding-bottom: 6px;
        margin: 60px auto;
        text-align: left;
        border: 1px solid #aab;
        background-color: #f0f0fa;
        -moz-box-shadow: 2px 2px 2px #eee;
        -webkit-box-shadow: 2px 2px 2px #eee;
        -khtml-box-shadow: 2px 2px 2px #eee;
        box-shadow: 2px 2px 2px #eee;
    }
    #login .inner .fheader {
        padding: 18px 26px 14px 26px;
        background-color: #f7f7ff;
        margin: 0px 0 14px 0;
        color: #2e3741;
        font-size: 18px;
        font-weight: bold;
    }
    #login .inner .cssform p {
        clear: left;
        margin: 0;
        padding: 4px 0 3px 0;
        padding-left: 105px;
        margin-bottom: 20px;
        height: 1%;
    }
    #login .inner .cssform input[type="text"] {
        width: 120px;
    }
    #login .inner .cssform label {
        font-weight: bold;
        float: left;
        text-align: right;
        margin-left: -105px;
        width: 110px;
        padding-top: 3px;
        padding-right: 10px;
    }
    #login #remember_me_holder {
        padding-left: 120px;
    }
    #login #submit {
        margin-left: 15px;
    }
    #login #remember_me_holder label {
        float: none;
        margin-left: 0;
        text-align: left;
        width: 200px
    }
    #login .inner .login_message {
        padding: 6px 25px 20px 25px;
        color: #c33;
    }
    #login .inner .text_ {
        width: 120px;
    }
    #login .inner .chk {
        height: 12px;
    }
    </style>
</head>

<body>
<div id="login">
    <div class="inner">
        <div class="fheader"><g:message message="Please Login"/></div>

        <g:if test='${flash.message}'>
            <div class="login_message">${flash.message}</div>
        </g:if>

        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
            <p>
                <label for="username"><g:message message="Username"/>:</label>
                <input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>
            </p>

            <p>
                <label for="password"><g:message message="Password"/>:</label>
                <input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>
            </p>

            <p id="remember_me_holder">
                <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                <label for="remember_me"><g:message message="Remember Me" /></label>
            </p>

            <p>
                <input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"/>
            </p>
        </form>
    </div>
</div>
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>