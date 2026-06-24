<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム - 学生情報登録</title>
    <style>
        body { font-family: sans-serif; margin: 0; }
        header { background-color: #e6f2ff; padding: 10px 20px; display: flex; justify-content: space-between; align-items: center; }
        .container { display: flex; min-height: 100vh; }
        .side-menu { width: 150px; padding: 20px; border-right: 1px solid #ccc; }
        .side-menu ul { list-style: none; padding: 0; }
        .side-menu li { margin-bottom: 10px; }
        .side-menu a { text-decoration: none; color: #0066cc; }
        .side-menu a:hover { text-decoration: underline; }
        .main-content { flex-grow: 1; padding: 20px; background-color: #fff; }
        .form-area { background-color: #f5f5f5; padding: 20px; border-radius: 5px; max-width: 800px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], select { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .btn { background-color: #666; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
    </style>
</head>
<body>

<%-- 💡 1. 外からヘッダーを取ってくる（上の重複していた古い header は消去しました） --%>
<%@ include file="header.jsp" %>

<div class="container">
    <nav class="side-menu">
        <ul>
            <li><a href="menu.jsp">メニュー</a></li>
            <li><a href="student_list.jsp">学生管理</a></li>
            <li>成績管理
                <ul style="padding-left: 15px;">
                    <li><a href="subject_create.jsp">成績登録</a></li>
                    <li><a href="grade.jsp">成績参照</a></li>
                </ul>
            </li>
            <li><a href="subject_list.jsp">科目管理</a></li>
        </ul>
    </nav>

    <main class="main-content">
        <h2>学生情報登録</h2>
        <div class="form-area">
            <form action="StudentCreate.action" method="post">
                <div class="form-group">
                    <label>入学年度</label>
                    <select name="ent_year">
                        <option value="">--------</option>
                        <option value="2026">2026</option>
                        <option value="2025">2025</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>学生番号</label>
                    <input type="text" name="no" placeholder="学生番号を入力してください">
                </div>
                <div class="form-group">
                    <label>氏名</label>
                    <input type="text" name="name" placeholder="氏名を入力してください">
                </div>
                <div class="form-group">
                    <label>クラス</label>
                    <select name="class_num">
                        <option value="101">101</option>
                        <option value="102">102</option>
                    </select>
                </div>
                <div class="back-link">
                   <a href="student_create_fin.jsp" class="btn-black">登録して終了</a>                
                </div>
            </form>
        </div>
        <br>
        <a href="menu.jsp" style="text-decoration: none; color: #0066cc;">戻る</a>
    </main>
</div>

<%-- 💡 2. 外からフッターを取ってくる --%>
<%@ include file="footer.jsp" %>

</body>
</html>