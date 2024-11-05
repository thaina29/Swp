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

        <title>Electro - HTML Ecommerce Template</title>

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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
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
            <nav id="navigation">
                <!-- container -->
                <div class="container">
                    <!-- responsive-nav -->
                    <div id="responsive-nav">
                        <!-- NAV -->
                        <ul class="main-nav nav navbar-nav">
                            <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/public/list-product">All products</a></li>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>

        <form action="list-product">
            <input type="hidden" value="${searchQuery}" name="searchQuery"/>
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- ASIDE -->
                        <div id="aside" class="col-md-3">
                            <!-- aside Widget -->
                            <div class="aside">
                                <h3 class="aside-title">Categories</h3>
                                <div class="checkbox-filter">

                                    <c:forEach items="${categories}" var="category">
                                        <div class="panel panel-default">
                                            <div class="panel-heading" style="display: flex; background-color: #FFF;">
                                                <input style="height: 18px; width: 18px; margin: 0; background-color: #FFF;"
                                                       type="checkbox" value="${category.ID}" name="category"
                                                       ${categoriesCheckBox.contains(category.ID.toString()) ? 'checked' : ''}
                                                       />
                                                <p class="panel-title" style="margin-left: 5px">${category.categoryName}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- /aside Widget -->

                            <!-- aside Widget -->
                            <div class="aside">
                                <h3 class="aside-title">Price</h3>
                                <div class="price-filter">
                                    <div class="input-number price-min">
                                        <input id="price-min" name="minPrice" type="number" value="${minPrice}">
                                        <span class="qty-up">+</span>
                                        <span class="qty-down">-</span>
                                    </div>
                                    <span>-</span>
                                    <div class="input-number price-max">
                                        <input id="price-max" name="maxPrice" type="number" value="${maxPrice}">
                                        <span class="qty-up">+</span>
                                        <span class="qty-down">-</span>
                                    </div>
                                </div>
                            </div>
                            <!-- /aside Widget -->

                            <!-- aside Widget -->
                            <div style="margin-top: 10px; display: flex; justify-content: center">
                                <button type="submit" class="add-to-cart" style="height: 30px; width: 100%">
                                    Confirm
                                </button>
                            </div>
                            <!-- /aside Widget -->

                        </div>
                        <!-- /ASIDE -->

                        <!-- STORE -->
                        <div id="store" class="col-md-9">
                            <!-- store top filter -->
                            <div class="store-filter clearfix">
                                <div class="store-sort">
                                    <label>
                                        Sort By Name:
                                        <select class="input-select" name="arrangeName">
                                            <option value="ASC" ${arrangeName == 'ASC' ? 'selected' : ''}>Name A-Z</option>
                                            <option value="DESC" ${arrangeName == 'DESC' ? 'selected' : ''}>Name Z-A</option>
                                        </select>
                                    </label>

                                    <label>
                                        Sort By Price:
                                        <select class="input-select" name="arrangePrice">
                                            <option value="ASC" ${arrangePrice == 'ASC' ? 'selected' : ''}>Increasing</option>
                                            <option value="DESC" ${arrangePrice == 'DESC' ? 'selected' : ''}>Decreasing</option>
                                        </select>
                                    </label>
                                </div>
                                <ul class="store-grid">

                                </ul>
                            </div>
                            <!-- /store top filter -->

                            <!-- store products -->
                            <div class="row">

                                <c:forEach items="${products}" var="product">
                                    <div class="col-md-4 col-xs-6">
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="${product.productDetail.imageURL}" alt="">
                                                <div class="product-label">
                                                    <c:if test="${product.productDetail.discount != null && product.productDetail.discount != 0}">
                                                        <span class="sale">-${product.productDetail.discount}%</span>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">${product.categoryName}</p>
                                                <h3 class="product-name"><a href="#">${product.productName}</a></h3>
                                                <h4 class="product-price">${String.format("%.2f", product.productDetail.price * (1 - product.productDetail.discount/100))}</h4>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="product-btns">
                                                    <button type="button" class="btn quick-view" onclick="productDetail(${product.productId})"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart" onclick="addToCart(`${product.productDetail.productDetailId}`, ${product.productDetail.stock - product.productDetail.hold})">
                                                <button type="button" class="add-to-cart-btn" >add to cart</button>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!-- product -->

                                <!-- /product -->



                            </div>
                            <!-- /store products -->

                            <!-- store bottom filter -->
                            <div class="store-filter clearfix">
                                <ul class="store-pagination">
                                    <c:forEach begin="1" end="${endPage}" varStatus="status">
                                        <li><button type="submit" 
                                                    class="btn btn-default add-to-cart" ${status.index == page ? 'style="background-color: #FE980F"' : ''} 
                                                    name="page" value="${status.index}">${status.index}
                                            </button></li>
                                        </c:forEach>
                                </ul>
                            </div>
                            <!-- /store bottom filter -->
                        </div>
                        <!-- /STORE -->
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
        </form>





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
        <script>
                                    function productDetail(id) {
                                        window.location.href = "product-detail?id=" + id;
                                    }
                                    function addToCart(id) {
                                        if(${sessionScope.user == null}){
                                            window.alert('You need to login to add cart');
                                            return;
                                        }
                                        if (stock == 0) {
                                            alert('Đã hết hàng');
                                            return;
                                        }
                                        fetch('add-cart?id=' + id + '&quantity=1');
                                        window.alert('Thêm thành công');
                                    }
        </script>

    </body>
</html>
