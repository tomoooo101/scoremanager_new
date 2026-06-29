<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>得点管理システム - 成績管理</title></head>
<body>
<%@ include file="header.jsp" %>
<div class="wrapper">
    <%@ include file="sidebar.jsp" %>
    <div class="main-content">
        <div class="title-bar">成績管理</div>

        <c:if test="${not empty errorMsg}">
            <div class="alert-error">${errorMsg}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/TestRegist.action" method="get" class="filter-box">
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
            <div class="filter-group">
                <label>回数</label>
                <select name="f4">
                    <option value="">--------</option>
                    <option value="1" <c:if test="${param.f4 == '1'}">selected</c:if>>1</option>
                    <option value="2" <c:if test="${param.f4 == '2'}">selected</c:if>>2</option>
                    <option value="3" <c:if test="${param.f4 == '3'}">selected</c:if>>3</option>
                </select>
            </div>
            <div class="filter-group" style="margin-top:18px;">
                <button type="submit" class="btn btn-gray">検索</button>
            </div>
        </form>

        <c:if test="${not empty tests}">
            <div style="font-size:14px; margin-bottom:10px;">${subjectName}（${param.f4}回目）</div>
            <form action="${pageContext.request.contextPath}/TestRegist.action" method="post">
                <input type="hidden" name="count" value="${param.f4}">
                <input type="hidden" name="subject" value="${param.f3}">
                <table>
                    <thead>
                        <tr>
                            <th>入学年度</th>
                            <th>クラス</th>
                            <th>学生番号</th>
                            <th>氏名</th>
                            <th>点数</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="test" items="${tests}">
                            <tr>
                                <td>${test.student.entYear}</td>
                                <td>${test.student.classNum}</td>
                                <td>${test.student.no}</td>
                                <td>${test.student.name}</td>
                                <td>
                                    <input type="text" name="point_${test.student.no}" value="${test.point}" style="width:60px; padding:4px; border:1px solid #ccc; border-radius:4px;">
                                    <input type="hidden" name="regist" value="${test.student.no}">
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div style="margin-top:15px;">
                    <input type="submit" value="登録して終了" class="btn btn-gray">
                </div>
            </form>
        </c:if>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
