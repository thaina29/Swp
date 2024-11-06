<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Marketing Dashboard</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome CSS for icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

    </head>
    <body>

        <!-- Sidebar -->
        <%@ include file="sale-sidebar.jsp" %>

        <!-- Main content -->
        <div class="main-content" style="margin-top: 10%; margin-bottom: 10%">
            <c:if test="${isSuccess ne null && isSuccess}">
                <div class="alert alert-success alert-dismissible fade show mt-2" role="alert" id="mess">
                    <strong>Update Order success!</strong> 
                </div>
            </c:if>
            <c:if test="${isSuccess ne null && !isSuccess}">
                <div class="alert alert-danger alert-dismissible fade show mt-2" role="alert" id="mess">
                    <strong>Update Order failed!</strong> You should check your network.
                </div>
            </c:if>
            <!-- Order Details -->
            <h2>Order Details</h2>
            <p>Order ID: ${order.id}</p>
            <p>Order Date: ${order.createdAt}</p>
            <p>Total Cost: $${order.totalCost}</p>
            <p>Status: ${order.status}</p>
            <p>Payment Method: ${order.paymentMethod}</p>

            <!-- Receiver Information -->
            <h3>Receiver Information</h3>
            <p>Full Name: ${order.fullname}</p>
            <p>Address: ${order.address}</p>
            <p>Phone: ${order.phone}</p>
            <p>Gender: ${order.user.gender}</p>
            <p>Sale name: ${order.sale.fullname}</p>

            <!-- Ordered Products -->
            
        </div>
        <!-- Bootstrap JS and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    </body>
</html>
