<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">


        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css2/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css2/slick.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css2/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css2/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css2/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css2/style.css"/>
        
        <style>
            .custom-user-profile {
                position: relative;
                display: inline-block;
            }

            .custom-user-image {
                width: 30px;
                height: 30px;
                border-radius: 50%;
            }

            .custom-dropdown {
                display: inline-block;
            }

            .custom-dropbtn {
                background-color: #F9F3EC;
                ;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .custom-dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1000;
            }

            .custom-dropdown-item {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .custom-dropdown-item:hover {
                background-color: #f1f1f1;
            }

            .custom-dropdown:hover .custom-dropdown-content {
                display: block;
            }

        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>



        <section style="background-color: #eee;">
            <div class="alert alert-success" style="visibility: ${param.success ne null ? 'visible' : 'hidden'}" role="alert">
                Success!
            </div>
            <div class="alert alert-danger" style="display: ${param.fail ne null ? 'block': 'none'}"  role="alert">
                Failed!
            </div>
            <form id="profileForm" onsubmit="return validateForm()" action="profile" method="post">
                <div class="container py-5">

                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-body text-center">
                                    <img id="image0" src="${sessionScope.user.avatar}" alt="avatar"
                                         class="rounded-circle img-fluid" style="width: 150px; border: 1px solid black">
                                    <h5 class="my-3">${sessionScope.user.fullname}</h5>
                                    <div class="d-flex justify-content-center mb-2">
                                        <input type="file" class="form-control" id="imageFile0" accept="image/*" onchange="updateImage(0)">
                                        <input type="hidden" class="form-control" id="imageUrl0" name="avatar" value="${sessionScope.user.avatar}">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-8">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Full Name</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-outline" data-mdb-input-init>
                                                <input type="text" name="fullname" class="form-control" value="${sessionScope.user.fullname}" required/>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Email</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-outline" data-mdb-input-init>
                                                <input type="text" class="form-control" value="${sessionScope.user.email}" disabled/>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Phone</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-outline" data-mdb-input-init>
                                                <input type="text" name="phone" class="form-control" value="${sessionScope.user.phone}" required/>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Gender</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <select style="padding: 1.25rem 0rem 1.25rem 1.25rem;
                                                    border: 1px solid rgba(65, 64, 62, 0.20);
                                                    border-radius: 0.25rem;
                                                    color: #908F8D" name="gender">
                                                <option value="Male" ${sessionScope.user.gender eq 'Male' ? 'selected' : ''}>Male</option>
                                                <option value="Female" ${sessionScope.user.gender eq 'Female' ? 'selected' : ''}>Female</option>
                                            </select>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Address</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-outline" data-mdb-input-init>
                                                <input type="text" name="address" class="form-control" value="${sessionScope.user.address}" required/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center my-3">
                                <button  type="submit" class="btn btn-primary">Submit</button>
                                <a  href="change-pass" class="btn btn-outline-primary ms-1">Change password</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </section>



        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">About Us</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Categories</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Hot deals</a></li>
                                    <li><a href="#">Laptops</a></li>
                                    <li><a href="#">Smartphones</a></li>
                                    <li><a href="#">Cameras</a></li>
                                    <li><a href="#">Accessories</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Information</h3>
                                <ul class="footer-links">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Orders and Returns</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Service</h3>
                                <ul class="footer-links">
                                    <li><a href="#">My Account</a></li>
                                    <li><a href="#">View Cart</a></li>
                                    <li><a href="#">Wishlist</a></li>
                                    <li><a href="#">Track My Order</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="footer-payments">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul>
                            <span class="copyright">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </span>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <script src="${pageContext.request.contextPath}/js2/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js2/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js2/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/js2/nouislider.min.js"></script>
        <script src="${pageContext.request.contextPath}/js2/jquery.zoom.min.js"></script>
        <script src="${pageContext.request.contextPath}/js2/main.js"></script>
        <script type="text/javascript">
                                    function validateForm() {
                                        let email = document.getElementById('email').value;
                                        let fullname = document.getElementById('fullname').value;
                                        let gender = document.getElementById('gender').value;
                                        let address = document.getElementById('address').value;
                                        let phone = document.getElementById('phone').value;

                                        if (!validateEmail(email)) {
                                            alert("Please enter a valid email address.");
                                            return false;
                                        }
                                        if (fullname.trim() === "") {
                                            alert("Full name is required.");
                                            return false;
                                        }
                                        if (gender !== "Male" && gender !== "Female") {
                                            alert("Please select a valid gender.");
                                            return false;
                                        }
                                        if (address.trim() === "") {
                                            alert("Address is required.");
                                            return false;
                                        }
                                        if (!validatePhone(phone)) {
                                            alert("Please enter a valid phone number.");
                                            return false;
                                        }
                                        return true;
                                    }

                                    function validateEmail(email) {
                                        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                                        return re.test(String(email).toLowerCase());
                                    }

                                    function validatePhone(phone) {
                                        const re = /^\d{10}$/;
                                        return re.test(phone);
                                    }

                                    function updateImage(sliderId) {
                                        let fileInput = document.getElementById(`imageFile` + sliderId);
                                        let image = document.getElementById(`image` + sliderId);
                                        let hiddenInput = document.getElementById(`imageUrl` + sliderId);


                                        // check file uploaded
                                        if (fileInput.files && fileInput.files[0]) {
                                            const file = fileInput.files[0];
                                            const maxSize = 1 * 1024 * 1024; // 1 MB in bytes

                                            if (file.size > maxSize) {
                                                alert("The selected file is too large. Please select a file smaller than 1 MB.");
                                                fileInput.value = ''; // Clear the file input
                                                return;
                                            }

                                            // dịch image thành url
                                            const reader = new FileReader();

                                            reader.onload = function (e) {
                                                // Update the image src
                                                image.src = e.target.result;

                                                // Optionally, update the hidden input with the base64 data URL
                                                hiddenInput.value = e.target.result;
                                            };

                                            reader.readAsDataURL(file);
                                        }
                                    }
        </script>

    </body>
</html>
