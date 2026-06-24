package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import bean.StudentScoreBean; // ここでも学校指定のStudentScoreBeanを使い回すか、クラス用Beanがあればそれに変更してください

public class ClassScoreDao {
    private final String URL = "jdbc:postgresql://localhost:5432/kadai";
    private final String USER = "postgres";
    private final String PASSWORD = "password"; // ★ご自身のパスワードに修正してください

    // 学校、入学年度、クラス、科目を指定して、クラス全員の成績一覧を取得するメソッド
    public List<StudentScoreBean> filter(String schoolCode, int entYear, String classNum, String subjectCd) {
        List<StudentScoreBean> list = new ArrayList<>();
        
        // 成績テーブルと学生テーブルを繋いで、特定のクラス・科目のデータを引っ張ってくるSQL
        String sql = "SELECT * FROM 成績 WHERE 学校コード = ? AND クラス番号 = ? AND 科目コード = ? ORDER BY 学生番号, 回数";

        try { Class.forName("org.postgresql.Driver"); } catch (Exception e) { return list; }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, schoolCode);
            pStmt.setString(2, classNum);
            pStmt.setString(3, subjectCd);

            try (ResultSet rs = pStmt.executeQuery()) {
                while (rs.next()) {
                    StudentScoreBean score = new StudentScoreBean();
                    score.setStudentNo(rs.getString("学生番号"));
                    score.setSubjectCd(rs.getString("科目コード"));
                    score.setNo(rs.getInt("回数"));
                    score.setPoint(rs.getInt("点数"));
                    score.setClassNum(rs.getString("クラス番号"));
                    score.setSchoolCode(rs.getString("学校コード"));
                    list.add(score);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}