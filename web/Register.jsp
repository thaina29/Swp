<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Register</title>

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
                height: 800px;
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
                height: 780px;
                width: 500px;
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
                font-size: 32px;
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
            input, select{
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
            select{
                height: 55px;
                cursor: pointer;
            }
            ::placeholder{
                color: #e5e5e5;
            }

            /* Flex container for paired inputs */
            .flex-container {
                display: flex;
                justify-content: space-between;
                gap: 20px;
            }

            /* Flex children (each input field) */
            .flex-item {
                width: 48%; /* Each input takes almost half of the space */
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

            .social{
                margin-top: 30px;
                display: flex;
            }
            .social div{
                background: red;
                width: 200px;
                border-radius: 3px;
                padding: 5px 10px 10px 5px;
                background-color: rgba(255,255,255,0.27);
                color: #eaf0fb;
                text-align: center;
            }
            .social div:hover{
                background-color: rgba(255,255,255,0.47);
            }
            .social .fb{
                margin-left: 25px;
            }
            .social i{
                margin-right: 4px;
            }
        </style>
    </head>
    <body>
        <div class="background">
            <div class="shape"></div>
            <div class="shape"></div>
        </div>
        <form action="register" method="post">
            <h3>Register Here</h3>
            <% if (request.getAttribute("errorMessage") != null) { %>
            <div style="color: red; text-align: center">
                <%= request.getAttribute("errorMessage") %>
            </div>
            <% } %>

            <!-- Pair Username and Email -->
            <div class="flex-container">
                <div class="flex-item">
                    <label for="fullName">Full name</label>
                    <input type="text" name="fullName" id="fullName" required class="login__input" placeholder="Full name">
                    <span class="error" id="fullNameError"></span>
                </div>
                <div class="flex-item">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required oninput="validateEmail()" class="login__input" placeholder="Email">
                    <span class="error" id="emailError"></span>
                </div>
            </div>

            <!-- Pair Phone and Gender -->
            <div class="flex-container">
                <div class="flex-item">
                    <label for="phone">Phone</label>
                     <input type="text" id="phone" name="phone" required oninput="validatePhone()">
                    <span class="error" id="phoneError"></span>
                </div>
                <div class="flex-item">
                    <label for="gender">Gender</label>
                    <select id="gender">
                        <option value="true" style="color: black" selected>Male</option>
                        <option value="false" style="color: black">Female</option>
                    </select>
                    
                </div>
            </div>

            <!-- Address (full width) -->
            <label for="address">Address</label>
            <input type="text" id="address" name="address" required oninput="validateAddress()">
            <span class="error" id="addressError"></span>

            <!-- Pair Password and Confirm Password -->
            <div class="flex-container">
                <div class="flex-item">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required oninput="validatePassword()" class="login__input" placeholder="Password">
                    <span class="error" id="passwordError"></span>
                </div>
                <div class="flex-item">
                    <label for="confirm-password">Confirm Password</label>
                    <input type="password" name="retypePassword" id="retypePassword" required oninput="validateRetypePassword()" class="login__input" placeholder="Re-Password">
                    <span class="error" id="retypePasswordError"></span>
                </div>
            </div>

            <button type="submit">Register</button>

            <div class="social">
                <div class="go"><a href="login">Login</a></div>
                <div class="fb"><a href="reset-password">Forgot Password</a></div>
            </div>
        </form>
        <script>
            function validateFullName() {
                var fullNameInput = document.getElementById('fullName');
                var fullNameError = document.getElementById('fullNameError');

                if (fullNameInput.value.trim().length < 8) {
                    fullNameError.textContent = 'Full Name must be more than 8 characters';
                } else {
                    fullNameError.textContent = '';
                }
            }

            function validateEmail() {
                var emailInput = document.getElementById('email');
                var emailError = document.getElementById('emailError');
                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                if (!emailRegex.test(emailInput.value)) {
                    emailError.textContent = 'Invalid email address';
                } else {
                    emailError.textContent = '';
                }
            }

            function validatePassword() {
                var passwordInput = document.getElementById('password');
                var passwordError = document.getElementById('passwordError');

                if (passwordInput.value.trim().length < 8) {
                    passwordError.textContent = 'Password must be more than 8 characters';
                } else {
                    passwordError.textContent = '';
                }
            }

            function validateRetypePassword() {
                var passwordInput = document.getElementById('password');
                var retypePasswordInput = document.getElementById('retypePassword');
                var retypePasswordError = document.getElementById('retypePasswordError');

                if (retypePasswordInput.value !== passwordInput.value) {
                    retypePasswordError.textContent = 'Passwords do not match';
                } else {
                    retypePasswordError.textContent = '';
                }
            }

            function validatePhone() {
                var phoneInput = document.getElementById('phone');
                var phoneError = document.getElementById('phoneError');
                var phoneRegex = /^\d+$/;

                if (phoneInput.value.trim() === '' || !phoneRegex.test(phoneInput.value)) {
                    phoneError.textContent = 'Invalid phone number. Please enter digits only.';
                } else {
                    phoneError.textContent = '';
                }
            }

            function validateAddress() {
                var addressInput = document.getElementById('address');
                var addressError = document.getElementById('addressError');

                if (addressInput.value.trim() === '') {
                    addressError.textContent = 'Address cannot be empty';
                } else {
                    addressError.textContent = '';
                }
            }
        </script>
    </body>
</html>



