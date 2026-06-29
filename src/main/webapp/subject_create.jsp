<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>得点管理システム - 科目登録</title></head>
<body>
<%@ include file="header.jsp" %>
<div class="wrapper">
    <%@ include file="sidebar.jsp" %>
    <div class="main-content">
        <div class="title-bar">科目情報登録</div>

        <c:if test="${not empty errors}">
            <div class="alert-error">
                <c:forEach var="e" items="${errors}"><div>${e}</div></c:forEach>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/SubjectCreate.action" method="post" style="max-width:400px;">
            <div class="form-group">
                <label>科目コード</label>
                <input type="text" name="cd" class="form-control" maxlength="3" value="${cd}" placeholder="科目コードを入力してください" required>
            </div>
            <div class="form-group">
                <label>科目名</label>
                <input type="text" name="name" class="form-control" maxlength="20" value="${name}" placeholder="科目名を入力してください" required>
            </div>
            <button type="submit" class="btn btn-gray">登録</button>
        </form>

        <div class="link-area">
            <a href="${pageContext.request.contextPath}/SubjectList.action">戻る</a>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
