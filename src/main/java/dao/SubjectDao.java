package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import bean.SubjectBean;

public class SubjectDao {
    private final String URL = "jdbc:postgresql://localhost:5432/kadai";
    private final String USER = "postgres";
    private final String PASSWORD = "password"; // ★ご自身のパスワードに修正してください

    // ① 科目コードから科目1件の情報を取得するメソッド
    public SubjectBean get(String cd, String schoolCode) {
        SubjectBean subject = null;
        String sql = "SELECT * FROM 科目 WHERE 科目コード = ? AND 学校コード = ?";

        try { Class.forName("org.postgresql.Driver"); } catch (Exception e) { return null; }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, cd);
            pStmt.setString(2, schoolCode);
            try (ResultSet rs = pStmt.executeQuery()) {
                if (rs.next()) {
                    subject = new SubjectBean();
                    subject.setCd(rs.getString("科目コード"));
                    subject.setName(rs.getString("科目名"));
                    subject.setSchoolCode(rs.getString("学校コード"));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return subject;
    }

    // ② その学校の科目一覧をすべて取得するメソッド
    public List<SubjectBean> filter(String schoolCode) {
        List<SubjectBean> list = new ArrayList<>();
        String sql = "SELECT * FROM 科目 WHERE 学校コード = ? ORDER BY 科目コード";

        try { Class.forName("org.postgresql.Driver"); } catch (Exception e) { return list; }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, schoolCode);

            try (ResultSet rs = pStmt.executeQuery()) {
                while (rs.next()) {
                    SubjectBean subject = new SubjectBean();
                    subject.setCd(rs.getString("科目コード"));
                    subject.setName(rs.getString("科目名"));
                    subject.setSchoolCode(rs.getString("学校コード"));
                    list.add(subject);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // ③ 新しい科目を登録するメソッド
    public boolean save(SubjectBean subject) {
        String sql = "INSERT INTO 科目 (科目コード, 科目名, 学校コード) VALUES (?, ?, ?)";
        
        try { Class.forName("org.postgresql.Driver"); } catch (Exception e) { return false; }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, subject.getCd());
            pStmt.setString(2, subject.getName());
            pStmt.setString(3, subject.getSchoolCode());

            int row = pStmt.executeUpdate();
            return row > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}