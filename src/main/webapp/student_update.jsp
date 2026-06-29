<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>得点管理システム - 学生変更</title></head>
<body>
<%@ include file="header.jsp" %>
<div class="wrapper">
    <%@ include file="sidebar.jsp" %>
    <div class="main-content">
        <div class="title-bar">学生情報変更</div>

        <c:if test="${not empty errors}">
            <div class="alert-error">
                <c:forEach var="e" items="${errors}"><div>${e}</div></c:forEach>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/StudentChange.action" method="post" style="max-width:500px;">
            <div class="form-group">
                <label>入学年度</label>
                <input type="text" name="ent_year" class="form-control" value="${student.entYear}" readonly>
            </div>
            <div class="form-group">
                <label>学生番号</label>
                <input type="text" name="no" class="form-control" value="${student.no}" readonly>
            </div>
            <div class="form-group">
                <label>氏名</label>
                <input type="text" name="name" class="form-control" maxlength="30" value="${student.name}" required>
            </div>
            <div class="form-group">
                <label>クラス</label>
                <select name="class_num" class="form-control">
                    <c:forEach var="cls" items="${classes}">
                        <option value="${cls}" <c:if test="${cls == student.classNum}">selected</c:if>>${cls}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label><input type="checkbox" name="is_attend" value="true" <c:if test="${student.attend}">checked</c:if>> 在学中</label>
            </div>
            <input type="submit" name="login" value="変更" class="btn btn-gray">
        </form>

        <div class="link-area">
            <a href="${pageContext.request.contextPath}/StudentList.action">戻る</a>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
