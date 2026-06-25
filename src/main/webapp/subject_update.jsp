<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>科目情報変更</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body{
            background:#f5f5f5;
        }

        .header{
            background:#e9edf4;
            padding:15px;
        }

        .content{
            margin-left:200px;
            min-height:400px;
            border-left:1px solid #ddd;
            padding-left:20px;
        }

        .footer{
            background:#e9e9e9;
            text-align:center;
            margin-top:50px;
            padding:10px;
            clear:both;
        }

        .title-bar{
            background:#eeeeee;
            padding:5px 10px;
            margin-bottom:20px;
        }
    </style>
</head>
<body>

<div class="container">

    <!-- ヘッダー -->
    <%-- 💡 1. 外からヘッダーを取ってくる（上の重複していた古い header は消去しました） --%>
    <%@ include file="header.jsp" %>

    <!-- サイドメニュー -->
    <div class="sidebar">
        <div><a href="menu.jsp">メニュー</a></div>
        <div><a href="student_list.jsp">学生管理</a></div>
        <div><a href="test_regist.jsp">成績管理</a></div>
        <div><a href="test_list.jsp">成績参照</a></div>
        <div><a href="subject_list.jsp">科目管理</a></div>
    </div>

    <!-- メイン -->
    <div class="content">

        <div class="title-bar">
            <strong>科目情報変更</strong>
        </div>

        <form action="SubjectChangeAction" method="post">

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">
                    科目コード
                </label>

                <div class="col-sm-10">
                    F02
                </div>
            </div>

            <div class="row mb-3">
                <label class="col-sm-2 col-form-label">
                    科目名
                </label>

                <div class="col-sm-10">
                    <input
                        type="text"
                        name="subjectName"
                        class="form-control"
                        value="Javaプログラミング基礎">
                </div>
            </div>

            <button
                type="submit"
                class="btn btn-primary btn-sm">
                変更
            </button>

        </form>

        <div class="mt-2">
            <a href="subject_list.jsp">戻る</a>
        </div>

    </div>

</div>

<!-- フッター -->
<%@ include file="footer.jsp" %>

</body>
</html>