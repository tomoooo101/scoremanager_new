package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import bean.TestBean;

public class TestDao {
    private final String URL = "jdbc:h2:~/bank";
    private final String USER = "sa";
    private final String PASSWORD = "";

    public TestBean get(String studentNo, String subjectCd, int no) {
        TestBean test = null;
        String sql = "SELECT * FROM SCORE WHERE STUDENT_NO = ? AND SUBJECT_CD = ? AND NO = ?";

        try { Class.forName("org.h2.Driver"); } catch (Exception e) { return null; }

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
                    test.setStudentNo(rs.getString("STUDENT_NO"));
                    test.setSubjectCd(rs.getString("SUBJECT_CD"));
                    test.setNo(rs.getInt("NO"));
                    test.setPoint(rs.getInt("POINT"));
                    test.setClassNum(rs.getString("CLASS_NUM"));
                    test.setSchoolCode(rs.getString("SCHOOL_CD"));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return test;
    }

    public boolean save(TestBean test) {
        TestBean exists = get(test.getStudentNo(), test.getSubjectCd(), test.getNo());
        String sql;

        if (exists == null) {
            sql = "INSERT INTO SCORE (STUDENT_NO, SUBJECT_CD, NO, POINT, CLASS_NUM, SCHOOL_CD) VALUES (?, ?, ?, ?, ?, ?)";
        } else {
            sql = "UPDATE SCORE SET POINT = ?, CLASS_NUM = ? WHERE STUDENT_NO = ? AND SUBJECT_CD = ? AND NO = ?";
        }

        try { Class.forName("org.h2.Driver"); } catch (Exception e) { return false; }

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
        String sql = "SELECT * FROM SCORE";

        try {
            Class.forName("org.h2.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                TestBean bean = new TestBean();
                bean.setStudentNo(rs.getString("STUDENT_NO"));
                bean.setSubjectCd(rs.getString("SUBJECT_CD"));
                bean.setNo(rs.getInt("NO"));
                bean.setPoint(rs.getInt("POINT"));
                list.add(bean);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
