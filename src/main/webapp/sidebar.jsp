<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .sidebar { 
        width: 200px; 
        padding: 30px 20px; 
        border-right: 1px solid #e0e0e0; 
        background-color: #fff;
    }
    .sidebar ul { 
        list-style: none; 
        padding: 0; 
        margin: 0;
    }
    .sidebar li { 
        margin-bottom: 20px; 
        font-size: 16px;
        color: #333;
    }
    .sidebar .menu-category {
        font-weight: bold;
        color: #555;
        display: block;
        margin-bottom: 5px;
    }
    .sidebar a { 
        text-decoration: none; 
        color: #0066cc; 
    }
    .sidebar a:hover { 
        text-decoration: underline; 
    }
    .sub-menu {
        padding-left: 0;
        margin-top: 10px;
    }
    .sub-menu li {
        margin-bottom: 10px;
        padding-left: 15px;
        font-size: 14px;
    }
</style>

<nav class="sidebar">
    <ul>
        <li><a href="menu.jsp">メニュー</a></li>
        <li><a href="student_list.jsp">学生管理</a></li>
        <li>
            <span class="menu-category">成績管理</span>
            <ul class="sub-menu">
                <li><a href="subject_create.jsp">成績登録</a></li>
                <li><a href="grade.jsp">成績参照</a></li>
            </ul>
        </li>
        <li><a href="subject_list.jsp">科目管理</a></li>
    </ul>
</nav>