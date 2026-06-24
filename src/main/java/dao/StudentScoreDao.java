package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.StudentScoreBean; // 💡 ここをStudentScoreBeanに変更！

public class StudentScoreDao {
    private final String URL = "jdbc:postgresql://localhost:5432/kadai";
    private final String USER = "postgres";
    private final String PASSWORD = "password"; // ★ご自身のパスワードに修正してください

    // 学生番号を指定して、その学生の全科目の成績一覧を取得するメソッド
    public List<StudentScoreBean> filter(String studentNo) {
        List<StudentScoreBean> list = new ArrayList<>();
        String sql = "SELECT * FROM 成績 WHERE 学生番号 = ? ORDER BY 科目コード, 回数";

        try { Class.forName("org.postgresql.Driver"); } catch (Exception e) { return list; }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, studentNo);

            try (ResultSet rs = pStmt.executeQuery()) {
                while (rs.next()) {
                    StudentScoreBean score = new StudentScoreBean();
                    // 💡 もしBean側のメソッド名が違っていたら、赤波線が出たところをBeanに合わせて直してください
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