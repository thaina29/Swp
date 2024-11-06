<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User List</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- DataTable CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
        <!-- Font Awesome CSS for icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

        <style>
            .modal-lg {
                max-width: 80%;
            }

            .table th, .table td {
                vertical-align: middle;
            }

        </style>
    </head>
    <body>
        <!-- Sidebar -->
        <%@ include file="marketing-sidebar.jsp" %>

        <div class="mt-5 main-content">
            <h2>User List</h2>


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

            <!--<button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#addUserModal">Add User</button>-->

            <!--filter form-->
            <form id="searchForm" action="user" method="get" class="form-inline mb-3">
                <div class="form-group mr-2">
                    <input type="text" class="form-control" name="fullName" placeholder="Full Name" value="${fullName}">
                </div>
                <div class="form-group mr-2">
                    <input type="text" class="form-control" name="email" placeholder="Email" value="${email}">
                </div>
                <div class="form-group mr-2">
                    <input type="text" class="form-control" name="phone" placeholder="Phone" value="${phone}">
                </div>
                <div class="form-group mr-2">
                    <select class="form-control" name="gender">
                        <option value="">Select Gender</option>
                        <option value="Male" ${gender eq 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${gender eq 'Female' ? 'selected' : ''}>Female</option>
                    </select>
                </div>
                <div class="form-group mr-2">
                    <select class="form-control" name="status">
                        <option value="">Select Status</option>
                        <option value="true" ${statusString eq 'true' ? 'selected' : ''}>Inactive</option>
                        <option value="false" ${statusString eq 'false' ? 'selected' : ''}>Active</option>
                    </select>
                </div>
                <input type="hidden" name="page" id="pageInput" value="1">
                <button type="submit" class="btn btn-primary mt-3">Search</button>
            </form>


            <table id="userTable" class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Gender</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.fullname}</td>
                            <td>${user.email}</td>
                            <td>${user.gender}</td>
                            <td>${user.address}</td>
                            <td>${user.phone}</td>
                            <td>${user.isDeleted ? 'Inactive' : 'Active'}</td>
                            <td>
                                <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#userInfoModal_${user.id}">Info</button>
                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editUserModal_${user.id}">Edit</button>
                            </td>
                        </tr>

                    </c:forEach>
                </tbody>
            </table>

            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item">
                        <button class="page-link" onclick="submitFormWithPage(1)" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </button>
                    </li>
                    <c:forEach begin="1" end="${totalPages}" step="1" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <button class="page-link" onclick="submitFormWithPage(${i})">${i}</button>
                        </li>
                    </c:forEach>
                    <li class="page-item">
                        <button class="page-link" onclick="submitFormWithPage(${totalPages})" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </button>
                    </li>
                </ul>
            </nav>
        </div>

        <c:forEach var="user" items="${userList}">

            <!-- Edit User Modal -->
            <div class="modal fade" id="editUserModal_${user.id}" tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel_${user.id}" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editUserModalLabel_${user.id}">Edit User</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- Edit User Form -->
                            <form action="user" method="post">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="userId" value="${user.id}">
                                <div class="form-group">
                                    <label for="fullName">Full Name</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName" value="${user.fullname}">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" value="${user.getEmail()}">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <select class="form-control" id="gender" name="gender">
                                        <option value="true" ${user.gender eq 'Male' ? "selected" : ""}>Male</option>
                                        <option value="false" ${user.gender eq 'Female' ? "selected" : ""}>Female</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input type="text" class="form-control" id="address" name="address" value="${user.getAddress()}">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="text" class="form-control" id="phone" name="phone" value="${user.getPhone()}">
                                </div>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="false" ${!user.isDeleted ? "selected" : ""}>Active</option>
                                        <option value="true" ${user.isDeleted ? "selected" : ""}>Inactive</option>
                                    </select>
                                </div>
                                <!-- Add other fields as needed -->
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- User Info Modal -->
            <div class="modal fade" id="userInfoModal_${user.id}" tabindex="-1" role="dialog" aria-labelledby="userInfoModalLabel_${user.id}" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="userInfoModalLabel_${user.id}">User Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="d-flex flex-column align-items-center">
                                <img src="${user.avatar}" class="img-thumbnail mb-3" alt="Profile Image" style="width: 150px; height: 150px;">
                            </div>
                            <table class="table table-bordered">
                                <tbody>
                                    <tr>
                                        <th>ID</th>
                                        <td>${user.id}</td>
                                    </tr>
                                    <tr>
                                        <th>Full Name</th>
                                        <td>${user.fullname}</td>
                                    </tr>
                                    <tr>
                                        <th>Email</th>
                                        <td>${user.getEmail()}</td>
                                    </tr>
                                    <tr>
                                        <th>Gender</th>
                                        <td>${user.gender}</td>
                                    </tr>
                                    <tr>
                                        <th>Address</th>
                                        <td>${user.getAddress()}</td>
                                    </tr>
                                    <tr>
                                        <th>Phone</th>
                                        <td>${user.getPhone()}</td>
                                    </tr>
                                    <tr>
                                        <th>Status</th>
                                        <td>${user.isDeleted ? 'Inactive' : 'Active'}</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div>
                                <strong>History Change</strong>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Update at</th>
                                            <th>Email</th>
                                            <th>Full Name</th>
                                            <th>Gender</th>
                                            <th>Address</th>
                                            <th>Phone</th>
                                            <th>Update by</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        ${user.changeHistory eq null ? '<tr><td>No data</td></tr>' : user.changeHistory}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </c:forEach>

        <!-- Add User Modal -->
        


        <!-- Bootstrap JS and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- DataTable JS -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

        <script>
                            $(document).ready(function () {
                                $('#userTable').DataTable({
                                    "paging": false,
                                    "lengthChange": false,
                                    "searching": false,
                                    "ordering": true,
                                    "info": false,
                                    "autoWidth": false
                                });
                            });
        </script>

        <script>
            function submitFormWithPage(page) {
                document.getElementById('pageInput').value = page;
                document.getElementById('searchForm').submit();
            }
        </script>

    </body>
</html>
