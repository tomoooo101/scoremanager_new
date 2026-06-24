package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import bean.TestBean;

public class TestDao {
    private final String URL = "jdbc:postgresql://localhost:5432/kadai";
    private final String USER = "postgres";
    private final String PASSWORD = "password"; // ★ご自身のパスワードに修正してください

    // ① 条件（学生、科目、回数）を指定して、特定のテスト1件を取得するメソッド
    public TestBean get(String studentNo, String subjectCd, int no) {
        TestBean test = null;
        String sql = "SELECT * FROM 成績 WHERE 学生番号 = ? AND 科目コード = ? AND 回数 = ?";

        try { Class.forName("org.postgresql.Driver"); } catch (Exception e) { return null; }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, studentNo);
            pStmt.setString(2, subjectCd);
            pStmt.setInt(3, no);

            try (ResultSet rs = pStmt.executeQuery()) {
                if (rs.next()) {
                    test = new TestBean();
                    test.setStudentNo(rs.getString("学生番号"));
                    test.setSubjectCd(rs.getString("科目コード"));
                    test.setNo(rs.getInt("回数"));
                    test.setPoint(rs.getInt("点数"));
                    test.setClassNum(rs.getString("クラス番号"));
                    test.setSchoolCode(rs.getString("学校コード"));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return test;
    }

    // ② テストの点数を保存（新規登録、またはすでにあれば更新）するメソッド
    public boolean save(TestBean test) {
        // すでにデータがあるか確認
        TestBean exists = get(test.getStudentNo(), test.getSubjectCd(), test.getNo());
        String sql;

        if (exists == null) {
            // なければ新規登録 (INSERT)
            sql = "INSERT INTO 成績 (学生番号, 科目コード, 回数, 点数, クラス番号, 学校コード) VALUES (?, ?, ?, ?, ?, ?)";
        } else {
            // あれは更新 (UPDATE)
            sql = "UPDATE 成績 SET 点数 = ?, クラス番号 = ? WHERE 学生番号 = ? AND 科目コード = ? AND 回数 = ?";
        }

        try { Class.forName("org.postgresql.Driver"); } catch (Exception e) { return false; }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            if (exists == null) {
                pStmt.setString(1, test.getStudentNo());
                pStmt.setString(2, test.getSubjectCd());
                pStmt.setInt(3, test.getNo());
                pStmt.setInt(4, test.getPoint());
                pStmt.setString(5, test.getClassNum());
                pStmt.setString(6, test.getSchoolCode());
            } else {
                pStmt.setInt(1, test.getPoint());
                pStmt.setString(2, test.getClassNum());
                pStmt.setString(3, test.getStudentNo());
                pStmt.setString(4, test.getSubjectCd());
                pStmt.setInt(5, test.getNo());
            }

            int row = pStmt.executeUpdate();
            return row > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<TestBean> getList() {

        List<TestBean> list = new ArrayList<>();

        String sql = "SELECT * FROM 成績";

        try {
            Class.forName("org.postgresql.Driver");

            Connection conn =
                DriverManager.getConnection(
                    URL, USER, PASSWORD);

            PreparedStatement ps =
                conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                TestBean bean =
                    new TestBean();

                bean.setStudentNo(
                    rs.getString("学生番号"));

                bean.setSubjectCd(
                    rs.getString("科目コード"));

                bean.setNo(
                    rs.getInt("回数"));

                bean.setPoint(
                    rs.getInt("点数"));

                list.add(bean);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
}