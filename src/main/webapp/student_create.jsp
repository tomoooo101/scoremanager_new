<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>得点管理システム - 学生登録</title></head>
<body>
<%@ include file="header.jsp" %>
<div class="wrapper">
    <%@ include file="sidebar.jsp" %>
    <div class="main-content">
        <div class="title-bar">学生情報登録</div>

        <c:if test="${not empty errors}">
            <div class="alert-error">
                <c:forEach var="e" items="${errors}"><div>${e}</div></c:forEach>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/StudentCreate.action" method="post" style="max-width:500px;">
            <div class="form-group">
                <label>入学年度</label>
                <select name="ent_year" class="form-control">
                    <option value="">--------</option>
                    <c:forEach var="year" items="${years}">
                        <option value="${year}" <c:if test="${year == param.ent_year}">selected</c:if>>${year}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>学生番号</label>
                <input type="text" name="no" class="form-control" maxlength="10" value="${no}" placeholder="学生番号を入力してください" required>
            </div>
            <div class="form-group">
                <label>氏名</label>
                <input type="text" name="name" class="form-control" maxlength="30" value="${name}" placeholder="氏名を入力してください" required>
            </div>
            <div class="form-group">
                <label>クラス</label>
                <select name="class_num" class="form-control">
                    <c:forEach var="cls" items="${classes}">
                        <option value="${cls}">${cls}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" name="end" class="btn btn-gray">登録して終了</button>
        </form>

        <div class="link-area">
            <a href="${pageContext.request.contextPath}/StudentList.action">戻る</a>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
