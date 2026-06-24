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
            /* 💡 フッター最下部固定のための設定 */
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* 左右2カラムのレイアウト */
        .main-wrapper {
            width: 75%;
            margin: 30px auto 0 auto; /* 下の余白をFlexboxに任せるため0にします */
            display: flex;
            gap: 4%;
            /* 💡 中身が少なくても、フッターを一番下まで押し出す設定 */
            flex: 1;
        }

        /* 右側コンテンツエリア */
        .content {
            width: 78%;
        }

        /* 成績一覧の見出し */
        .title-bar {
            background-color: #f0f0f0;
            padding: 12px 20px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        /* 検索フォームエリア全体の囲み */
        .search-box {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 25px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }

        /* 科目情報・学生情報の行 */
        .search-row {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .search-row:last-child {
            margin-bottom: 0;
        }

        /* 左側の「科目情報」「学生情報」のラベル */
        .row-label {
            width: 100px;
            font-size: 14px;
            color: #666;
            font-weight: bold;
        }

        /* フォームの各入力グループ */
        .search-form {
            display: flex;
            align-items: center;
            gap: 20px;
            flex-grow: 1;
        }
        .search-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .search-group label {
            font-size: 13px;
            color: #333;
        }
        .search-select {
            width: 120px;
            padding: 6px 10px;
            font-size: 14px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            background-color: #fff;
        }
        /* 科目選択用（少し広め） */
        .search-select.subject {
            width: 200px;
        }
        /* 学生番号入力用 */
        .search-input {
            width: 200px;
            padding: 6px 10px;
            font-size: 14px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        /* 検索ボタン */
        .btn-search {
            background-color: #555555;
            color: white;
            border: none;
            padding: 6px 18px;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            margin-left: auto; /* 右端に寄せる */
        }
        .btn-search:hover {
            background-color: #444444;
        }

        /* 現在選択されている科目名の表示 */
        .current-subject {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        /* 成績テーブルスタイル */
        .result-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            border: 1px solid #e0e0e0;
        }
        .result-table th {
            border-bottom: 2px solid #333;
            background-color: #ffffff;
            padding: 10px 8px;
            text-align: left;
            font-weight: bold;
        }
        .result-table td {
            border-bottom: 1px solid #e0e0e0;
            padding: 12px 8px;
            color: #333;
        }
    </style>
</head>
<body>

<%-- 💡 1. 外からヘッダーを取ってくる（重複していた古いヘッダーは消去しました） --%>
<%@ include file="header.jsp" %>

    <div class="main-wrapper">
        
        <%-- 💡 2. 外からサイドバーを取ってくる（ここに共通ファイルをハメ込みました） --%>
        <%@ include file="sidebar.jsp" %>

        <div class="content">
            <div class="title-bar">成績参照</div>

            <%-- 検索ボックスエリア --%>
            <div class="search-box">
                <form action="TestList.action" method="get" class="search-row">
                    <div class="row-label">科目情報</div>
                    <div class="search-form">
                        <div class="search-group">
                            <label>入学年度</label>
                            <select name="f1" class="search-select">
                                <option value="2021" selected>2021</option>
                                <option value="2022">2022</option>
                                <option value="2023">2023</option>
                            </select>
                        </div>
                        <div class="search-group">
                            <label>クラス</label>
                            <select name="f2" class="search-select">
                                <option value="201" selected>201</option>
                                <option value="202">202</option>
                            </select>
                        </div>
                        <div class="search-group">
                            <label>科目</label>
                            <select name="f3" class="search-select subject">
                                <option value="E02" selected>情報処理基礎知識Ⅰ</option>
                                <option value="E03">アルゴリズム基礎</option>
                            </select>
                        </div>
                        <button type="submit" class="btn-search">検索</button>
                    </div>
                </form>

                <hr style="border: 0; border-top: 1px dashed #e0e0e0; margin: 15px 0;">

                <form action="TestList.action" method="get" class="search-row">
                    <div class="row-label">学生情報</div>
                    <div class="search-form">
                        <div class="search-group">
                            <label>学生番号</label>
                            <input type="text" name="student_no" class="search-input" placeholder="学生番号を入力してください">
                        </div>
                        <button type="submit" class="btn-search">検索</button>
                    </div>
                </form>
            </div>
            
<<<<<<< HEAD
        </div> <%-- 💡 追加：contentの枠を閉じる --%>
        
        <%@ taglib prefix="c"
uri="jakarta.tags.core" %>
    </div> <%-- 💡 追加：main-wrapperの枠を閉じる --%>
=======
        </div>
    </div>
>>>>>>> branch 'master' of https://github.com/tomoooo101/scoremanager.git

<%-- 💡 3. 外からフッターを取ってくる --%>
<%@ include file="footer.jsp" %>

</body>
</html>