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
            width: 70%;
            margin: 30px auto 100px auto; /* 下部にフッター分の余白 */
            display: flex;
            gap: 5%;
        }

        /* 右側コンテンツエリア */
        .content {
            width: 75%;
        }

        /* ① 学生情報変更の見出し */
        .title-bar {
            background-color: #f0f0f0;
            padding: 12px 20px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 4px;
            margin-bottom: 25px;
        }

        /* フォームのレイアウト */
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 8px;
            color: #444;
        }
        /* 入力不可のプレーンテキスト（入学年度、学生番号） */
        .form-text {
            font-size: 14px;
            padding-left: 5px;
            color: #333;
        }

        /* テキスト入力欄 */
        .form-control {
            width: 100%;
            padding: 8px 12px;
            font-size: 14px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-control:focus {
            border-color: #86b7fe;
            outline: 0;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }

        /* セレクトボックス */
        .form-select {
            width: 100%;
            padding: 8px 12px;
            font-size: 14px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            background-color: #fff;
            box-sizing: border-box;
        }

        /* チェックボックスの並び */
        .form-check {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .form-check input {
            margin: 0;
            width: 16px;
            height: 16px;
        }

        /* ボタン関係 */
        .btn-submit {
            background-color: #0d6efd;
            color: white;
            border: none;
            padding: 8px 16px;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        .btn-submit:hover {
            background-color: #0b5ed7;
        }

        .back-link {
            margin-top: 15px;
        }
        .back-link a {
            color: #0d6efd;
            text-decoration: underline;
            font-size: 14px;
        }

        /* フッター */
        footer {
            background-color: #e2e2e2;
            text-align: center;
            padding: 15px 0;
            font-size: 12px;
            color: #666666;
            width: 100%;
            margin-top: auto;
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
            <div class="title-bar">学生情報変更</div>

            <form action="StudentUpdateExecute.action" method="post">
                
                <div class="form-group">
                    <label>入学年度</label>
                    <div class="form-text">2023</div>
                    <input type="hidden" name="entYear" value="2023">
                </div>

                <div class="form-group">
                    <label>学生番号</label>
                    <div class="form-text">123456</div>
                    <input type="hidden" name="no" value="123456">
                </div>

                <div class="form-group">
                    <label for="name">氏名</label>
                    <input type="text" id="name" name="name" class="form-control" placeholder="氏名を入力してください" required>
                </div>

                <div class="form-group">
                    <label for="classNum">クラス</label>
                    <select id="classNum" name="classNum" class="form-select">
                        <option value="201" selected>211</option>
                        <option value="202">213</option>
                    </select>
                </div>

                <div class="form-group form-check">
                    <label for="isAttend">在学中</label>
                    <input type="checkbox" id="isAttend" name="isAttend" value="true" checked>
                </div>

                <button type="submit" class="btn-submit">変更</button>
                
                <div class="back-link">
                    <a href="student_list.jsp">戻る</a>
                </div>
            </form>
        </div>
        
    </div>

<%-- 💡 2. 外からフッターを取ってくる --%>
<%@ include file="footer.jsp" %>

</body>
</html>