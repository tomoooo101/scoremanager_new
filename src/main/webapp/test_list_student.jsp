<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>得点管理システム - 学生別成績一覧</title></head>
<body>
<%@ include file="header.jsp" %>
<div class="wrapper">
    <%@ include file="sidebar.jsp" %>
    <div class="main-content">
        <div class="title-bar">学生別成績一覧</div>

        <div style="font-size:14px; margin-bottom:15px;">氏名：${studentName}（${studentNo}）</div>

        <c:if test="${not empty errorMsg}">
            <div class="alert-error">${errorMsg}</div>
        </c:if>

        <c:if test="${empty errorMsg}">
            <table>
                <thead>
                    <tr>
                        <th>科目名</th>
                        <th>科目コード</th>
                        <th>回数</th>
                        <th>点数</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="score" items="${scores}">
                        <tr>
                            <td>${score.subjectName}</td>
                            <td>${score.subjectCd}</td>
                            <td>${score.count}</td>
                            <td>${score.point}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <div class="link-area">
            <a href="${pageContext.request.contextPath}/TestList.action">戻る</a>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
