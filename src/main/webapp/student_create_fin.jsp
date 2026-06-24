<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム</title>
    <style>
        /* 全体のスタイル設定 */
        body {
            font-family: "Helvetica Neue", Arial, "Hiragino Kaku Gothic ProN", "Hiragino Sans", Meiryo, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
            color: #333333;
        }

        /* ヘッダー */
        header {
            background-color: #eef4ff;
            padding: 20px 15%;
            border-bottom: 1px solid #d0d7de;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h1 {
            margin: 0;
            font-size: 28px;
            font-weight: bold;
            color: #1a2a3a;
        }
        .user-info {
            font-size: 14px;
        }
        .user-info a {
            color: #0d6efd;
            text-decoration: underline;
            margin-left: 10px;
        }

        /* 左右2カラムのレイアウト */
        .main-wrapper {
            width: 75%;
            margin: 30px auto 100px auto;
            display: flex;
            gap: 4%;
        }


        /* 右側コンテンツエリア */
        .content {
            width: 78%;
            display: flex;
            flex-direction: column;
            gap: 15px; /* 各要素の縦の隙間 */
        }

        /* ① 学生情報登録の見出し */
        .title-bar {
            background-color: #f0f0f0;
            padding: 12px 20px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 4px;
        }

        /* ② 「登録が完了しました」のメッセージ（緑のバー） */
        .alert-success {
            background-color: #a3cfbb; /* 画像と同じ緑色 */
            color: #145532;            /* 濃い緑の文字 */
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 4px;
        }

        /* ③④ 下部のリンクエリア（横並び） */
        .link-group {
            display: flex;
            gap: 40px; /* 「戻る」と「学生一覧」の間の隙間 */
            padding-left: 5px;
            margin-top: 10px;
        }
        .link-group a {
            color: #0d6efd;
            text-decoration: underline;
            font-size: 14px;
        }
        .link-group a:hover {
            color: #0a58ca;
        }

        /* フッター */
        footer {
            background-color: #e2e2e2;
            text-align: center;
            padding: 15px 0;
            font-size: 12px;
            color: #666666;
            width: 100%;
            position: fixed;
            bottom: 0;
            left: 0;
        }
    </style>
</head>
<body>

    <%-- 💡 1. 外からヘッダーを取ってくる（上の重複していた古い header は消去しました） --%>
    <%@ include file="header.jsp" %>

    <div class="main-wrapper">
        
        <nav class="sidebar">
            <ul>
                <li><a href="menu.jsp">メニュー</a></li>
                <li><a href="student_list.jsp">学生管理</a></li>
                <li>成績管理</li>
                <li><a href="subject_create.jsp">成績登録</a></li>
                <li><a href="grade.jsp">成績参照</a></li>
                <li><a href="subject_list.jsp">科目管理</a></li>
            </ul>
        </nav>

        <div class="content">
            
            <div class="title-bar">学生情報登録</div>
            
            <div class="alert-success">登録が完了しました</div>
            
            <div class="link-group">
                <a href="student_create.jsp">戻る</a>
                <a href="student_list.jsp">学生一覧</a>
            </div>
            
        </div>
    </div>

    <%-- 💡 2. 外からフッターを取ってくる --%>
    <%@ include file="footer.jsp" %>

</body>
</html>