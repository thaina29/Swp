<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Setting List</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- DataTable CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
        <!-- Font Awesome CSS for icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Sidebar -->
        <%@ include file="admin-sidebar.jsp" %>

        <div class="mt-5 main-content">
            <h2>Setting List</h2>

            <c:if test="${param.success ne null}">
                <div class="alert alert-success" role="alert">
                    Success!
                </div>
            </c:if>
            <c:if test="${param.fail ne null}">
                <div class="alert alert-danger" role="alert">
                    Failed!
                </div>
            </c:if>

            <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#addSettingModal">Add Setting</button>

            <!-- Status Filter -->
            <div class="mb-3">
                <label for="statusFilter">Filter by Status:</label>
                <select id="statusFilter" class="form-control" style="width: auto; display: inline-block;">
                    <option value="">All</option>
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                </select>
            </div>

            <!-- Name Search -->
            <div class="mb-3 mt-2">
                <label for="nameSearch">Search by Type:</label>
                <input type="text" id="nameSearch" class="form-control" style="width: auto; display: inline-block;" placeholder="Enter name">
            </div>

            <table id="settingTable" class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Type</th>
                        <th>Value</th>
                        <th>Order</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="setting" items="${settingList}">
                        <tr>
                            <td>${setting.getID()}</td>
                            <td>${setting.getType()}</td>
                            <td>${setting.getValue()}</td>
                            <td>${setting.getOrder()}</td>
                            <td>${setting.isDeleted ? 'Inactive' : 'Active'}</td>
                            <td>
                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editSettingModal_${setting.getID()}">Edit</button>
                            </td>
                        </tr>
                        <!-- Edit Setting Modal -->

                    </c:forEach>
                </tbody>
            </table>

<!--            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="?page=1" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${totalPages}" step="1" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link" href="?page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item">
                        <a class="page-link" href="?page=${totalPages}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>-->
        </div>

        <!--edit modal-->
        <c:forEach var="setting" items="${settingList}">
            <div class="modal fade" id="editSettingModal_${setting.getID()}" tabindex="-1" role="dialog" aria-labelledby="editSettingModalLabel_${setting.getID()}" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editSettingModalLabel_${setting.getID()}">Edit Setting</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- Edit Setting Form -->
                            <form action="setting" method="post">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="settingId" value="${setting.getID()}">
                                <div class="form-group">
                                    <label for="type">Type</label>
                                    <input type="text" class="form-control" id="type" name="type" value="${setting.getType()}">
                                </div>
                                <div class="form-group">
                                    <label for="value">Value</label>
                                    <input type="text" class="form-control" id="value" name="value" value="${setting.getValue()}">
                                </div>
                                <div class="form-group">
                                    <label for="order">Order</label>
                                    <input type="number" class="form-control" id="order" name="order" value="${setting.getOrder()}">
                                </div>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="false" ${!setting.isDeleted ? "selected" : ""}>Active</option>
                                        <option value="true" ${setting.isDeleted ? "selected" : ""}>Inactive</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="order">Description</label>
                                    <input type="text" class="form-control" id="order" name="description" value="${setting.getDescription()}">
                                </div>
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- Add Setting Modal -->
        <div class="modal fade" id="addSettingModal" tabindex="-1" role="dialog" aria-labelledby="addSettingModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addSettingModalLabel">Add Setting</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Add Setting Form -->
                        <form action="setting" method="post">
                            <input type="hidden" name="action" value="add">
                            <div class="form-group">
                                <label for="type">Type</label>
                                <input type="text" class="form-control" id="type" name="type" required>
                            </div>
                            <div class="form-group">
                                <label for="value">Value</label>
                                <input type="text" class="form-control" id="value" name="value" required>
                            </div>
                            <div class="form-group">
                                <label for="order">Order</label>
                                <input type="number" class="form-control" id="order" name="order" required>
                            </div>
                            <div class="form-group">
                                <label for="order">Description</label>
                                <input type="number" class="form-control" id="order" name="description" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Setting</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- DataTable JS -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

        <script>
            $(document).ready(function () {
                let table = $('#settingTable').DataTable({
                    "paging": true,
                    "pageLength": 5,
                    "lengthChange": false,
                    "searching": true,
                    "ordering": true,
                    "info": false,
                    "autoWidth": false
                });

                $('#nameSearch').on('keyup', function () {
                    table.columns(1).search(this.value).draw();
                });

                $('#statusFilter').on('change', function () {
                    var selectedStatus = $(this).val();
                    if (selectedStatus) {
                        table.columns(4).search('^' + selectedStatus + '$', true, false).draw();
                    } else {
                        table.columns(4).search('').draw();
                    }
                });
                
                 $('#settingTable_wrapper .dataTables_filter').addClass('d-none');
            });
        </script>

    </body>
</html>
