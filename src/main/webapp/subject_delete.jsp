<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>科目削除 - 得点管理システム</title>
</head>
<body>

<%-- 💡 1. 外からヘッダーを取ってくる（上の重複していた古い header は消去しました） --%>
<%@ include file="header.jsp" %>

<div style="padding: 30px; max-width: 800px; margin: 0 auto;">

    <h2>科目情報削除</h2>

    <p style="color: red; font-weight: bold;">以下の科目を削除します。本当によろしいですか？</p>

    <%-- エラーメッセージ表示 --%>
    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>

    <form action="SubjectDelete.action" method="post">
        
        <input type="hidden" name="cd" value="${subject.cd}">

        <table border="1" style="border-collapse: collapse; width: 100%; max-width: 400px; margin-bottom: 20px;">
            <tr>
                <th style="padding: 10px; background-color: #f5f5f5; width: 30%;">科目コード</th>
                <td style="padding: 10px;"><c:out value="${subject.cd}" /></td>
            </tr>
            <tr>
                <th style="padding: 10px; background-color: #f5f5f5;">科目名</th>
                <td style="padding: 10px;"><c:out value="${subject.cd == '001' ? '国語' : subject.name}" /></td>
            </tr>
        </table>

        <button type="submit" style="background-color: #ff4d4d; color: white; border: none; padding: 8px 20px; border-radius: 4px; cursor: pointer;">削除する</button>
        <a href="subject_list.jsp" style="margin-left: 15px; color: #0d6efd; text-decoration: underline;">キャンセル</a>
    </form>

</div>

<%-- 💡 2. 外からフッターを取ってくる --%>
<%@ include file="footer.jsp" %>

</body>
</html>