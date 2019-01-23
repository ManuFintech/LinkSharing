
%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
    %{--<title>Register</title>--}%
%{--</head>--}%
%{--<body>--}%

%{--<g:form controller="UserSetup" action="registerUser">--}%
    %{--<div>--}%

        %{--<legend>Register:</legend>--}%
        %{--<p>First Name:</p><input type="text" name="firstName"><br>--}%
        %{--<p>Last Name:</p><input type="text" name="lastName"><br>--}%
        %{--<p>Email:</p><input type="text" name="email"><br>--}%
        %{--<p>Username:</p><input type="text" name="username"><br>--}%
        %{--<p>Password</p><input type="text" name="password"><br>--}%
        %{--<p>Confirm Password:</p><input type="text" name="confirmPassword"><br>--}%
        %{----}%
        %{--<input type="submit" name="submit" value="SignUp"><br>--}%

    %{--</div>--}%
%{--</g:form>--}%

%{--<g:link controller="userSetup" action="loginUser">Login</g:link>--}%

%{--</body>--}%
%{--</html>--}%
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
</head>
<body>
<g:form controller="userSetup" action="registerUser">
<div class="container">
    <br>
    <div class="card bg-light">
        <article class="card-body mx-auto" style="max-width: 400px;">
            <h4 class="card-title mt-3 text-center">Create Account</h4>
            <br>
            <form>
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="firstName" class="form-control" placeholder="First name" type="text">
                </div> <!-- form-group// -->
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="lastName" class="form-control" placeholder="Last name" type="text">
                </div> <!-- form-group// -->
                <div class="form-group input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fa fa-envelope"></i> </span>
                </div>
                <g:textField name="email" placeholder="Email" type="email" class="form-control"></g:textField>
            </div>
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-user"></i> </span>
                    </div>
                    <g:textField name="username" placeholder="username" type="text" class="form-control"></g:textField>
                </div>
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                    </div>
                    <select class="custom-select" style="max-width: 120px;">
                        <option selected="">+91</option>
                    </select>
                    <input name="phoneNumber" class="form-control" placeholder="Phone number" type="text">
                </div> <!-- form-group// -->
             <!-- form-group end.// -->
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                    </div>
                    <input name="password" class="form-control" placeholder="Create password" type="password">
                </div> <!-- form-group// -->
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                    </div>
                    <input name="confirmPassword" class="form-control" placeholder="Repeat password" type="password">
                </div> <!-- form-group// -->
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block"> Create Account  </button>
                </div> <!-- form-group// -->
                <p class="text-center">Have an account? <g:link controller="userSetup" action="loginUser">LogIn</g:link> </p>
                <br>
                <p>
                    <a href="https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin" class="btn btn-block btn-google"> <i class="fab fa-google"></i>   Login via Google+</a>
                    <a href="https://www.facebook.com/" class="btn btn-block btn-facebook"> <i class="fab fa-facebook-f"></i>   Login via facebook</a>
                </p>
            </form>
        </article>
    </div> <!-- card.// -->

</div>
</g:form>
<br><br>
</body>
</html>