<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>得点管理システム - 成績参照</title></head>
<body>
<%@ include file="header.jsp" %>
<div class="wrapper">
    <%@ include file="sidebar.jsp" %>
    <div class="main-content">
        <div class="title-bar">成績参照</div>

        <p style="font-weight:bold; font-size:14px; margin-bottom:10px;">科目情報</p>
        <form action="${pageContext.request.contextPath}/TestList.action" method="get" class="filter-box">
            <input type="hidden" name="f" value="sj">
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
            <div class="filter-group">
                <label>科目</label>
                <select name="f3">
                    <option value="">--------</option>
                    <c:forEach var="subject" items="${subjects}">
                        <option value="${subject.cd}" <c:if test="${subject.cd == param.f3}">selected</c:if>>${subject.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="filter-group" style="margin-top:18px;">
                <button type="submit" class="btn btn-gray">検索</button>
            </div>
        </form>

        <p style="font-weight:bold; font-size:14px; margin-bottom:10px; margin-top:20px;">学生情報</p>
        <form action="${pageContext.request.contextPath}/TestList.action" method="get" class="filter-box">
            <input type="hidden" name="f" value="st">
            <div class="filter-group">
                <label>学生番号</label>
                <input type="text" name="f4" value="${param.f4}" maxlength="10" placeholder="学生番号を入力してください">
            </div>
            <div class="filter-group" style="margin-top:18px;">
                <button type="submit" class="btn btn-gray">検索</button>
            </div>
        </form>

        <c:if test="${not empty message}">
            <div class="alert-error">${message}</div>
        </c:if>

        <p style="font-size:13px; color:#666; margin-top:10px;">※検索方法を選んで条件を入力し、検索ボタンを押してください。</p>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
