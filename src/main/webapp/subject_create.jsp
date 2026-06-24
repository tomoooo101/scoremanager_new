<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>科目登録 - 得点管理システム</title>
    <style>
        /* 全体のスタイル設定 */
        body {
            font-family: "Helvetica Neue", Arial, "Hiragino Kaku Gothic ProN", "Hiragino Sans", Meiryo, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
            color: #333333;
        }
        header {
            background-color: #eef4ff;
            padding: 20px 15%;
            border-bottom: 1px solid #d0d7de;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h1 {
            margin: 0;
            font-size: 28px;
            font-weight: bold;
            color: #1a2a3a;
        }
        .user-info {
            font-size: 14px;
        }
        .user-info a {
            color: #0d6efd;
            text-decoration: underline;
            margin-left: 10px;
        }
        .main-wrapper {
            width: 75%;
            margin: 30px auto 100px auto;
            display: flex;
            gap: 4%;
        }
        .content {
            width: 78%;
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
        .alert-error {
            background-color: #f8d7da;
            color: #842029;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 4px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 14px;
        }
        .form-control {
            width: 50%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-text {
            font-size: 12px;
            color: #666;
            margin-top: 3px;
        }
        .btn-submit {
            background-color: #6c757d;
            color: white;
            border: none;
            padding: 8px 20px;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #5c636a;
        }
        .link-group {
            display: flex;
            gap: 40px;
            padding-left: 5px;
            margin-top: 10px;
        }
        .link-group a {
            color: #0d6efd;
            text-decoration: underline;
            font-size: 14px;
        }
        footer {
            background-color: #e2e2e2;
            text-align: center;
            padding: 15px 0;
            font-size: 12px;
            color: #666666;
            width: 100%;
            position: fixed;
            bottom: 0;
            left: 0;
        }
    </style>
</head>
<body>

 <%-- 💡 1. 外からヘッダーを取ってくる（上の重複していた古い header は消去しました） --%>
<%@ include file="header.jsp" %>

    <div class="main-wrapper">
        
        <nav class="sidebar">
            <ul>
                <li><a href="menu.jsp">メニュー</a></li>
                <li><a href="student_list.jsp">学生管理</a></li>
                <li>成績管理</li>
                <li><a href="subject_create.jsp">成績登録</a></li>
                <li><a href="grade.jsp">成績参照</a></li>
                <li><a href="subject_list.jsp">科目管理</a></li>
            </ul>
        </nav>

        <div class="content">
            
            <div class="title-bar">科目情報登録</div>
            
            <%-- エラーメッセージ表示 --%>
            <c:if test="${not empty error}">
                <div class="alert-error">${error}</div>
            </c:if>
            
            <%-- 送信先は Action クラスに合わせて「SubjectCreate.action」 --%>
            <form action="SubjectCreate.action" method="post">
                <div class="form-group">
                    <label for="cd">科目コード</label>
                    <input type="text" id="cd" name="cd" class="form-control" placeholder="科目コードを入力してください" maxlength="3" required>
                    <div class="form-text">※3文字の英数字</div>
                </div>
                
                <div class="form-group">
                    <label for="name">科目名</label>
                    <input type="text" id="name" name="name" class="form-control" placeholder="科目名を入力してください" required>
                </div>
                
                <button type="submit" class="btn-submit">登録</button>
            </form>
            
            <div class="link-group">
                <a href="subject_list.jsp">戻る</a>
            </div>
            
        </div>
    </div>

<%-- 💡 2. 外からフッターを取ってくる --%>
<%@ include file="footer.jsp" %>

</body>
</html>