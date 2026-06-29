<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.servlet.jsp.jstl.core" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>得点管理システム - 学生管理</title></head>
<body>
<%@ include file="header.jsp" %>
<div class="wrapper">
    <%@ include file="sidebar.jsp" %>
    <div class="main-content">
        <div class="title-bar">学生管理</div>

        <form action="${pageContext.request.contextPath}/StudentList.action" method="get" class="filter-box">
            <div class="filter-group">
                <label>入学年度</label>
                <select name="f1">
                    <option value="">--------</option>
                    <c:forEach var="year" items="${years}">
                        <option value="${year}" <c:if test="${year == param.f1}">selected</c:if>>${year}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="filter-group">
                <label>クラス</label>
                <select name="f2">
                    <option value="">--------</option>
                    <c:forEach var="cls" items="${classes}">
                        <option value="${cls}" <c:if test="${cls == param.f2}">selected</c:if>>${cls}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="filter-group" style="margin-top:18px;">
                <label><input type="checkbox" name="f3" value="true" <c:if test="${param.f3 == 'true' || empty param.f3}">checked</c:if>> 在学中</label>
            </div>
            <div class="filter-group" style="margin-top:18px;">
                <button type="submit" class="btn btn-gray">絞込み</button>
            </div>
        </form>

        <div class="top-link">
            <a href="${pageContext.request.contextPath}/StudentCreate.action">新規登録</a>
        </div>

        <div class="result-count">検索結果：${students.size()}件</div>

        <table>
            <thead>
                <tr>
                    <th>入学年度</th>
                    <th>学生番号</th>
                    <th>氏名</th>
                    <th>クラス</th>
                    <th>在学中</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.entYear}</td>
                        <td>${student.no}</td>
                        <td>${student.name}</td>
                        <td>${student.classNum}</td>
                        <td><c:choose><c:when test="${student.attend}">○</c:when><c:otherwise>×</c:otherwise></c:choose></td>
                        <td><a href="${pageContext.request.contextPath}/StudentChange.action?no=${student.no}" class="action-link">変更</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <c:if test="${empty students}">
            <div style="margin-top:15px; font-size:14px;">学生情報が存在しませんでした</div>
        </c:if>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
