<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: sans-serif; background-color: #fff; color: #333; }
    header {
        background-color: #1d1d1f;
        padding: 12px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    header h1 { margin: 0; font-size: 18px; font-weight: 400; color: #f5f5f7; }
    .user-info { font-size: 13px; color: #86868b; }
    header a { color: #2997ff; text-decoration: none; margin-left: 10px; }
    header a:hover { text-decoration: underline; }
    .wrapper { display: flex; min-height: calc(100vh - 100px); }
    .main-content { flex: 1; padding: 25px 30px; }
    .title-bar {
        background-color: #f0f0f0;
        padding: 10px 15px;
        font-size: 16px;
        font-weight: bold;
        border-radius: 4px;
        margin-bottom: 20px;
    }
    .alert-success {
        background-color: #a3cfbb;
        color: #145532;
        padding: 10px 15px;
        border-radius: 4px;
        margin-bottom: 15px;
    }
    .alert-error {
        background-color: #f8d7da;
        color: #842029;
        padding: 10px 15px;
        border-radius: 4px;
        margin-bottom: 15px;
    }
    .link-area { margin-top: 15px; }
    .link-area a { color: #0066cc; text-decoration: underline; font-size: 14px; margin-right: 20px; }
    table { width: 100%; border-collapse: collapse; font-size: 14px; }
    th { border-bottom: 2px solid #333; padding: 10px 8px; text-align: left; font-weight: bold; }
    td { border-bottom: 1px solid #e0e0e0; padding: 10px 8px; }
    .action-link { color: #0066cc; text-decoration: none; }
    .action-link:hover { text-decoration: underline; }
    .form-group { margin-bottom: 15px; }
    .form-group label { display: block; font-weight: bold; margin-bottom: 5px; font-size: 14px; }
    .form-control { width: 100%; padding: 7px 10px; font-size: 14px; border: 1px solid #ccc; border-radius: 4px; }
    .form-control[readonly] { background-color: #f5f5f5; }
    select.form-control { background-color: #fff; }
    .btn { padding: 8px 20px; font-size: 14px; border: none; border-radius: 4px; cursor: pointer; }
    .btn-primary { background-color: #0066ff; color: white; }
    .btn-primary:hover { background-color: #0052cc; }
    .btn-gray { background-color: #666; color: white; }
    .btn-gray:hover { background-color: #444; }
    .btn-danger { background-color: #dc3545; color: white; }
    .top-link { text-align: right; margin-bottom: 15px; }
    .top-link a { color: #0066cc; font-size: 14px; }
    .filter-box { display: flex; align-items: flex-end; gap: 20px; margin-bottom: 20px; padding: 15px; border: 1px solid #e0e0e0; border-radius: 8px; flex-wrap: wrap; }
    .filter-group label { display: block; font-size: 13px; margin-bottom: 4px; }
    .filter-group select, .filter-group input[type="text"] { padding: 6px 8px; font-size: 14px; border: 1px solid #ccc; border-radius: 4px; }
    .result-count { font-size: 14px; margin-bottom: 10px; }
</style>
<header>
    <h1>得点管理システム</h1>
    <div class="user-info">
        ${sessionScope.loginUser.name}様
        <a href="${pageContext.request.contextPath}/logout.jsp">ログアウト</a>
    </div>
</header>
