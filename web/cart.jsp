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



        <section id="shopping-cart-section">
            <div class="cart-container">
                <h2 class="cart-title">Your Shopping Cart</h2>

                <c:if test="${isSuccess ne null && isSuccess}">
                    <div id="notification-area" class="notification success">Success</div>
                </c:if>
                <c:if test="${isSuccess ne null && !isSuccess}">
                    <div id="notification-area" class="notification error">Fail!</div>
                </c:if>

                <form method="get" action="cart">
                    <div class="filter-bar">
                        <div class="filter-item">
                            <label for="filter-name">Filter by Name:</label>
                            <input
                                name="searchQuery"
                                value="${param.searchQuery}"
                                type="text"
                                id="filter-name"
                                placeholder="Enter product name"
                                />
                        </div>

                        <div class="filter-item">
                            <label for="filter-price">Filter category:</label>
                            <select id="filter-price" name="category">
                                <option value="">All</option>
                                <c:forEach var="cat" items="${categories}">
                                    <option value="${cat.categoryName}" ${param.category == cat.categoryName ? 'selected' : ''}>${cat.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="filter-item">
                            <button type="submit" class="apply-filter-btn">Apply Filters</button>
                        </div>
                    </div>
                </form>
                <table class="cart-table">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set value="0" var="total"/>
                        <c:forEach var="item" items="${cartItems}">
                            <tr id="item-1">
                                <td class="item-details">
                                    <img
                                        src="${item.productDetail.imageURL}"
                                        alt="product"
                                        class="item-image"
                                        />
                                    <div class="item-info">
                                        <p class="item-name">${item.productDetail.getProductName()}</p>
                                    </div>
                                </td>
                                <td class="item-price">
                                    <c:if test="${item.productDetail.discount != null && item.productDetail.discount != 0}">
                                        $${item.productDetail.price * (100.0- item.productDetail.discount)/100}
                                        <c:set value="${total + item.productDetail.price * (100.0- item.productDetail.discount)/100}" var="total"/>
                                    </c:if>
                                    <c:if test="${item.productDetail.discount == null || item.productDetail.discount == 0}">
                                        $${item.productDetail.price}
                                        <c:set value="${total + item.productDetail.price}" var="total"/>
                                    </c:if>
                                </td>
                                <td>
                                    <div class="quantity-controls">
                                        <form action="update-cart" method="post" style="display:inline;">
                                            <input type="hidden" name="cartId" value="${item.id}">
                                            <input type="number" class="item-quantity"  name="quantity" value="${item.quantity}" min="1" max="${item.productDetail.stock}">
                                            <button type="submit" class="apply-filter-btn">Update</button>
                                        </form>
                                    </div>
                                </td>
                                <td class="item-total">
                                    <c:if test="${item.productDetail.discount != null && item.productDetail.discount != 0}">
                                        $${item.quantity * (item.productDetail.price * (100.0- item.productDetail.discount)/100)}
                                    </c:if>
                                    <c:if test="${item.productDetail.discount == null || item.productDetail.discount == 0}">
                                        $${item.quantity * (item.productDetail.price)}
                                    </c:if>
                                </td>
                                <td class="cart-actions">
                                    <form action="delete-cart" method="post">
                                        <input type="hidden" name="cartId" value="${item.id}">
                                        <button type="submit" class="delete-item-btn">Remove</button>
                                    </form>
                                </td>
                            </tr> 
                        </c:forEach>

                        <!-- Repeat for other cart items -->
                    </tbody>
                </table>
                <div class="pagination">
                    <c:if test="${totalPages > 1}">
                        <c:forEach begin="1" end="${totalPages}" var="pageNum">
                            <a href="cart?page=${pageNum}&searchQuery=${param.searchQuery}&category=${param.category}"
                               class="page-link ${pageNum == currentPage ? 'active' : ''}">
                                ${pageNum}
                            </a>
                        </c:forEach>
                    </c:if>
                </div>

                <div class="cart-summary">
                    <p class="total-price">Total: <c:set var="totalPrice" value="0" />
                        <c:forEach var="item" items="${cartItemsFull}">
                            <c:if test="${item.productDetail.discount != null && item.productDetail.discount != 0}">
                                <c:set var="totalPrice" value="${totalPrice + item.quantity * (item.productDetail.price * (100.0- item.productDetail.discount)/100)}" />
                            </c:if>
                            <c:if test="${item.productDetail.discount == null || item.productDetail.discount == 0}">
                                <c:set var="totalPrice" value="${totalPrice + item.quantity * (item.productDetail.price)}" />
                            </c:if>

                        </c:forEach>
                        ${totalPrice}</p>
                    <div style="display: flex;">
                        <a href="list-product" class="checkout-btn" style="padding: 10px; margin-right: 10px">Buy more</a>
                        <c:if test="${cartItemsFull.size() ne 0}">
                            <a href="cart-contact" class="checkout-btn" style="padding: 10px;">Check Out</a>
                        </c:if>
                    </div>
                </div>
            </div>
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


    </body>
</html>

