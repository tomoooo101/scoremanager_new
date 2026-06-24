<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 💡 画面が真っ白になるのを防ぐため、極限まで安全な書き方に変更しました。
    String userName = "ゲスト";
    
    try {
        Object userObj = session.getAttribute("user");
        if (userObj != null) {
            // リフレクションで getName() メソッドを探して名前を取得
            java.lang.reflect.Method method = userObj.getClass().getMethod("getName");
            Object result = method.invoke(userObj);
            if (result != null) {
                userName = result.toString();
            }
        }
    } catch (Exception e) {
        // 万が一裏でエラーが起きても、処理を止めずに「教員」として画面を絶対に表示させる
        userName = "教員";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム - メニュー</title>
    <style>
        /* 全体の初期化 */
        body { 
            font-family: sans-serif; 
            margin: 0; 
            background-color: #fff; 
            color: #333;
        }

        /* メインコンテナ（サイドメニュー + メインコンテンツ） */
        .container { 
            display: flex; 
            min-height: calc(100vh - 120px); /* フッターの分を考慮 */
        }

        }
        .sub-menu {
            padding-left: 15px;
            margin-top: 5px;
        }
        .sub-menu li {
            margin-bottom: 5px;
        }

        /* 中央メインコンテンツエリア */
        .main-content { 
            flex-grow: 1; 
            padding: 20px; 
            background-color: #fff; 
        }
        
        /* 「メニュー」という見出し枠 */
        .menu-title-box {
            background-color: #f5f5f5;
            padding: 10px 15px;
            font-size: 16px;
            font-weight: bold;
            border: 1px solid #ddd;
            margin-bottom: 25px;
        }

        /* パネルを横並びにするエリア */
        .panel-container { 
            display: flex; 
            gap: 20px; 
            flex-wrap: wrap;
        }

        /* 大きなメニューボタン（共通設定） */
        .menu-panel { 
            width: 200px; 
            height: 120px; 
            display: flex; 
            flex-direction: column; 
            justify-content: center; 
            align-items: center; 
            text-decoration: none; 
            border-radius: 4px; 
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.2s, box-shadow 0.2s;
            text-align: center;
            padding: 10px;
            box-sizing: border-box;
        }
        .menu-panel:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(0,0,0,0.15);
        }

        /* ② 学生管理パネル（赤・ピンク系） */
        .panel-student {
            background-color: #f2dede;
            border: 1px solid #ebccd1;
            color: #a94442;
            font-size: 18px;
            font-weight: bold;
        }

        /* ③④⑤ 成績管理パネル（緑系） */
        .panel-score {
            background-color: #dff0d8;
            border: 1px solid #d6e9c6;
            color: #3c763d;
        }
        .panel-score .main-label {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .panel-score .sub-label {
            font-size: 14px;
            font-weight: normal;
            line-height: 1.4;
        }

        /* ⑥ 科目管理パネル（紫系） */
        .panel-subject {
            background-color: #e4e0f0;
            border: 1px solid #d2caec;
            color: #554488;
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<%-- 💡 1. 外からヘッダーを取ってくる --%>
<%@ include file="header.jsp" %>

<div class="container">
    <nav class="sidebar">
        <ul>
            <li><a href="menu.jsp">メニュー</a></li>
            <li><a href="student_list.jsp">学生管理</a></li>
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
        <div class="menu-title-box">メニュー</div>
        
        <div class="panel-container">
            <a href="student_list.jsp" class="menu-panel panel-student">
                学生管理
            </a>

            <a href="grade.jsp" class="menu-panel panel-score">
                <span class="main-label">成績管理</span>
                <span class="sub-label">成績登録<br>成績参照</span>
            </a>

            <a href="subject_list.jsp" class="menu-panel panel-subject">
                科目管理
            </a>
        </div>
    </main>
</div>

<%-- 💡 2. 外からフッターを取ってくる --%>
<%@ include file="footer.jsp" %>

</body>
</html>