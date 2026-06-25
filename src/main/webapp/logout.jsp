<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // セッションを破棄してログアウト
    session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム</title>
    <style>
        body {
            font-family: "Helvetica Neue", Arial, "Hiragino Kaku Gothic ProN", "Hiragino Sans", Meiryo, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
            color: #333333;
        }
        .container {
            width: 70%;
            margin: 30px auto;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        .title-bar {
            background-color: #f0f0f0;
            padding: 12px 20px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 4px;
        }
        .alert-success {
            background-color: #a3cfbb;
            color: #145532;
            padding: 10px;
            text-align: center;
            font-size: 14px;
            border-radius: 4px;
        }
        .login-link {
            text-align: left;
            padding-left: 10px;
        }
        .login-link a {
            color: #0d6efd;
            text-decoration: underline;
            font-size: 14px;
        }
        .login-link a:hover {
            color: #0a58ca;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="title-bar">ログアウト</div>
    <div class="alert-success">ログアウトしました</div>
    <div class="login-link">
        <a href="Login.action">ログイン</a>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
