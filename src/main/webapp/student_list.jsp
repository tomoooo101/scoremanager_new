<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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

        /* 💻 ヘッダーエリア（image_589537.png に合わせた黒・ダークグレーの帯） */
        header { 
            background-color: #222; 
            padding: 15px 30px; 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
        }
        header h1 { 
            margin: 0; 
            font-size: 24px; 
            font-weight: normal;
            color: #fff; /* 文字を白に */
        }
        .user-info {
            font-size: 14px;
            color: #fff; /* ユーザー名と「様」も白文字に */
        }
        .logout-link {
            margin-left: 15px;
            text-decoration: none;
            color: #4da6ff; /* 黒背景で見えやすい爽やかな青 */
        }
        .logout-link:hover {
            text-decoration: underline;
        }

        /* メインコンテナ（レイアウト用） */
        .container { 
            display: flex; 
            min-height: calc(100vh - 70px); 
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
        
        /* 「学生管理」のライトグレーの背景見出し枠 */
        .menu-title-box {
            background-color: #f5f5f5;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            border: 1px solid #e0e0e0;
            margin-bottom: 20px;
            color: #333;
        }

        /* 右上の「新規登録」リンク */
        .top-links {
            text-align: right;
            margin-bottom: 15px;
        }
        .top-links a {
            font-size: 16px;
            color: #0066cc;
            text-decoration: none;
        }
        .top-links a:hover {
            text-decoration: underline;
        }

        /* 🔍 検索・絞込み条件エリア（薄いグレーの大きな角丸枠） */
        .filter-box {
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            padding: 25px 30px;
            margin-bottom: 30px;
            background-color: #fff;
            display: flex;
            align-items: center;
            gap: 40px;
        }
        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }
        .filter-group label {
            font-size: 14px;
            font-weight: bold;
            color: #333;
        }
        .filter-group select {
            padding: 6px 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
            min-width: 130px;
            background-color: #fff;
        }
        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 22px; /* セレクトボックスのラベル分、位置を下げて中央揃えに */
            font-size: 14px;
        }
        
        /* 絞込みボタン（画像と同じダークグレーの丸角デザイン） */
        .btn-filter {
            background-color: #444;
            color: white;
            border: none;
            padding: 10px 24px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 22px;
            transition: background 0.2s;
        }
        .btn-filter:hover {
            background-color: #333;
        }

        /* 📊 検索結果・件数表示 */
        .result-count {
            font-size: 14px;
            margin-bottom: 15px;
            color: #333;
        }

        /* 学生一覧テーブル（シンプルで洗練された細線） */
        .student-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 15px;
        }
        .student-table th, .student-table td {
            padding: 12px 10px;
            text-align: left;
            font-size: 14px;
            border-bottom: 1px solid #e0e0e0;
        }
        .student-table th {
            font-weight: bold;
            color: #333;
            border-bottom: 2px solid #333; /* ヘッダーの下だけ少し太い線 */
        }
        .action-link {
            color: #0066cc;
            text-decoration: none;
        }
        .action-link:hover {
            text-decoration: underline;
        }
        
        /* エラー・警告メッセージ表示（学生情報が存在しませんでした） */
        .error-message {
            color: #333;
            font-size: 14px;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<!-- 💻 ヘッダー情報（ご指定のEL式に修正完了） -->
<header>
    <h1>得点管理システム</h1>
    <div class="user-info">
        ${user.name}様 <a href="logout.jsp" class="logout-link">ログアウト</a>
    </div>
</header>

<div class="container">
    <!-- 📂 左側サイドメニュー -->
    <nav class="side-menu">
        <ul>
            <li><a href="menu.jsp">メニュー</a></li>
            <li><a href="student_list.jsp">学生管理</a></li>
            <li><a href="grade.jsp">成績管理</a></li>
                <ul class="sub-menu">
                    <li><a href="subject_create.jsp">成績登録</a></li>
                    <li><a href="grade.jsp">成績参照</a></li>
                </ul>
            </li>
            <li><a href="subject_list.jsp">科目管理</a></li>
        </ul>
    </nav>

    <!-- 📝 中央メインコンテンツ -->
    <main class="main-content">
        <div class="menu-title-box">学生管理</div>
        
        <!-- 右上の新規登録リンク -->
        <div class="top-links">
            <a href="StudentCreate.action">新規登録</a>
        </div>
        
        <!-- 🔍 絞込み検索フォーム -->
        <form action="StudentList.action" method="get" class="filter-box">
            <div class="filter-group">
                <label>入学年度</label>
                <select name="f1">
                    <option value="">--------</option>
                    <c:forEach var="year" items="${years}">
                        <option value="${year}" ${year == param.f1 ? 'selected' : ''}>${year}</option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="filter-group">
                <label>クラス</label>
                <select name="f2">
                    <option value="">--------</option>
                    <c:forEach var="c_name" items="${classes}">
                        <option value="${c_name}" ${c_name == param.f2 ? 'selected' : ''}>${c_name}</option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="checkbox-group">
                <input type="checkbox" name="f3" id="attend" value="true" ${param.f3 == 'true' || empty param.f3 ? 'checked' : ''}>
                <label factory="attend">在学中</label>
            </div>
            
            <button type="submit" class="btn-filter">絞込み</button>
        </form>
        
        <!-- 📊 検索結果件数 -->
        <div class="result-count">
            検索結果：${students.size()}件
        </div>
        
        <!-- 学生一覧テーブル（ID、名前、クラスに絞ってシンプルに表示） -->
        <table class="student-table">
            <thead>
                <tr>
                    <th style="width: 15%;">入学年度</th>
                    <th style="width: 20%;">学生番号</th>
                    <th style="width: 30%;">氏名</th>
                    <th style="width: 15%;">クラス</th>
                    <th style="width: 10%;">在学中</th>
                    <th style="width: 10%;"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.entYear}</td>
                        <td>${student.no}</td>
                        <td>${student.name}</td>
                        <td>${student.classNum}</td>
                        <td>
                            <c:choose>
                                <c:when test="${student.attend}">〇</c:when>
                                <c:otherwise>×</c:otherwise>
                            </c:choose>
                        </td>
                        <td><a href="StudentChange.action?no=${student.no}" class="action-link">変更</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <!-- 💡 学生データが1件もない場合のみ表示する大原のメッセージ仕様 -->
        <c:if test="${empty students}">
            <div class="error-message">学生情報が存在しませんでした</div>
        </c:if>
    </main>
</div>

</body>
</html>