<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css'>
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css'><link rel="stylesheet" href="./style.css">
        <style>
            @import url('https://fonts.googleapis.com/css?family=Raleway:400,700');

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: Raleway, sans-serif;
            }

            body {
                background: linear-gradient(90deg, #C7C5F4, #776BCC);
            }

            .container {
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
            }

            .screen {
                background: linear-gradient(90deg, #5D54A4, #7C78B8);
                position: relative;
                height: 600px;
                width: 360px;
                box-shadow: 0px 0px 24px #5C5696;
            }

            .screen__content {
                z-index: 1;
                position: relative;
                height: 100%;
            }

            .screen__background {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                z-index: 0;
                -webkit-clip-path: inset(0 0 0 0);
                clip-path: inset(0 0 0 0);
            }

            .screen__background__shape {
                transform: rotate(45deg);
                position: absolute;
            }

            .screen__background__shape1 {
                height: 520px;
                width: 520px;
                background: #FFF;
                top: -50px;
                right: 120px;
                border-radius: 0 72px 0 0;
            }

            .screen__background__shape2 {
                height: 220px;
                width: 220px;
                background: #6C63AC;
                top: -172px;
                right: 0;
                border-radius: 32px;
            }

            .screen__background__shape3 {
                height: 540px;
                width: 190px;
                background: linear-gradient(270deg, #5D54A4, #6A679E);
                top: -24px;
                right: 0;
                border-radius: 32px;
            }

            .screen__background__shape4 {
                height: 400px;
                width: 200px;
                background: #7E7BB9;
                top: 420px;
                right: 50px;
                border-radius: 60px;
            }

            .login {
                width: 320px;
                padding: 30px;
                padding-top: 156px;
            }

            .login__field {
                padding: 20px 0px;
                position: relative;
            }

            .login__icon {
                position: absolute;
                top: 30px;
                color: #7875B5;
            }

            .login__input {
                border: none;
                border-bottom: 2px solid #D1D1D4;
                background: none;
                padding: 10px;
                padding-left: 24px;
                font-weight: 700;
                width: 75%;
                transition: .2s;
            }

            .login__input:active,
            .login__input:focus,
            .login__input:hover {
                outline: none;
                border-bottom-color: #6A679E;
            }

            .login__submit {
                background: #fff;
                font-size: 14px;
                margin-top: 30px;
                padding: 16px 20px;
                border-radius: 26px;
                border: 1px solid #D4D3E8;
                text-transform: uppercase;
                font-weight: 700;
                display: flex;
                align-items: center;
                width: 100%;
                color: #4C489D;
                box-shadow: 0px 2px 2px #5C5696;
                cursor: pointer;
                transition: .2s;
            }

            .login__submit:active,
            .login__submit:focus,
            .login__submit:hover {
                border-color: #6A679E;
                outline: none;
            }

            .button__icon {
                font-size: 24px;
                margin-left: auto;
                color: #7875B5;
            }

            .social-login {
                position: absolute;
                height: 140px;
                width: 160px;
                text-align: center;
                bottom: 0px;
                right: 0px;
                color: #fff;
            }

            .social-icons {
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .social-login__icon {
                padding: 20px 10px;
                color: #fff;
                text-decoration: none;
                text-shadow: 0px 0px 8px #7875B5;
            }

            .social-login__icon:hover {
                transform: scale(1.5);
            }
        </style>
    </head>
    <body>
        <!-- partial:index.partial.html -->
        <div class="container">
            <div class="screen">
                <div class="screen__content">

                    <form class="login" action="login" method="post" id="_form">
                        <div style="text-align: center">
                            <h2>Login</h2>
                        </div>
                        <% if (request.getAttribute("errorMessage") != null) { %>
                        <div style="color: red">
                            <%= request.getAttribute("errorMessage") %>
                        </div>
                        <% } %>
                        <div class="login__field">
                            <i class="login__icon fas fa-user"></i>
                            <input type="email" id="email" name="email" required oninput="validateEmail()" class="login__input" placeholder="Email">
                        </div>
                        <div id="emailError" style="color: red"></div>
                        <div class="login__field">
                            <i class="login__icon fas fa-lock"></i>
                            <input type="password" id="password" name="password" required oninput="validatePassword()" class="login__input" placeholder="Password">
                        </div>
                        <div id="passwordError" style="color: red"></div>
                        <button class="button login__submit" type="submit">
                            <span class="button__text">Log In Now</span>
                            <i class="button__icon fas fa-chevron-right"></i>
                        </button>				
                    </form>
                    <div class="social-login">
                        <h3><a href="reset-password" style="color: white">Forgot password?</a></h3>
                        <h3><a href="register" style="color: white" >Register</a></h3>
                    </div>
                </div>
                <div class="screen__background">
                    <span class="screen__background__shape screen__background__shape4"></span>
                    <span class="screen__background__shape screen__background__shape3"></span>		
                    <span class="screen__background__shape screen__background__shape2"></span>
                    <span class="screen__background__shape screen__background__shape1"></span>
                </div>		
            </div>
        </div>
        <!-- partial -->
        <script>
            let email = true;
            let password = true;
            function validateEmail() {
                var emailInput = document.getElementById('email');
                var emailError = document.getElementById('emailError');
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                console.log(emailInput);
                if (!emailRegex.test(emailInput.value)) {
                    emailError.textContent = 'Invalid email address';
                    email = fasle;
                } else {
                    emailError.textContent = '';
                    email = true;
                }
            }

            function validatePassword() {
                var passwordInput = document.getElementById('password');
                var passwordError = document.getElementById('passwordError');

                if (passwordInput.value.trim() === '') {
                    passwordError.textContent = 'Password cannot be empty';
                    password = false;
                } else if (passwordInput.value.length < 8) {
                    password = false;
                    passwordError.textContent = 'Password more than 8 character';
                } else {
                    passwordError.textContent = '';
                    password = true;
                }
            }
            document.getElementById('_form').addEventListener('submit', function (event) {
                event.preventDefault();
                if (!email || !password)
                    return;
                event.target.submit();
            })
        </script>

    </body>
</html>
