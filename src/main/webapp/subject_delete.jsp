<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>得点管理システム - 科目削除</title></head>
<body>
<%@ include file="header.jsp" %>
<div class="wrapper">
    <%@ include file="sidebar.jsp" %>
    <div class="main-content">
        <div class="title-bar">科目情報削除</div>

        <p style="font-size:14px; margin-bottom:15px;">「${subject.name}（${subject.cd}）」を削除します。よろしいですか？</p>

        <form action="${pageContext.request.contextPath}/SubjectDelete.action" method="post">
            <input type="hidden" name="subject_cd" value="${subject.cd}">
            <input type="hidden" name="subject_name" value="${subject.name}">
            <input type="submit" value="削除" class="btn btn-danger">
        </form>

        <div class="link-area">
            <a href="${pageContext.request.contextPath}/SubjectList.action">戻る</a>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
