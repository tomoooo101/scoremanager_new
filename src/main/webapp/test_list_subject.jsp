<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>得点管理システム - 科目別成績一覧</title></head>
<body>
<%@ include file="header.jsp" %>
<div class="wrapper">
    <%@ include file="sidebar.jsp" %>
    <div class="main-content">
        <div class="title-bar">科目別成績一覧</div>

        <c:if test="${not empty errorMsg}">
            <div class="alert-error">${errorMsg}</div>
        </c:if>

        <c:if test="${empty errorMsg}">
            <div style="font-size:14px; margin-bottom:15px;">${subjectName}（${count}回目）</div>

            <table>
                <thead>
                    <tr>
                        <th>入学年度</th>
                        <th>クラス</th>
                        <th>学生番号</th>
                        <th>氏名</th>
                        <th>1回の点数</th>
                        <th>2回の点数</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="score" items="${scores}">
                        <tr>
                            <td>${score.entYear}</td>
                            <td>${score.classNum}</td>
                            <td>${score.studentNo}</td>
                            <td>${score.studentName}</td>
                            <td><c:choose><c:when test="${score.point1 != null}">${score.point1}</c:when><c:otherwise>-</c:otherwise></c:choose></td>
                            <td><c:choose><c:when test="${score.point2 != null}">${score.point2}</c:when><c:otherwise>-</c:otherwise></c:choose></td>
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
