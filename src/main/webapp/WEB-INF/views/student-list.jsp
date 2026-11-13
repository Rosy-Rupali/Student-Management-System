<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student List | Student Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f3f5fa;
            color: #263248;
            padding: 35px 20px;
        }

        .container {
            max-width: 1200px;
            margin: auto;
        }

        .header {
            background: linear-gradient(135deg, #3448c5, #6578ed);
            color: white;
            padding: 28px 32px;
            border-radius: 12px;
            margin-bottom: 28px;
        }

        .header h1 {
            font-size: 26px;
            margin-bottom: 7px;
        }

        .header p {
            font-size: 14px;
            opacity: 0.9;
        }

        .content-card {
            background: white;
            padding: 28px;
            border-radius: 12px;
            box-shadow: 0 6px 22px rgba(0,0,0,0.05);
        }

        .toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            margin-bottom: 25px;
        }

        .toolbar h2 {
            font-size: 20px;
        }

        .toolbar-left p {
            color: #7a8497;
            font-size: 13px;
            margin-top: 5px;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            border: none;
            padding: 11px 18px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-add {
            background: #4056d6;
            color: white;
        }

        .btn-add:hover {
            background: #3045bd;
        }

        .search-box {
            width: 100%;
            max-width: 320px;
            padding: 11px 14px;
            border: 1px solid #dce1eb;
            border-radius: 7px;
            font-size: 13px;
            outline: none;
        }

        .search-box:focus {
            border-color: #5268df;
        }

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            white-space: nowrap;
        }

        thead {
            background: #f1f3fa;
        }

        th {
            color: #59647a;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.4px;
            padding: 15px 12px;
            text-align: left;
        }

        td {
            padding: 15px 12px;
            border-bottom: 1px solid #edf0f5;
            font-size: 13px;
        }

        tbody tr:hover {
            background: #f9faff;
        }

        .student-name {
            font-weight: 600;
            color: #263248;
        }

        .actions {
            display: flex;
            align-items: center;
            gap: 7px;
        }

        .action-link {
            text-decoration: none;
            padding: 7px 10px;
            border-radius: 5px;
            font-size: 12px;
            font-weight: 600;
        }

        .view {
            color: #2563c7;
            background: #eaf2ff;
        }

        .edit {
            color: #a36b09;
            background: #fff5df;
        }

        .delete {
            color: #c43d3d;
            background: #fff0f0;
        }

        .delete:hover {
            background: #ffe0e0;
        }

        .empty-state {
            text-align: center;
            padding: 45px 15px;
            color: #7a8497;
        }

        .empty-state h3 {
            color: #344054;
            margin-bottom: 8px;
        }

        .empty-state p {
            font-size: 14px;
            margin-bottom: 18px;
        }

        @media(max-width: 650px) {
            body {
                padding: 20px 12px;
            }

            .content-card {
                padding: 18px;
            }

            .header {
                padding: 23px;
            }

            .toolbar {
                align-items: flex-start;
                flex-direction: column;
            }

            .search-box {
                max-width: 100%;
            }
        }
    </style>
</head>

<body>

<div class="container">

    <div class="header">
        <h1>Student Management System</h1>
        <p>Manage, view, update and organize student records.</p>
    </div>

    <div class="content-card">

        <div class="toolbar">

            <div class="toolbar-left">
                <h2>Student Records</h2>
                <p>Total Students: ${students.size()}</p>
            </div>

            <a href="${pageContext.request.contextPath}/student/add"
               class="btn btn-add">
                + Add New Student
            </a>

        </div>

        <input type="text"
               id="searchInput"
               class="search-box"
               placeholder="Search by name, email or course..."
               onkeyup="searchStudents()">

        <br><br>

        <div class="table-wrapper">

            <table id="studentTable">

                <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Age</th>
                    <th>Course</th>
                    <th>Actions</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>

                        <td class="student-name">
                            ${student.fullName}
                        </td>

                        <td>${student.email}</td>
                        <td>${student.mobile}</td>
                        <td>${student.age}</td>
                        <td>${student.course}</td>

                        <td>
                            <div class="actions">

                                <a class="action-link view"
                                   href="${pageContext.request.contextPath}/student/view/${student.id}">
                                    View
                                </a>

                                <a class="action-link edit"
                                   href="${pageContext.request.contextPath}/student/edit/${student.id}">
                                    Edit
                                </a>

                                <form action="${pageContext.request.contextPath}/student/delete/${student.id}"
                                      method="post"
                                      onsubmit="return confirm('Are you sure you want to delete this student?')">

                                    <button type="submit"
                                            class="action-link delete">
                                        Delete
                                    </button>

                                </form>

                            </div>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>

            </table>

            <c:if test="${empty students}">
                <div class="empty-state">
                    <h3>No Students Found</h3>
                    <p>There are currently no student records available.</p>
                    <a href="${pageContext.request.contextPath}/student/add"
                       class="btn btn-add">
                        Add Your First Student
                    </a>
                </div>
            </c:if>

        </div>

    </div>

</div>

<script>
    function searchStudents() {
        let input = document.getElementById("searchInput")
                           .value.toLowerCase();

        let rows = document.querySelectorAll("#studentTable tbody tr");

        rows.forEach(function(row) {
            let text = row.innerText.toLowerCase();
            row.style.display = text.includes(input) ? "" : "none";
        });
    }
</script>

</body>
</html>
