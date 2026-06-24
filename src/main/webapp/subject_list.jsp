<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム</title>
    <style>
        /* 全体のリセットと大原仕様の基本フォント設定 */
        body { 
            font-family: sans-serif; 
            margin: 0; 
            background-color: #fff; 
            color: #333;
        }
..   .
        /* 💻 ヘッダーエリア（大原仕様の淡いブルーとフォントサイズ） */
        header { 
            background-color: #e6f2ff; 
            padding: 25px 30px; 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
        }
        header h1 { 
            margin: 0; 
            font-size: 28px; 
            font-weight: normal;
            color: #333;
        }
        .user-info {
            font-size: 16px;
            color: #333;
        }
        .logout-link {
            margin-left: 15px;
            text-decoration: none;
            color: #0066cc;
        }
        .logout-link:hover {
            text-decoration: underline;
        }

        /* メインコンテナ（レイアウト用） */
        .container { 
            display: flex; 
            min-height: calc(100vh - 90px); 
        }

        /* 📂 左側サイドメニュー（境界線とすっきりした文字リンク） */
        .side-menu { 
            width: 200px; 
            padding: 30px 20px; 
            border-right: 1px solid #e0e0e0; 
            background-color: #fff;
        }
        .side-menu ul { 
            list-style: none; 
            padding: 0; 
            margin: 0;
        }
        .side-menu li { 
            margin-bottom: 20px; 
            font-size: 16px;
            color: #333;
        }
        .side-menu a { 
            text-decoration: none; 
            color: #0066cc; 
        }
        .side-menu a:hover { 
            text-decoration: underline; 
        }
        .sub-menu {
            padding-left: 0;
            margin-top: 10px;
        }
        .sub-menu li {
            margin-bottom: 10px;
            padding-left: 15px;
        }

        /* 📝 中央メインコンテンツエリア */
        .main-content { 
            flex-grow: 1; 
            padding: 30px; 
            background-color: #fff; 
        }
        
        /* 「科目管理」のライトグレーの背景見出し枠 */
        .menu-title-box {
            background-color: #f5f5f5;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            border: 1px solid #e0e0e0;
            margin-bottom: 30px;
            color: #333;
        }

        /* 右上の「新規登録」リンクの位置 */
        .top-links {
            text-align: right;
            margin-bottom: 20px;
        }
        .top-links a {
            font-size: 16px;
            color: #0066cc;
            text-decoration: none;
        }
        .top-links a:hover {
            text-decoration: underline;
        }

        /* 📊 科目一覧テーブル（実際の画面と同じシンプルな細線と余白） */
        .subject-table {
            width: 100%;
            border-collapse: collapse;
        }
        .subject-table th, .subject-table td {
            padding: 15px 10px;
            text-align: left;
            font-size: 16px;
            border-bottom: 1px solid #e0e0e0;
        }
        .subject-table th {
            font-weight: bold;
            color: #333;
            border-bottom: 1px solid #ccc;
        }
        
        /* テーブル内の「変更」「削除」リンクの幅と位置 */
        .action-cell {
            text-align: center;
            width: 120px;
        }
        .action-link {
            color: #0066cc;
            text-decoration: none;
        }
        .action-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<%-- 💡 1. 外からヘッダーを取ってくる（上の重複していた古い header と Java コードは消去しました） --%>
<%@ include file="header.jsp" %>

<div class="container">
    <nav class="side-menu">
        <ul>
            <li><a href="menu.jsp">メニュー</a></li>
            <li><a href="student_create.jsp">学生管理</a></li>
            <li>成績管理
                <ul class="sub-menu">
                    <li><a href="subject_create.jsp">成績登録</a></li>
                    <li><a href="grade.jsp">成績参照</a></li>
                </ul>
            </li>
            <li><a href="subject_list.jsp">科目管理</a></li>
        </ul>
    </nav>

    <main class="main-content">
        <div class="menu-title-box">科目
        管理</div>
        
        <div class="top-links">
            <a href="student_create.jsp">新規登録</a>
        </div>
        
        <table class="subject-table">
            <thead>
                <tr>
                    <th style="width: 25%;">科目コード</th>
                    <th style="width: 45%;">科目名</th>
                    <th class="action-cell"></th>
                    <th class="action-cell"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="subject" items="${subjects}">
                    <tr>
                        <td>${subject.cd}</td>
                        <td>${subject.name}</td>
                        <td class="action-cell"><a href="subject_change.jsp" class="action-link">変更</a></td>
                        <td class="action-cell"><a href="subject_delete.jsp" class="action-link">削除</a></td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty subjects}">
                    <tr>
                        <td>1</td>
                        <td>python</td>
                        <td class="action-cell"><a href="subject_change.jsp" class="action-link">変更</a></td>
                        <td class="action-cell"><a href="subject_delete.jsp" class="action-link">削除</a></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>java</td>
                        <td class="action-cell"><a href="subject_change.jsp" class="action-link">変更</a></td>
                        <td class="action-cell"><a href="subject_delete.jsp" class="action-link">削除</a></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>基本情報</td>
                        <td class="action-cell"><a href="subject_change.jsp" class="action-link">変更</a></td>
                        <td class="action-cell"><a href="subject_delete.jsp" class="action-link">削除</a></td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </main>
</div>

<%-- 💡 2. 外からフッターを取ってくる --%>
<%@ include file="footer.jsp" %>

</body>
</html>