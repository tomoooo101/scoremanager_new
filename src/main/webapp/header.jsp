<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>

    header {
        background-color: #1d1d1f;
        padding: 12px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: #f5f5f7;
    }
    header h1 {
        margin: 0;
        font-size: 18px;
        font-weight: 400;
        color: #f5f5f7;
    }
    header div {
        font-size: 13px;
        color: #86868b;
    }
    header a {
        color: #2997ff;
        text-decoration: none;
        margin-left: 10px;
    }
    header a:hover {
        text-decoration: underline;
    }
</style>

<head>
<header>
    <h1>得点管理システム</h1>
    <div class="user-info">
        ${user.name}様 <a href="logout.jsp" class="logout-link">ログアウト</a>
    </div>
</header>