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

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css2/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css2/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css2/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css2/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css2/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css2/style.css"/>
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

            /* Style cho slick banner container */
            .banner-slick {
                width: 100%;
                max-width: 1200px;
                margin: 0 auto;
                position: relative;
                overflow: hidden;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }

            /* Style cho từng slide */
            .banner-slide {
                
                padding: 20px;
                gap: 20px; /* Khoảng cách giữa ảnh và nội dung */
            }

            /* Style cho ảnh */
            .banner-img {
                max-width: 100%; /* Chiếm tối đa 40% chiều rộng */
            }

            .banner-img img {
                width: 100%;
                height: auto;
                object-fit: cover;
                border-radius: 10px;
            }

            /* Style cho title và description */
            .banner-content {
                flex: 2; /* Chiếm 2 phần không gian */
                color: #000;
                text-align: left;
                text-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            }

            .banner-content h2 {
                font-size: 36px;
                font-weight: bold;
                margin: 0 0 10px 0;
            }

            .banner-content p {
                font-size: 18px;
                margin: 0;
            }

            /* Style cho nút điều hướng (dots) */
            .slick-dots {
                position: absolute;
                bottom: 10px;
                width: 100%;
                text-align: center;
            }

            .slick-dots li button:before {
                font-size: 12px;
                color: #000;
                opacity: 0.7;
            }

            .slick-dots li.slick-active button:before {
                opacity: 1;
            }




        </style>

    </head>
    <body>
        <!-- HEADER -->
        <jsp:include page="Header.jsp"></jsp:include>
            <!-- /HEADER -->

            <!-- NAVIGATION -->
            <nav id="navigation">
                <!-- container -->
                <div class="container">
                    <!-- responsive-nav -->
                    <div id="responsive-nav">
                        <!-- NAV -->
                        <ul class="main-nav nav navbar-nav">
                            <li class="active"><a href="#">Home</a></li>
                            <li><a href="#">Hot Deals</a></li>
                            <li><a href="#">Categories</a></li>
                            <li><a href="#">Laptops</a></li>
                        </ul>
                        <!-- /NAV -->
                    </div>
                    <!-- /responsive-nav -->
                </div>
                <!-- /container -->
            </nav>
            <!-- /NAVIGATION -->

            <!-- SECTION -->
            <div class="banner-slick">
            <c:forEach var="slider" items="${sliders}">
                <div class="banner-slide" style="display: flex; align-items: center;justify-content: space-evenly">
                    <div class="banner-img">
                        <img src="${slider.imageUrl}" alt="Banner 1">
                    </div>
                    <div class="banner-content">
                        <h2>${slider.title}</h2>
                        <p>${slider.notes}</p>
                    </div>
                </div>

            </c:forEach>
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">New Products</h3>

                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <!-- product -->

                                        <c:forEach items="${products}" var="p">

                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="${p.productDetail.imageURL}" alt="">
                                                    <c:if test="${p.productDetail.discount != null && p.productDetail.discount != 0}">
                                                        <div class="product-label">
                                                            <span class="sale">-${p.productDetail.discount}%</span>
                                                        </div>
                                                    </c:if>
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#">${p.productName}</a></h3>
                                                    <h4 class="product-price">${p.productDetail.price*(100 - (p.productDetail.discount eq null ? 100 : p.productDetail.discount)) / 100} <del class="product-old-price">${p.productDetail.price}</del></h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="product-btns">
                                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                        <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                </div>
                                            </div>

                                        </c:forEach>
                                        <!-- /product -->

                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->
        <div id="hot-deal" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <ul class="hot-deal-countdown">
                                <li>
                                    <div>
                                        <h3>02</h3>
                                        <span>Days</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>10</h3>
                                        <span>Hours</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>34</h3>
                                        <span>Mins</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>60</h3>
                                        <span>Secs</span>
                                    </div>
                                </li>
                            </ul>
                            <h2 class="text-uppercase">hot deal this week</h2>
                            <p>New Collection Up to 50% OFF</p>
                            <a class="primary-btn cta-btn" href="#">Shop now</a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Lasted Post</h3>

                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">

                                        <c:forEach var="post" items="${posts}" begin="0" end="3" step="1">
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="${post.imgURL}" alt="">

                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">23.12.2022</p>
                                                    <h3 class="product-name"><a href="#">${post.title}</a></h3>
                                                    <h4 class="product-price">${fn:substring(post.content, 0, 50)}...</h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="product-btns">

                                                        <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                    </div>
                                                </div>

                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->



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
        <script src="js2/jquery.min.js"></script>
        <script src="js2/bootstrap.min.js"></script>
        <script src="js2/slick.min.js"></script>
        <script src="js2/nouislider.min.js"></script>
        <script src="js2/jquery.zoom.min.js"></script>
        <script src="js2/main.js"></script>
        <script>
                                    $(document).ready(function () {
                                        // Khởi tạo slick slider cho banner
                                        $('.banner-slick').slick({
                                            slidesToShow: 1, // Hiển thị 1 slide mỗi lần
                                            slidesToScroll: 1, // Chuyển qua 1 slide mỗi lần
                                            autoplay: true, // Tự động chuyển slide
                                            autoplaySpeed: 3000, // Tốc độ chuyển mỗi 3 giây
                                            infinite: true, // Lặp lại liên tục
                                            speed: 500, // Tốc độ chuyển
                                            dots: true, // Hiển thị nút điều hướng
                                            arrows: false, // Ẩn mũi tên điều hướng
                                            fade: true, // Hiệu ứng chuyển mờ dần
                                        });
                                    });
        </script>
    </body>
</html>
