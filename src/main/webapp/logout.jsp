<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム</title>
    <style>
        /* 全体のリセットと基本スタイル */
        body {
            font-family: "Helvetica Neue", Arial, "Hiragino Kaku Gothic ProN", "Hiragino Sans", Meiryo, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
            color: #333333;
        }

        /* メインコンテンツの外枠 */
        .container {
            width: 70%;
            margin: 30px auto;
            display: flex;
            flex-direction: column;
            gap: 15px; /* 各要素の隙間 */
        }

        /* ① 「ログアウト」の見出し部分 */
        .title-bar {
            background-color: #f0f0f0; /* 薄いグレー */
            padding: 12px 20px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 4px;
        }

        /* ② 「ログアウトしました」のメッセージ（緑のバー） */
        .alert-success {
            background-color: #a3cfbb; /* 画像に合わせた緑色 */
            color: #145532;            /* 濃い緑の文字 */
            padding: 10px;
            text-align: center;
            font-size: 14px;
            border-radius: 4px;
        }

        /* ③ 「ログイン」リンク */
        .login-link {
            text-align: left;
            padding-left: 10px;
        }
        .login-link a {
            color: #0d6efd; /* 青色のリンク */
            text-decoration: underline;
            font-size: 14px;
        }
        .login-link a:hover {
            color: #0a58ca;
        }
    </style>
</head>
<body>

<%-- 💡 1. 外からヘッダーを取ってくる --%>
<%@ include file="header.jsp" %>

<div class="container">
    <!-- ① 見出し -->
    <div class="title-bar">ログアウト</div>
    
    <!-- ② 緑色のメッセージバー -->
    <div class="alert-success">ログアウトしました</div>

    <!-- ③ ログイン画面へのリンク（タグの乱れを綺麗に整理しました） -->
    <div class="login-link">
        <a href="login.jsp">ログイン</a>
    </div>
</div>

<%-- 💡 2. 外からフッターを取ってくる --%>
<%@ include file="footer.jsp" %>

</body>
</html>