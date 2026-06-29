<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム - ログイン</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: sans-serif; background-color: #fff; }
        header { background-color: #1d1d1f; padding: 12px 20px; }
        header h1 { font-size: 18px; font-weight: 400; color: #f5f5f7; }
        .container { display: flex; justify-content: center; align-items: center; min-height: calc(100vh - 100px); }
        .login-box { background-color: #f5f5f5; padding: 30px; width: 450px; border: 1px solid #ddd; }
        .login-title { text-align: center; font-size: 18px; font-weight: bold; margin-bottom: 20px; color: #333; }
        .error-message { color: #ff0000; font-size: 14px; margin-bottom: 15px; }
        .error-message ul { padding-left: 0; list-style: none; }
        .form-group { margin-bottom: 15px; background-color: #e6f2ff; padding: 10px; border-radius: 4px; }
        .form-group label { display: block; font-size: 12px; color: #666; margin-bottom: 3px; }
        input[type="text"], input[type="password"] { width: 100%; padding: 5px 0; border: none; background: transparent; font-size: 14px; outline: none; }
        .toggle-password { text-align: right; font-size: 12px; margin-top: -5px; margin-bottom: 15px; }
        .toggle-password label { display: inline-flex; align-items: center; cursor: pointer; color: #666; }
        .toggle-password input { margin-right: 5px; cursor: pointer; }
        .btn-login { display: block; width: 120px; margin: 20px auto 0; background-color: #0066ff; color: white; padding: 10px 0; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; font-weight: bold; }
        .btn-login:hover { background-color: #0052cc; }
        footer { background-color: #f5f5f7; border-top: 1px solid #d2d2d7; text-align: center; padding: 15px 0; font-size: 11px; color: #86868b; line-height: 1.5; }
    </style>
</head>
<body>
<header><h1>得点管理システム</h1></header>

<div class="container">
    <div class="login-box">
        <div class="login-title">ログイン</div>

        <%
            List<String> errors = (List<String>) request.getAttribute("errors");
            if (errors != null && !errors.isEmpty()) {
        %>
            <div class="error-message">
                <ul>
                <% for (String error : errors) { %>
                    <li><%= error %></li>
                <% } %>
                </ul>
            </div>
        <%
            }
            String loginId = (String) request.getAttribute("id");
            if (loginId == null) loginId = "";
        %>

        <form action="${pageContext.request.contextPath}/Login.action" method="post">
            <div class="form-group">
                <label>I D</label>
                <input type="text" name="id" value="<%= loginId %>" maxlength="10" required placeholder="半角でご入力ください">
            </div>
            <div class="form-group">
                <label>パスワード</label>
                <input type="password" name="password" id="password" maxlength="30" required placeholder="30文字以内の半角英数字でご入力ください">
            </div>
            <div class="toggle-password">
                <label>
                    <input type="checkbox" name="chk_d_ps" id="chk_d_ps" onclick="togglePassword()"> パスワードを表示
                </label>
            </div>
            <input type="submit" name="login" value="ログイン" class="btn-login">
        </form>
    </div>
</div>

<footer>&copy; 2023 TIC<br>大原学園</footer>

<script>
    function togglePassword() {
        var p = document.getElementById("password");
        p.type = (p.type === "password") ? "text" : "password";
    }
</script>
</body>
</html>
