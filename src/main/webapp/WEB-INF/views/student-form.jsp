
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Form | Student Management</title>

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
            max-width: 750px;
            margin: auto;
        }

        .header {
            background: linear-gradient(135deg, #3448c5, #6578ed);
            color: white;
            padding: 28px 35px;
            border-radius: 14px 14px 0 0;
        }

        .header h1 {
            font-size: 25px;
            margin-bottom: 7px;
        }

        .header p {
            font-size: 14px;
            opacity: 0.9;
        }

        .form-card {
            background: white;
            padding: 35px;
            border-radius: 0 0 14px 14px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.06);
        }

        .form-title {
            font-size: 19px;
            margin-bottom: 25px;
            color: #3448c5;
        }

        .form-group {
            margin-bottom: 21px;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .required {
            color: #e05252;
        }

        input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #dce1eb;
            border-radius: 7px;
            font-size: 14px;
            outline: none;
            transition: 0.2s;
        }

        input:focus {
            border-color: #5268df;
            box-shadow: 0 0 0 3px rgba(82,104,223,0.12);
        }

        .error-box {
            background: #fff1f1;
            border: 1px solid #ffcaca;
            color: #bd3030;
            padding: 14px 18px;
            border-radius: 8px;
            margin-bottom: 22px;
            font-size: 14px;
        }

        .error-box ul {
            padding-left: 20px;
        }

        .actions {
            display: flex;
            gap: 12px;
            margin-top: 30px;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 7px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
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

            .header, .form-card {
                padding: 23px 20px;
            }

            .actions {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

<div class="container">

    <div class="header">
        <h1>Student Management System</h1>
        <p>Manage student information efficiently</p>
    </div>

    <div class="form-card">

        <h2 class="form-title">
            <c:choose>
                <c:when test="${empty student.id}">
                    Add New Student
                </c:when>
                <c:otherwise>
                    Edit Student Details
                </c:otherwise>
            </c:choose>
        </h2>

        <c:if test="${not empty requestScope['org.springframework.validation.BindingResult.student']}">
            <div class="error-box">
                <strong>Please correct the following errors:</strong>
                <ul>
                    <c:forEach var="error"
                        items="${requestScope['org.springframework.validation.BindingResult.student'].fieldErrors}">
                        <li>${error.defaultMessage}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/student/${empty student.id ? 'save' : 'update'}"
              method="post">

            <c:if test="${not empty student.id}">
                <input type="hidden" name="id" value="${student.id}">
            </c:if>

            <div class="form-group">
                <label>Full Name <span class="required">*</span></label>
                <input type="text" name="fullName"
                       value="${student.fullName}"
                       placeholder="Enter full name" required>
            </div>

            <div class="form-group">
                <label>Email Address <span class="required">*</span></label>
                <input type="email" name="email"
                       value="${student.email}"
                       placeholder="example@gmail.com" required>
            </div>

            <div class="form-group">
                <label>Mobile Number <span class="required">*</span></label>
                <input type="tel" name="mobile"
                       value="${student.mobile}"
                       placeholder="Enter 10-digit mobile number"
                       pattern="[0-9]{10}" maxlength="10" required>
            </div>

            <div class="form-group">
                <label>Age <span class="required">*</span></label>
                <input type="number" name="age"
                       value="${student.age}"
                       placeholder="Enter age"
                       min="18" max="60" required>
            </div>

            <div class="form-group">
                <label>Course <span class="required">*</span></label>
                <input type="text" name="course"
                       value="${student.course}"
                       placeholder="Enter course name" required>
            </div>

            <div class="actions">
                <button type="submit" class="btn btn-primary">
                    <c:choose>
                        <c:when test="${empty student.id}">
                            Save Student
                        </c:when>
                        <c:otherwise>
                            Update Student
                        </c:otherwise>
                    </c:choose>
                </button>

                <a href="${pageContext.request.contextPath}/student/list"
                   class="btn btn-secondary">
                    Back to Student List
                </a>
            </div>

        </form>

    </div>

</div>

</body>
</html>
