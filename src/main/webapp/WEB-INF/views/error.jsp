
<!DOCTYPE html>
<html>
<head>
    <title>Error | Student Management System</title>
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
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            color: #263248;
        }

        .error-card {
            background: white;
            width: 100%;
            max-width: 520px;
            padding: 45px 35px;
            border-radius: 14px;
            box-shadow: 0 8px 28px rgba(0,0,0,0.07);
            text-align: center;
        }

        .error-icon {
            width: 75px;
            height: 75px;
            margin: 0 auto 22px;
            border-radius: 50%;
            background: #fff0f0;
            color: #d94b4b;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 38px;
            font-weight: 600;
        }

        h1 {
            font-size: 25px;
            margin-bottom: 12px;
        }

        .description {
            color: #7a8497;
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 22px;
        }

        .error-message {
            background: #fff5f5;
            border: 1px solid #ffdddd;
            color: #bd3939;
            padding: 14px;
            border-radius: 8px;
            font-size: 13px;
            margin-bottom: 25px;
            overflow-wrap: anywhere;
        }

        .actions {
            display: flex;
            justify-content: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            border-radius: 7px;
            text-decoration: none;
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

        @media(max-width: 480px) {
            .error-card {
                padding: 35px 22px;
            }

            .actions {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

<div class="error-card">

    <div class="error-icon">!</div>

    <h1>Oops! Something Went Wrong</h1>

    <p class="description">
        We couldn't complete your request.
        Please try again or return to the application.
    </p>

    <div class="error-message">
        ${errorMessage}
    </div>

    <div class="actions">

        <a href="${pageContext.request.contextPath}/"
           class="btn btn-primary">
            Go to Home
        </a>

        <a href="${pageContext.request.contextPath}/student/list"
           class="btn btn-secondary">
            Student List
        </a>

    </div>

</div>

</body>
</html>
