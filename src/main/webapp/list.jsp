<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム - 成績管理</title>

    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            background-color: #fff;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        .main-content {
            flex-grow: 1;
            padding: 20px;
        }

        .search-area {
            border: 1px solid #ccc;
            padding: 15px;
        }

        .search-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .form-row {
            display: flex;
            align-items: end;
            gap: 15px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            margin-bottom: 5px;
            font-size: 13px;
        }

        input[type="text"],
        select {
            width: 140px;
            height: 30px;
        }

        .subject-select {
            width: 180px;
        }

        .btn {
            background-color: #666;
            color: white;
            border: none;
            border-radius: 4px;
            height: 32px;
            padding: 0 15px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<%-- 💡 1. 外からヘッダーを取ってくる --%>
<%@ include file="header.jsp" %>

<div class="container">

    <nav class="sidebar">
        <a href="menu.jsp">メニュー</a>
        <a href="student_list.jsp">学生管理</a>
        <a href="subject_list.jsp">成績管理</a>
        <a href="grade.jsp">成績参照</a>
        <a href="s_list.jsp">科目管理</a>
    </nav>

    <main class="main-content">

        <div class="search-area">

            <div class="search-title">
                成績管理
            </div>

            <form action="ScoreSearch.action" method="get">

                <div class="form-row">

                    <div class="form-group">
                        <label>入学年度</label>
                        <input type="text" name="entYear">
                    </div>

                    <div class="form-group">
                        <label>クラス</label>
                        <select name="classNum">
                            <option value="">--------</option>

                            <c:forEach var="c" items="${classList}">
                                <option value="${c.classNum}">
                                    ${c.classNum}
                                </option>
                            </c:forEach>

                        </select>
                    </div>

                    <div class="form-group">
                        <label>科目</label>
                        <select name="subjectCd" class="subject-select">

                            <option value="">--------</option>

                            <c:forEach var="s" items="${subjectList}">
                                <option value="${s.cd}">
                                    ${s.name}
                                </option>
                            </c:forEach>

                        </select>
                    </div>

                    <div class="form-group">
                        <label>回数</label>
                        <select name="count">
                            <option value="">----</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>

                    <button type="submit" class="btn">
                        検索
                    </button>

                </div>

            </form>

        </div>

    </main>

</div>

<%-- 💡 2. 外からフッターを取ってくる --%>
<%@ include file="footer.jsp" %>

</body>
</html>