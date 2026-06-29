<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>得点管理システム - メニュー</title>
<style>
    .menu-panels { display: flex; gap: 20px; flex-wrap: wrap; margin-top: 20px; }
    .menu-panel { width: 180px; height: 110px; display: flex; flex-direction: column; justify-content: center; align-items: center; text-decoration: none; border-radius: 6px; box-shadow: 0 3px 6px rgba(0,0,0,0.1); font-size: 16px; font-weight: bold; transition: transform 0.2s; }
    .menu-panel:hover { transform: translateY(-2px); box-shadow: 0 5px 10px rgba(0,0,0,0.15); }
    .panel-student { background-color: #f2dede; border: 1px solid #ebccd1; color: #a94442; }
    .panel-score { background-color: #dff0d8; border: 1px solid #d6e9c6; color: #3c763d; }
    .panel-score span { font-size: 13px; font-weight: normal; margin-top: 4px; }
    .panel-subject { background-color: #e4e0f0; border: 1px solid #d2caec; color: #554488; }
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="wrapper">
    <%@ include file="sidebar.jsp" %>
    <div class="main-content">
        <div class="title-bar">メニュー</div>
        <div class="menu-panels">
            <a href="${pageContext.request.contextPath}/StudentList.action" class="menu-panel panel-student">学生管理</a>
            <a href="${pageContext.request.contextPath}/TestRegist.action" class="menu-panel panel-score">
                成績管理<span>成績登録 / 成績参照</span>
            </a>
            <a href="${pageContext.request.contextPath}/SubjectList.action" class="menu-panel panel-subject">科目管理</a>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
