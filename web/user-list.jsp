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
    </head>
    <body>
        <!-- Sidebar -->
        <%@ include file="admin-sidebar.jsp" %>

        <div class="mt-5 main-content">
            <h2>Staff List</h2>


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

            <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#addUserModal">Add User</button>

            <!--filter form-->
            <form action="user" method="get" class="form-inline mb-3">
                <div class="form-group mr-2">
                    <input type="text" class="form-control" name="fullName" placeholder="Full Name">
                </div>
                <div class="form-group mr-2">
                    <input type="text" class="form-control" name="email" placeholder="Email">
                </div>
                <div class="form-group mr-2">
                    <input type="text" class="form-control" name="phone" placeholder="Phone">
                </div>

                <div class="form-group mr-2">
                    <select class="form-control" name="role">
                        <option value="">Select Role</option>
                        <option value="1">Admin</option>
                        <option value="2">Marketing</option>
                        <option value="3">Sale</option>
                        <option value="4">Sale leader</option>
                        <option value="6">Inventory</option>
                    </select>
                </div>
                <div class="form-group mr-2">
                    <select class="form-control" name="gender">
                        <option value="">Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
                <div class="form-group mr-2">
                    <select class="form-control" name="status">
                        <option value="">Select Status</option>
                        <option value="false">Active</option>
                        <option value="true">Inactive</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary mt-3">Search</button>
            </form>


            <table id="userTable" class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Role</th>
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
                            <td>${user.roleString}</td>
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
                                    <input type="text" class="form-control" id="fullName" name="fullName" value="${user.fullname}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" value="${user.getEmail()}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="role">Role</label>
                                    <select class="form-control" id="role" name="role">
                                        <option value="1" ${user.roleString eq "Admin" ? "selected" : ""}>Admin</option>
                                        <option value="2" ${user.roleString eq "Marketing" ? "selected" : ""}>Marketing</option>
                                        <option value="3" ${user.roleString eq "Sale" ? "selected" : ""}>Sale</option>
                                        <option value="4" ${user.roleString eq "SaleLeader" ? "selected" : ""}>Sale leader</option>
                                        <option value="6" ${user.roleString eq "Inventory" ? "selected" : ""}>Inventory</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <select class="form-control" id="gender" name="gender" readonly>
                                        <option value="true" ${user.gender eq 'Male' ? "selected" : ""}>Male</option>
                                        <option value="false" ${user.gender eq 'Female' ? "selected" : ""}>Female</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <input type="text" class="form-control" id="address" name="address" value="${user.getAddress()}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="text" class="form-control" id="phone" name="phone" value="${user.getPhone()}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="imageUrl">Image</label>
                                    <img id="image${user.id}" class="w-100" src="${user.avatar}">
                                    <input type="file" class="form-control" id="imageFile${user.id}" accept="image/*" onchange="updateImage(${user.id})">
                                    <input type="hidden" class="form-control" id="imageUrl${user.id}" name="imageUrl" value="${user.avatar}">
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
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="userInfoModalLabel_${user.id}">User Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <img src="${user.avatar}" class="img-thumbnail mb-3" alt="Profile Image" style="width: 150px; height: 150px;">
                            <p><strong>ID:</strong> ${user.id}</p>
                            <p><strong>Full Name:</strong> ${user.fullname}</p>
                            <p><strong>Email:</strong> ${user.getEmail()}</p>
                            <p><strong>Role:</strong> ${user.getRole()}</p>
                            <p><strong>Gender:</strong> ${user.gender}</p>
                            <p><strong>Address:</strong> ${user.getAddress()}</p>
                            <p><strong>Phone:</strong> ${user.getPhone()}</p>
                            <p><strong>Status</strong> ${user.isDeleted ? 'Inactive' : 'Active'}</p>
                        </div>
                    </div>
                </div>
            </div>


        </c:forEach>

        <!-- Add User Modal -->
        <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel" aria-hidden="true">
            <!-- Modal Content -->
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h5 class="modal-title" id="addUserModalLabel">Add User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <!-- Add User Form -->
                        <form action="user" method="post">
                            <!-- Hidden Field -->
                            <input type="hidden" name="action" value="add">
                            <!-- Form Inputs -->
                            <div class="form-group">
                                <label for="fullName">Full Name</label>
                                <input type="text" class="form-control" id="fullName" name="fullName" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="form-group">
                                <label for="role">Role</label>
                                <select class="form-control" id="role" name="role">
                                    <option value="1">Admin</option>
                                    <option value="3">Sale</option>
                                    <option value="2">Marketing</option>
                                    <option value="4">Sale leader</option>
                                    <option value="6">Inventory</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="gender">Gender</label>
                                <select class="form-control" id="gender" name="gender">
                                    <option value="true">Male</option>
                                    <option value="false">Female</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" class="form-control" id="address" name="address">
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input type="text" class="form-control" id="phone" name="phone">
                            </div>
                            <div class="form-group">
                                <label for="imageUrl">Image</label>
                                <img id="image0" class="w-100" src="">
                                <input type="file" class="form-control" id="imageFile0" accept="image/*" onchange="updateImage(0)" required>
                                <input type="hidden" class="form-control" id="imageUrl0" name="imageUrl" value="">
                            </div>
                            <button type="submit" class="btn btn-primary">Add User</button>
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
            function updateImage(sliderId) {
                let fileInput = document.getElementById(`imageFile` + sliderId);
                let image = document.getElementById(`image` + sliderId);
                let hiddenInput = document.getElementById(`imageUrl` + sliderId);
                console.log(fileInput, image, hiddenInput)

                // check file uploaded
                if (fileInput.files && fileInput.files[0]) {
                    const file = fileInput.files[0];
                    const maxSize = 2 * 1024 * 1024; // 2 MB in bytes

                    if (file.size > maxSize) {
                        alert("The selected file is too large. Please select a file smaller than 2 MB.");
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
