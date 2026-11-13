<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Details | Student Management</title>
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
            min-height: 100vh;
            padding: 40px 20px;
        }

        .container {
            max-width: 850px;
            margin: auto;
        }

        .header {
            background: linear-gradient(135deg, #3448c5, #6578ed);
            color: white;
            padding: 28px 32px;
            border-radius: 12px 12px 0 0;
        }

        .header h1 {
            font-size: 25px;
            margin-bottom: 7px;
        }

        .header p {
            font-size: 14px;
            opacity: 0.9;
        }

        .details-card {
            background: white;
            padding: 32px;
            border-radius: 0 0 12px 12px;
            box-shadow: 0 7px 25px rgba(0,0,0,0.06);
        }

        .profile {
            display: flex;
            align-items: center;
            gap: 18px;
            padding-bottom: 25px;
            border-bottom: 1px solid #edf0f5;
            margin-bottom: 25px;
        }

        .avatar {
            width: 65px;
            height: 65px;
            border-radius: 50%;
            background: #e8edff;
            color: #4056d6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 25px;
            font-weight: 700;
        }

        .profile h2 {
            font-size: 21px;
            margin-bottom: 5px;
        }

        .profile p {
            color: #7a8497;
            font-size: 13px;
        }

        .section-title {
            font-size: 16px;
            color: #3448c5;
            margin-bottom: 20px;
        }

        .details-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .detail-item {
            background: #f8f9fc;
            border: 1px solid #edf0f5;
            border-radius: 8px;
            padding: 16px;
        }

        .detail-item label {
            display: block;
            font-size: 12px;
            color: #7a8497;
            margin-bottom: 8px;
        }

        .detail-item p {
            font-size: 14px;
            font-weight: 600;
            color: #263248;
            overflow-wrap: anywhere;
        }

        .actions {
            display: flex;
            gap: 12px;
            margin-top: 30px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            padding: 11px 21px;
            border-radius: 7px;
            font-size: 13px;
            font-weight: 600;
        }

        .btn-primary {
            background: #4056d6;
            color: white;
        }

        .btn-primary:hover {
            background: #3045bd;
        }

        .btn-secondary {
            background: #edf0f6;
            color: #39445a;
        }

        .btn-secondary:hover {
            background: #dfe4ed;
        }

        @media(max-width: 600px) {
            body {
                padding: 20px 12px;
            }

            .details-card {
                padding: 22px;
            }

            .details-grid {
                grid-template-columns: 1fr;
            }

            .header {
                padding: 23px;
            }
        }
    </style>
</head>

<body>

<div class="container">

    <div class="header">
        <h1>Student Management System</h1>
        <p>Student profile and academic information</p>
    </div>

    <div class="details-card">

        <div class="profile">
            <div class="avatar">
                <c:out value="${student.fullName.substring(0,1)}"/>
            </div>

            <div>
                <h2>${student.fullName}</h2>
                <p>Student ID: #${student.id}</p>
            </div>
        </div>

        <h3 class="section-title">Personal & Academic Details</h3>

        <div class="details-grid">

            <div class="detail-item">
                <label>Full Name</label>
                <p>${student.fullName}</p>
            </div>

            <div class="detail-item">
                <label>Email Address</label>
                <p>${student.email}</p>
            </div>

            <div class="detail-item">
                <label>Mobile Number</label>
                <p>${student.mobile}</p>
            </div>

            <div class="detail-item">
                <label>Age</label>
                <p>${student.age} years</p>
            </div>

            <div class="detail-item">
                <label>Course</label>
                <p>${student.course}</p>
            </div>

            <div class="detail-item">
                <label>Student ID</label>
                <p>#${student.id}</p>
            </div>

            <div class="detail-item">
                <label>Created At</label>
                <p>${student.createdAt}</p>
            </div>

            <div class="detail-item">
                <label>Last Updated</label>
                <p>${student.updatedAt}</p>
            </div>

        </div>

        <div class="actions">

            <a href="${pageContext.request.contextPath}/student/edit/${student.id}"
               class="btn btn-primary">
                Edit Student
            </a>

            <a href="${pageContext.request.contextPath}/student/list"
               class="btn btn-secondary">
                Back to Student List
            </a>

        </div>

    </div>

</div>

</body>
</html>
