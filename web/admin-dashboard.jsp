<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome CSS for icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

        <style>
            .category-item {
                padding: 20px;
                background: #f9f9f9;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                text-align: center;
                height: 100%;
                border: 2px solid #ddd; /* Added border */
            }

            .chart-container {
                padding-left: 15%;
                padding-right: 15%;
            }
        </style>
    </head>
    <body>

        <!-- Sidebar -->
        <%@ include file="admin-sidebar.jsp" %>

        <!-- Main content -->
        <div class="main-content text-center">
            <h1 class="mb-4">Admin Dashboard</h1>

            <!-- Statistics of new orders -->
            <div class="row">
                <div class="col-md-6 mb-4 p-3">
                    <h3>New Orders</h3>
                    <div class="chart-container">
                        <canvas id="newOrdersChart"></canvas>
                    </div>
                </div>
                <!-- Revenues -->
                <div class="col-md-6 mb-4 p-3">
                    <h3>Revenues</h3>
                    <div class="chart-container">
                        <canvas id="revenuesChart"></canvas>
                    </div>
                </div>

                <!-- Total Cost of Each Category -->
                <div class="col-12 mb-4 mt-4">
                    <h2>Total Cost by Category</h2>
                    <div class="row">
                        <div class="col-6">
                            <div class="chart-container">
                                <canvas id="totalCostByCategoryChart"></canvas>
                            </div>
                        </div>
                        <div class="col-6 row">
                            <c:forEach var="c" items="${categoryList}">
                                <div class="col-sm-6 col-md-4 mb-4">
                                    <div class="category-item">
                                        <p><strong>Category:</strong> ${c.categoryName}</p>
                                        <p><strong>Totalcost</strong> ${c.totalCost}$</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>

            

    </body>
</html>
