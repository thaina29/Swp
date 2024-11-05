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
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/customCSS/customCSS.css"/>
        <style>
            .order-details-container {
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 8px;
                margin: 0 auto;
                max-width: 800px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .section-title {
                font-size: 24px;
                margin-bottom: 20px;
                color: #333;
            }

            .section-subtitle {
                font-size: 20px;
                margin-top: 30px;
                margin-bottom: 15px;
                color: #555;
            }

            .order-info, .receiver-info {
                background-color: #fff;
                padding: 15px;
                border-radius: 6px;
                margin-bottom: 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            }

            .order-info p, .receiver-info p {
                margin: 5px 0;
                font-size: 16px;
                color: #444;
            }

            .table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 15px;
                margin-bottom: 20px;
            }

            .table th, .table td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .table-striped tbody tr:nth-child(odd) {
                background-color: #f2f2f2;
            }

            .thumbnail-img {
                width: 60px;
                height: 60px;
                border-radius: 4px;
            }

            .total-cost {
                text-align: right;
                font-size: 18px;
                margin-top: 15px;
                color: #333;
            }

            .btn {
                padding: 8px 12px;
                text-decoration: none;
                border-radius: 5px;
                display: inline-block;
                margin-top: 10px;
                font-size: 14px;
            }

            .btn-primary {
                background-color: #007bff;
                color: white;
            }

            .btn-secondary {
                background-color: #6c757d;
                color: white;
            }

            .btn-danger {
                background-color: #dc3545;
                color: white;
            }

            .btn:hover {
                opacity: 0.85;
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


        <div class="order-details-container">
            <!-- Order Information -->
            <h2 class="section-title">Order Details</h2>
            <div class="order-info">
                <p><strong>Order ID:</strong> ${order.id}</p>
                <p><strong>Order Date:</strong> ${order.createdAt}</p>
                <p><strong>Total Cost:</strong> $${order.totalCost}</p>
                <p><strong>Status:</strong> ${order.status}</p>
                <p><strong>Payment Method:</strong> ${order.paymentMethod}</p>
            </div>

            <!-- Receiver Information -->
            <h3 class="section-subtitle">Receiver Information</h3>
            <div class="receiver-info">
                <p><strong>Full Name:</strong> ${order.fullname}</p>
                <p><strong>Address:</strong> ${order.address}</p>
                <p><strong>Phone:</strong>  ${order.phone}</p>
                <p><strong>Gender:</strong> ${order.getGender(sessionScope.user.email)}</p>
            </div>


            <!-- Ordered Products -->
            <h3 class="section-subtitle">Ordered Products</h3>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Thumbnail</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Unit Price</th>
                        <th>Quantity</th>
                        <th>Total Cost</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${orderedProducts}">
                        <tr>
                            <td><img src="${product.imageURL}" alt="..." width="100" height="100"></td>
                            <td>${product.getProductName()}</td>
                            <td>${product.getCateogryName()}</td>
                            <td>$${product.discount != null &&  product.discount != 0 ? (product.price * (100-product.discount)/100) : product.price}</td>
                            <td>${product.buyQuantity}</td>
                            <td>$${product.discount != null &&  product.discount != 0 ? (product.price * (100-product.discount)/100)*(product.buyQuantity) : product.price*product.buyQuantity}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/public/product-detail?id=${product.productId}&pdid=${product.productDetailId}" class="btn btn-primary">Re-buy</a>
                                <c:if test="${order.status eq 'Close' && !product.isFeedbacked()}">
                                    <a href="feedback?id=${product.orderDetailId}" class="btn btn-secondary">Feedback</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div class="total-cost">
                <strong>Total Order Price:</strong> $${order.totalCost}
            </div>

            <!-- Order Actions -->
            <c:if test="${order.status ne 'Close' && order.status ne 'Canceled' && order.status ne 'Failed' && order.status ne 'Success' && order.status ne 'Rejected' && order.status ne 'Delivering'}">
                <div class="order-actions">
                    <a href="href="cancel-order?orderId=${order.id}"" class="btn btn-danger btn-cancel">Cancel Order</a>
                </div>
            </c:if>
        </div>

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


    </body>
</html>


