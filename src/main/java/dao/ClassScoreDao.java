package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.StudentScoreBean;

public class ClassScoreDao {
    private final String URL = "jdbc:h2:~/bank";
    private final String USER = "sa";
    private final String PASSWORD = "";

    public List<StudentScoreBean> filter(String schoolCode, int entYear, String classNum, String subjectCd) {
        List<StudentScoreBean> list = new ArrayList<>();
        String sql = "SELECT * FROM SCORE WHERE SCHOOL_CD = ? AND CLASS_NUM = ? AND SUBJECT_CD = ? ORDER BY STUDENT_NO, NO";

        try { Class.forName("org.h2.Driver"); } catch (Exception e) { return list; }

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
                    score.setStudentNo(rs.getString("STUDENT_NO"));
                    score.setSubjectCd(rs.getString("SUBJECT_CD"));
                    score.setNo(rs.getInt("NO"));
                    score.setPoint(rs.getInt("POINT"));
                    score.setClassNum(rs.getString("CLASS_NUM"));
                    score.setSchoolCode(rs.getString("SCHOOL_CD"));
                    list.add(score);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}
