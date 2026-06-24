<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム - ログイン</title>
    <style>
        body { font-family: sans-serif; margin: 0; background-color: #fff; }
        header { background-color: #e6f2ff; padding: 10px 20px; display: flex; justify-content: space-between; align-items: center; }
        .container { display: flex; min-height: calc(100vh - 60px); justify-content: center; align-items: center; background-color: #fff; }
        .login-box { background-color: #f5f5f5; padding: 30px; border-radius: 0px; width: 450px; box-sizing: border-box; border: 1px solid #ddd; }
        .login-title { text-align: center; font-size: 18px; font-weight: bold; margin-bottom: 20px; color: #333; }
        .form-group { margin-bottom: 15px; background-color: #e6f2ff; padding: 10px; border-radius: 4px; }
        label { display: block; font-size: 12px; color: #666; margin-bottom: 3px; }
        input[type="text"], input[type="password"] { width: 100%; padding: 5px 0; border: none; background: transparent; font-size: 14px; outline: none; }
        .btn-login { display: block; width: 120px; margin: 20px auto 0 auto; background-color: #0066ff; color: white; padding: 10px 0; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; font-weight: bold; text-align: center; }
        .btn-login:hover { background-color: #0052cc; }
        .error-message { color: #ff0000; font-size: 14px; text-align: center; margin-bottom: 15px; }
        
        /* 💡 パスワード表示ボタン用の簡単なスタイルを追加 */
        .toggle-password { text-align: right; font-size: 12px; margin-top: -5px; margin-bottom: 15px; }
        .toggle-password label { display: inline-flex; align-items: center; cursor: pointer; color: #666; }
        .toggle-password input { margin-right: 5px; cursor: pointer; }
    </style>
</head>
<body>

<%-- 💡 1. 外からヘッダーを取ってくる --%>
<%@ include file="header.jsp" %>

<div class="container">
    <div class="login-box">
        <div class="login-title">ログイン</div>
        
        <%
            List<String> errors = (List<String>) request.getAttribute("errors");
            if (errors != null && !errors.isEmpty()) {
        %>
            <div class="error-message">
                <% for (String error : errors) { %>
                    <%= error %><br>
                <% } %>
            </div>
        <%
            }
            String id = (String) request.getAttribute("id");
            if (id == null) id = "";
        %>
        
        <form action="${pageContext.request.contextPath}/Login.action" method="post">
            <div class="form-group">
                <label>I D</label>
                <input type="text" name="id" value="<%= id %>" required>
            </div>
            
            <div class="form-group">
                <label>パスワード</label>
                <input type="password" name="password" id="password" required>
            </div>
            
            <div class="toggle-password">
                <label>
                    <input type="checkbox" onclick="togglePassword()"> パスワードを表示
                </label>
            </div>

            <button type="submit" class="btn-login">ログイン</button>
        </form>

    </div>
</div>

<%-- 💡 2. 外からフッターを取ってくる --%>
<%@ include file="footer.jsp" %>

<%-- 💡 パスワードの文字を切り替える簡単なスクリプト --%>
<script>
    function togglePassword() {
        var passInput = document.getElementById("password");
        if (passInput.type === "password") {
            passInput.type = "text"; // チェックを入れたらテキスト（丸見え）にする
        } else {
            passInput.type = "password"; // チェックを外したら隠す
        }
    }
</script>

</body>
</html>