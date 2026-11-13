<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard | Student Management System</title>
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
        }

        .navbar {
            background: white;
            padding: 18px 7%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 12px rgba(0,0,0,0.05);
        }

        .brand {
            font-size: 19px;
            font-weight: 700;
            color: #4056d6;
        }

        .navbar span {
            font-size: 13px;
            color: #7a8497;
        }

        .container {
            max-width: 1150px;
            margin: 45px auto;
            padding: 0 20px;
        }

        .welcome {
            background: linear-gradient(135deg, #3448c5, #6578ed);
            color: white;
            padding: 42px;
            border-radius: 15px;
            margin-bottom: 35px;
        }

        .welcome h1 {
            font-size: 30px;
            margin-bottom: 12px;
        }

        .welcome p {
            font-size: 15px;
            line-height: 1.7;
            opacity: 0.92;
            max-width: 650px;
        }

        .section-title {
            font-size: 21px;
            margin-bottom: 8px;
        }

        .section-description {
            color: #7a8497;
            font-size: 14px;
            margin-bottom: 24px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 22px;
        }

        .card {
            background: white;
            padding: 27px;
            border-radius: 12px;
            border: 1px solid #edf0f5;
            box-shadow: 0 5px 18px rgba(0,0,0,0.04);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        .icon {
            width: 48px;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            background: #eaf0ff;
            color: #4056d6;
            font-size: 23px;
            margin-bottom: 20px;
        }

        .card h3 {
            font-size: 17px;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 13px;
            color: #7a8497;
            line-height: 1.7;
            min-height: 45px;
            margin-bottom: 20px;
        }

        .card a {
            display: inline-block;
            text-decoration: none;
            color: #4056d6;
            font-size: 13px;
            font-weight: 700;
        }

        .card a:hover {
            color: #263da9;
        }

        .footer {
            text-align: center;
            color: #8b95a7;
            font-size: 12px;
            padding: 35px 15px;
        }

        @media(max-width: 800px) {
            .cards {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media(max-width: 550px) {
            .navbar {
                padding: 17px 20px;
            }

            .navbar span {
                display: none;
            }

            .container {
                margin-top: 25px;
            }

            .welcome {
                padding: 28px 22px;
            }

            .welcome h1 {
                font-size: 24px;
            }

            .cards {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

<nav class="navbar">
    <div class="brand">Student Management</div>
    <span>Student Administration Portal</span>
</nav>

<div class="container">

    <section class="welcome">
        <h1>Welcome to Student Management System</h1>
        <p>
            Manage student records from one place.
            Add new students, view their information,
            update existing records and manage your student database easily.
        </p>
    </section>

    <h2 class="section-title">Dashboard</h2>

    <p class="section-description">
        Choose an action to get started.
    </p>

    <div class="cards">

        <div class="card">
            <div class="icon">+</div>
            <h3>Add New Student</h3>
            <p>
                Register a new student by entering personal
                and academic information.
            </p>
            <a href="${pageContext.request.contextPath}/student/add">
                Add Student →
            </a>
        </div>

        <div class="card">
            <div class="icon">&#9776;</div>
            <h3>View All Students</h3>
            <p>
                Browse all registered students and access
                their information.
            </p>
            <a href="${pageContext.request.contextPath}/student/list">
                View Students →
            </a>
        </div>

        <div class="card">
            <div class="icon">&#9998;</div>
            <h3>Manage Records</h3>
            <p>
                View, edit or delete existing student records
                from the student list.
            </p>
            <a href="${pageContext.request.contextPath}/student/list">
                Manage Students →
            </a>
        </div>

    </div>

</div>

<footer class="footer">
    Student Management System | Powered by Spring MVC
</footer>

</body>
</html>
