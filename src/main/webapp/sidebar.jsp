<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .sidebar { width: 180px; padding: 20px 15px; border-right: 1px solid #e0e0e0; background-color: #fff; flex-shrink: 0; }
    .sidebar ul { list-style: none; padding: 0; margin: 0; }
    .sidebar > ul > li { margin-bottom: 15px; font-size: 15px; }
    .sidebar a { text-decoration: none; color: #0066cc; }
    .sidebar a:hover { text-decoration: underline; }
    .sub-menu { list-style: none; padding-left: 12px; margin-top: 6px; }
    .sub-menu li { margin-bottom: 8px; font-size: 13px; }
    .menu-category { font-weight: bold; color: #444; display: block; margin-bottom: 4px; }
</style>
<nav class="sidebar">
    <ul>
        <li><a href="${pageContext.request.contextPath}/menu.jsp">メニュー</a></li>
        <li><a href="${pageContext.request.contextPath}/StudentList.action">学生管理</a></li>
        <li>
            <span class="menu-category">成績管理</span>
            <ul class="sub-menu">
                <li><a href="${pageContext.request.contextPath}/TestRegist.action">成績登録</a></li>
                <li><a href="${pageContext.request.contextPath}/TestList.action">成績参照</a></li>
            </ul>
        </li>
        <li><a href="${pageContext.request.contextPath}/SubjectList.action">科目管理</a></li>
    </ul>
</nav>
