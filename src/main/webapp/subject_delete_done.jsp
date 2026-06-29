<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>得点管理システム - 科目削除完了</title></head>
<body>
<%@ include file="header.jsp" %>
<div class="wrapper">
    <%@ include file="sidebar.jsp" %>
    <div class="main-content">
        <div class="title-bar">科目情報削除</div>
        <div class="alert-success">削除が完了しました</div>
        <div class="link-area">
            <a href="${pageContext.request.contextPath}/SubjectList.action">科目一覧</a>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
