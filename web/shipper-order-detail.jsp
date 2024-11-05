<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh Sách Đơn Hàng</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .navbar {
                margin-bottom: 20px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
            .table-container {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }
            h2 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }
            .table th, .table td {
                text-align: center;
                vertical-align: middle;
            }
            .table tbody tr:hover {
                background-color: #f1f1f1;
            }
            .status-icon {
                font-size: 1.2em;
                color: #28a745;
            }
            .status-icon.pending {
                color: #ffc107;
            }
            .small-nav .nav-link {
                font-size: 0.9rem; /* Giảm kích thước font */
                padding: 5px 10px; /* Giảm padding */
            }
        </style>
    </head>
    <body>

        <!-- Header với logo và nút Đăng xuất -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/Image/logo.png" alt="Logo" style="height: 40px; width: 150px; object-fit: cover; margin-right: 10px;">
            </a>
            <div class="ml-auto">
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger my-2 my-sm-0" ><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </nav>

        <!-- Thanh điều hướng (thêm vào đây) -->
        <nav class="nav nav-pills nav-fill small-nav py-1">
            <a class="nav-item nav-link" href="${pageContext.request.contextPath}/shipper?page=view-all-order">View all order</a>
            <a class="nav-item nav-link" href="${pageContext.request.contextPath}/shipper?page=view-my-order">View my order</a>
            <a class="nav-item nav-link active">Order detail</a>
        </nav>


        <div class="container table-container">
            <h2>Order</h2>
            <div class="row">
                <div class="col-sm-6">
                    <div style="width: 100%">
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
                        </div>
                    </div>
                </div>
            </div>
            <div class="table-responsive cart_info">                        
                <table class="table table-condensed">
                    <thead>
                        <tr class="cart_menu">
                            <td class="image">Thumbnail</td>
                            <td class="price">Name</td>
                            <td class="price">Category</td>
                            <td class="quantity">Unit Price</td>
                            <td class="price">Quantity</td>
                            <td class="total">Total Cost</td>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="product" items="${orderedProducts}">
                            <tr>
                                <td class="cart_product">
                                    <img src="${product.imageURL}" alt="" style="width: 75px; height: 50; object-fit: cover">
                                </td>
                                <td class="cart_description">
                                    <h4>${product.getProductName()}</h4>
                                    <p></p>
                                </td>
                                <td class="cart_price">
                                    <p>${product.getCateogryName()}</p>
                                </td>
                                <td class="cart_price">
                                    ${String.format("%.2f", Double.parseDouble(product.discount != null &&  product.discount != 0 ? (product.price * (100-product.discount)/100) : product.price))}
                                </td>
                                <td class="cart_quantity">
                                    ${product.buyQuantity}
                                </td>
                                <td class="cart_total">
                                    ${String.format("%.2f", Double.parseDouble(order.totalCost))}
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
            <div>
                <strong>Total:</strong>${String.format("%.2f", Double.parseDouble(order.totalCost + totalToppingProducts))}
            </div>
        </div>

        <!-- jQuery và Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>



    </body>
</html>