<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Change Password Form</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
        <style media="screen">
            *,:before,:after{
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }
            body{
                background-color: #080710;
            }
            .background{
                width: 430px;
                height: 250px;
                position: absolute;
                transform: translate(-50%,-50%);
                left: 50%;
                top: 50%;
            }
            .background .shape{
                height: 200px;
                width: 200px;
                position: absolute;
                border-radius: 50%;
            }
            .shape:first-child{
                background: linear-gradient(#1845ad, #23a2f6);
                left: -80px;
                top: -80px;
            }
            .shape:last-child{
                background: linear-gradient(to right, #ff512f, #f09819);
                right: -30px;
                bottom: -80px;
            }
            form{
                height: 250px;
                width: 400px;
                background-color: rgba(255,255,255,0.13);
                position: absolute;
                transform: translate(-50%,-50%);
                top: 50%;
                left: 50%;
                border-radius: 10px;
                backdrop-filter: blur(10px);
                border: 2px solid rgba(255,255,255,0.1);
                box-shadow: 0 0 40px rgba(8,7,16,0.6);
                padding: 50px 35px;
            }
            form *{
                font-family: 'Poppins',sans-serif;
                color: #ffffff;
                letter-spacing: 0.5px;
                outline: none;
                border: none;
            }
            form h3{
                font-size: 24px;
                font-weight: 500;
                line-height: 42px;
                text-align: center;
            }

            label{
                display: block;
                margin-top: 20px;
                font-size: 16px;
                font-weight: 500;
            }
            input{
                display: block;
                height: 50px;
                width: 100%;
                background-color: rgba(255,255,255,0.07);
                border-radius: 3px;
                padding: 0 10px;
                margin-top: 8px;
                font-size: 14px;
                font-weight: 300;
            }
            ::placeholder{
                color: #e5e5e5;
            }
            button{
                margin-top: 40px;
                width: 100%;
                background-color: #ffffff;
                color: #080710;
                padding: 15px 0;
                font-size: 18px;
                font-weight: 600;
                border-radius: 5px;
                cursor: pointer;
            }

            /* Error message style */
            .error {
                color: #ff4d4d;
                font-size: 12px;
                margin-top: 5px;
            }
        </style>
    </head>
    <body>
        <div class="background">
            <div class="shape"></div>
            <div class="shape"></div>
        </div>
        <form action="reset-password" method="post">
            <h3>Change Password</h3>
            <% if (request.getAttribute("errorMessage") != null) { %>
            <div style="color: red; text-align: center">
                <%= request.getAttribute("errorMessage") %>
            </div>
            <% } %>
            <label for="email">Email</label>
            <input type="text" name="email" id="email" oninput="validateEmail()" required class="login__input" placeholder="Email">
            <span class="error" id="emailError"></span>

            <button type="submit">Submit</button>
        </form>
        <script type="text/javascript">
            let _validateEmail = true;

            function validateEmail() {
                var emailInput = document.getElementById('email');
                var emailError = document.getElementById('emailError');
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                if (!emailRegex.test(emailInput.value)) {
                    emailError.textContent = 'Invalid email address';
                    _validateEmail = false;
                } else {
                    emailError.textContent = '';
                    _validateEmail = true;
                }
            }

            document.getElementById('_form').addEventListener('submit', function (event) {
                event.preventDefault();
                if (!_validateEmail)
                    return;
                event.target.submit();
            });
        </script>
    </body>
</html>

