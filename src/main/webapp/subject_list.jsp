<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>得点管理システム - 科目管理</title></head>
<body>
<%@ include file="header.jsp" %>
<div class="wrapper">
    <%@ include file="sidebar.jsp" %>
    <div class="main-content">
        <div class="title-bar">科目管理</div>

        <div class="top-link">
            <a href="${pageContext.request.contextPath}/SubjectCreate.action">新規登録</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>科目コード</th>
                    <th>科目名</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="subject" items="${subjects}">
                    <tr>
                        <td>${subject.cd}</td>
                        <td>${subject.name}</td>
                        <td><a href="${pageContext.request.contextPath}/SubjectChange.action?cd=${subject.cd}" class="action-link">変更</a></td>
                        <td><a href="${pageContext.request.contextPath}/SubjectDelete.action?cd=${subject.cd}" class="action-link">削除</a></td>
                    </tr>
                </c:forEach>
                <c:if test="${empty subjects}">
                    <tr><td colspan="4" style="text-align:center; padding:20px; color:#666;">科目情報が登録されていません</td></tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
