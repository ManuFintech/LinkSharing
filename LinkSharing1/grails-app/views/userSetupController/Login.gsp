<!DOCTYPE html>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title><g:message message="LOGIN"/></title>
    <style type="text/css" media="screen">

    .login-container{
        margin-top: 5%;
        margin-bottom: 5%;
        margin-left: 25%;
    }
    .login-form-1{
        padding: 5%;
        box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
    }
    .login-form-1 h3{
        text-align: center;
        color: #333;
    }
    .login-container form{
        padding: 10%;
    }
    .submit
    {
        width: 50%;
        border-radius: 1rem;
        padding: 1.5%;
        border: none;
        cursor: pointer;

    }
    .login-form-1 .submit{
        font-weight: 600;
        color: #fff;
        background-color: #0062cc;
    }
    .login-form-1 .ForgetPwd{
        color: #0062cc;
        font-weight: 600;
        text-decoration: none;
    }

    </style>
</head>

<body>
<div class="container login-container">
    <div class="row">
        <div class="col-md-6 login-form-1">
        <div class="fheader" style="text-align: center; display: block"><g:message message="Please Login"/></div>

        <g:if test='${flash.message}'>
            <div class="login_message">${flash.message}</div>
        </g:if>

        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
            <div class="form-group">
            <p>
                %{--<label for="username"><g:message message="Username"/>:</label>--}%
                <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" id="username" placeholder="Username"/>
            </p>
            </div>
            <div class="form-group">
            <p>
                %{--<label for="password"><g:message message="Password"/>:</label>--}%
                <input type="password" class="form-control" name="${passwordParameter ?: 'password'}" id="password" placeholder="Password"/>
            </p>
            </div>
            <div class="form-group">
            <p id="remember_me_holder">
                <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                <label for="remember_me"><g:message message="Remember Me" /></label>
            </p>
            </div>
            <div class="form-group">
            <p>
                <input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}" class="submit"/>
            </p>
            </div>
            <div class="form-group">
                <a href="${createLink(controller: "userSetup" ,action: "resetPasswordPage")}" class="ForgetPwd">Forget Password?</a>
            </div>
        </form>
    </div>
</div>
</div>
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>


