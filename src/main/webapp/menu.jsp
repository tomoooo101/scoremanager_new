<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム - メニュー</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            background-color: #fff;
            color: #333;
        }
        .container {
            display: flex;
            min-height: calc(100vh - 120px);
        }
        .sub-menu {
            padding-left: 15px;
            margin-top: 5px;
        }
        .sub-menu li {
            margin-bottom: 5px;
        }
        .main-content {
            flex-grow: 1;
            padding: 20px;
            background-color: #fff;
        }
        .menu-title-box {
            background-color: #f5f5f5;
            padding: 10px 15px;
            font-size: 16px;
            font-weight: bold;
            border: 1px solid #ddd;
            margin-bottom: 25px;
        }
        .panel-container {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        .menu-panel {
            width: 200px;
            height: 120px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-decoration: none;
            border-radius: 4px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.2s, box-shadow 0.2s;
            text-align: center;
            padding: 10px;
            box-sizing: border-box;
        }
        .menu-panel:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(0,0,0,0.15);
        }
        .panel-student {
            background-color: #f2dede;
            border: 1px solid #ebccd1;
            color: #a94442;
            font-size: 18px;
            font-weight: bold;
        }
        .panel-score {
            background-color: #dff0d8;
            border: 1px solid #d6e9c6;
            color: #3c763d;
        }
        .panel-score .main-label {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .panel-score .sub-label {
            font-size: 14px;
            font-weight: normal;
            line-height: 1.4;
        }
        .panel-subject {
            background-color: #e4e0f0;
            border: 1px solid #d2caec;
            color: #554488;
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <%@ include file="sidebar.jsp" %>

    <main class="main-content">
        <div class="menu-title-box">メニュー</div>

        <div class="panel-container">
            <a href="StudentList.action" class="menu-panel panel-student">
                学生管理
            </a>
            <a href="grade.jsp" class="menu-panel panel-score">
                <span class="main-label">成績管理</span>
                <span class="sub-label">成績登録<br>成績参照</span>
            </a>
            <a href="SubjectList.action" class="menu-panel panel-subject">
                科目管理
            </a>
        </div>
    </main>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
