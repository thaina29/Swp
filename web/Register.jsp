<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Register</title>
        <!-- Font Awesome -->
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"
            />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
            />

        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.min.css"
            rel="stylesheet"
            />
        <!-- Custom styles -->
        <style>
            .icon-hover:hover {
                border-color: #3b71ca !important;
                background-color: white !important;
            }

            .icon-hover:hover i {
                color: #3b71ca !important;
            }
        </style>
    </head>
    <body>
        <!--Main Navigation-->
        <header>
            <!-- Jumbotron -->
            <jsp:include page="Header.jsp"></jsp:include>
                <!-- Jumbotron -->


            </header>
            <!-- Section: Design Block -->
            <section class="text-center">
                <!-- Background image -->
                <div class="p-5 bg-image" style="
                     background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg');
                     height: 300px;
                     "></div>
                <!-- Background image -->

                <div class="card mx-4 mx-md-5 shadow-5-strong bg-body-tertiary" style="
                     margin-top: -100px;
                     backdrop-filter: blur(30px);
                     ">
                    <div class="card-body py-5 px-md-5">

                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-8">
                                <h2 class="fw-bold mb-5">Sign up now</h2>
                            <% if (request.getAttribute("errorMessage") != null) { %>
                            <div class="text-danger">
                                <%= request.getAttribute("errorMessage") %>
                            </div>
                            <% } %>
                            <form action="register" method="post" >
                                <!-- 2 column grid layout with text inputs for the first and last names -->
                                <div class="form-outline mb-4">
                                    <div data-mdb-input-init class="form-outline">
                                        <input type="text" id="fullName" name="fullName" required oninput="validateFullName()" class="form-control" />
                                        <label class="form-label" for="fullName">Full Name</label>
                                    </div>
                                    <div id="fullNameError" class="text-danger"></div>
                                </div>

                                <!-- Email input -->
                                <div data-mdb-input-init class="form-outline mb-1">
                                    <input type="email" class="form-control" id="email" name="email" required oninput="validateEmail()" />
                                    <label class="form-label" for="email">Email</label>
                                </div>
                                <div id="emailError" class="text-danger"></div>

                                <!-- Password input -->
                                <div data-mdb-input-init class="form-outline mt-3 mb-1">
                                    <input type="password" class="form-control" id="password" name="password" required oninput="validatePassword()" />
                                    <label class="form-label" for="password">Password</label>
                                </div>
                                <div id="passwordError" class="text-danger"></div>

                                <div data-mdb-input-init class="form-outline mt-3 mb-1">
                                    <input type="password" class="form-control" id="retypePassword" name="retypePassword" required oninput="validateRetypePassword()" />
                                    <label class="form-label" for="retypePassword">Re-Password</label>
                                </div>
                                <div id="retypePasswordError" class="text-danger"></div>


                                <div class="row mt-3">
                                    <div class="col-md-8 mb-1">
                                        <div data-mdb-input-init class="form-outline">
                                            <input type="text" class="form-control" id="phone" name="phone" required oninput="validatePhone()" />
                                            <label class="form-label" for="phone">Phone</label>
                                        </div>
                                        <div id="phoneError" class="error-message"></div>
                                    </div>
                                    <div class="col-md-4 mb-1">
                                        <label class="form-label select-label">Gender</label>
                                        <select class="select" id="gender" name="gender" required>
                                                <option value="true">Male</option>
                                                <option value="false">Female</option>
                                        </select>
                                        
                                    </div>
                                </div>
                                <div data-mdb-input-init class="form-outline mt-3 mb-1">
                                    <input type="text" class="form-control" id="address" name="address" required oninput="validateAddress()">
                                    <label class="form-label" for="address">Address</label>
                                </div>
                                <div id="addressError" class="error-message"></div>


                                <!-- Submit button -->
                                <button type="submit" class="btn btn-primary btn-block mb-4">
                                    Register
                                </button>
                            </form>
                            <p>Already have an account? <a href="login">Login</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Section: Design Block -->



        <!-- Footer -->
        <footer
            class="text-center text-lg-start text-muted mt-3"
            style="background-color: #f5f5f5"
            >
            <!-- Section: Links  -->
            <section class="">
                <div class="container text-center text-md-start pt-4 pb-4">
                    <!-- Grid row -->
                    <div class="row mt-3">
                        <!-- Grid column -->
                        <div class="col-12 col-lg-3 col-sm-12 mb-2">
                            <!-- Content -->
                            <a href="https://mdbootstrap.com/" target="_blank" class="">
                                <img
                                    src="${pageContext.request.contextPath}/Image/logo.png"
                                    height="35"
                                    />
                            </a>
                            <p class="mt-2 text-dark">© 2023 Copyright: SWP391 - FPT University</p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-6 col-sm-4 col-lg-2">
                            <!-- Links -->
                            <h6 class="text-uppercase text-dark fw-bold mb-2">Store</h6>
                            <ul class="list-unstyled mb-4">
                                <li><a class="text-muted" href="#">About us</a></li>
                                <li><a class="text-muted" href="#">Find store</a></li>
                                <li><a class="text-muted" href="#">Categories</a></li>
                                <li><a class="text-muted" href="#">Blogs</a></li>
                            </ul>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-6 col-sm-4 col-lg-2">
                            <!-- Links -->
                            <h6 class="text-uppercase text-dark fw-bold mb-2">Information</h6>
                            <ul class="list-unstyled mb-4">
                                <li><a class="text-muted" href="#">Help center</a></li>
                                <li><a class="text-muted" href="#">Money refund</a></li>
                                <li><a class="text-muted" href="#">Shipping info</a></li>
                                <li><a class="text-muted" href="#">Refunds</a></li>
                            </ul>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-6 col-sm-4 col-lg-2">
                            <!-- Links -->
                            <h6 class="text-uppercase text-dark fw-bold mb-2">Support</h6>
                            <ul class="list-unstyled mb-4">
                                <li><a class="text-muted" href="#">Help center</a></li>
                                <li><a class="text-muted" href="#">Documents</a></li>
                                <li><a class="text-muted" href="#">Account restore</a></li>
                                <li><a class="text-muted" href="#">My orders</a></li>
                            </ul>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-12 col-sm-12 col-lg-3">
                            <!-- Links -->
                            <h6 class="text-uppercase text-dark fw-bold mb-2">Newsletter</h6>
                            <p class="text-muted">
                                Stay in touch with latest updates about our products and offers
                            </p>
                            <div class="input-group mb-3">
                                <input
                                    type="email"
                                    class="form-control border"
                                    placeholder="Email"
                                    aria-label="Email"
                                    aria-describedby="button-addon2"
                                    />
                                <button
                                    class="btn btn-light border shadow-0"
                                    type="button"
                                    id="button-addon2"
                                    data-mdb-ripple-color="dark"
                                    >
                                    Join
                                </button>
                            </div>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                </div>
            </section>
            <!-- Section: Links  -->

        </footer>
        <!-- Footer -->
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.umd.min.js"
        ></script>
        <!-- Custom scripts -->
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



