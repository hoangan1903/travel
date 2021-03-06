<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login V17</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="WebContent/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="WebContent/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="WebContent/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="WebContent/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="WebContent/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="WebContent/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="WebContent/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="WebContent/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="WebContent/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="WebContent/css/util.css">
    <link rel="stylesheet" type="text/css" href="WebContent/css/main.css">
    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" action="/signUp" method="post">
					<span class="login100-form-title p-b-34">
						Sign Up
					</span>

                <%--					alert login--%>
                <p style="color: red;">${errorMessage}</p>

                <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Type user name">
                    <input id="first-name" class="input100" type="text" name="username" placeholder="User name">
                    <span class="focus-input100"></span>
                </div>
                <div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate="Type password">
                    <input class="input100" type="password" name="password" placeholder="Password">
                    <span class="focus-input100"></span>
                </div>
                <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Type user name">
                    <input id="name" class="input100" type="text" name="username" placeholder="Name">
                    <span class="focus-input100"></span>
                </div>
                <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Type user name">
                    <input id="email" class="input100" type="email" name="username" placeholder="Email">
                    <span class="focus-input100"></span>
                </div>
                <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Type user name">
                    <input id="phone" class="input100" type="text" name="username" placeholder="Phone">
                    <span class="focus-input100"></span>
                </div>
                <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Type user name">
                    <input id="status" class="input100" type="text" name="username" placeholder="Status">
                    <span class="focus-input100"></span>
                </div>

                <div class="container-login100-form-btn">
                    <button class="login100-form-btn">
                        Sign up
                    </button>
                </div>

            </form>

            <div class="login100-more" style="background-image: url('WebContent/images/bg-01.jpg');"></div>
        </div>
    </div>
</div>



<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="WebContent/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="WebContent/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="WebContent/vendor/bootstrap/js/popper.js"></script>
<script src="WebContent/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="WebContent/vendor/select2/select2.min.js"></script>
<script>
    $(".selection-2").select2({
        minimumResultsForSearch: 20,
        dropdownParent: $('#dropDownSelect1')
    });
</script>
<!--===============================================================================================-->
<script src="WebContent/vendor/daterangepicker/moment.min.js"></script>
<script src="WebContent/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="WebContent/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="WebContent/js/main.js"></script>

</body>
</html>