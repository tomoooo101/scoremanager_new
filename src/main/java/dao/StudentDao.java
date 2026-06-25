package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import bean.StudentBean;

public class StudentDao {
    private final String URL = "jdbc:h2:~/bank";
    private final String USER = "sa";
    private final String PASSWORD = "";

    public StudentBean get(String no) {
        StudentBean student = null;
        String sql = "SELECT * FROM STUDENT WHERE NO = ?";

        try { Class.forName("org.h2.Driver"); } catch (Exception e) { return null; }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, no);
            try (ResultSet rs = pStmt.executeQuery()) {
                if (rs.next()) {
                    student = new StudentBean();
                    student.setNo(rs.getString("NO"));
                    student.setName(rs.getString("NAME"));
                    student.setEntYear(rs.getInt("ENT_YEAR"));
                    student.setClassNum(rs.getString("CLASS_NUM"));
                    student.setIsAttend(rs.getBoolean("IS_ATTEND"));
                    student.setSchoolCode(rs.getString("SCHOOL_CD"));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return student;
    }

    public List<StudentBean> filter(String schoolCode, int entYear, String classNum, boolean isAttend) {
        List<StudentBean> list = new ArrayList<>();
        String sql = "SELECT * FROM STUDENT WHERE SCHOOL_CD = ? AND ENT_YEAR = ? AND CLASS_NUM = ? AND IS_ATTEND = ? ORDER BY NO";

        try { Class.forName("org.h2.Driver"); } catch (Exception e) { return list; }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, schoolCode);
            pStmt.setInt(2, entYear);
            pStmt.setString(3, classNum);
            pStmt.setBoolean(4, isAttend);

            try (ResultSet rs = pStmt.executeQuery()) {
                while (rs.next()) {
                    StudentBean student = new StudentBean();
                    student.setNo(rs.getString("NO"));
                    student.setName(rs.getString("NAME"));
                    student.setEntYear(rs.getInt("ENT_YEAR"));
                    student.setClassNum(rs.getString("CLASS_NUM"));
                    student.setIsAttend(rs.getBoolean("IS_ATTEND"));
                    student.setSchoolCode(rs.getString("SCHOOL_CD"));
                    list.add(student);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public boolean save(StudentBean student) {
        String sql = "INSERT INTO STUDENT (NO, NAME, ENT_YEAR, CLASS_NUM, IS_ATTEND, SCHOOL_CD) VALUES (?, ?, ?, ?, ?, ?)";

        try { Class.forName("org.h2.Driver"); } catch (Exception e) { return false; }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, student.getNo());
            pStmt.setString(2, student.getName());
            pStmt.setInt(3, student.getEntYear());
            pStmt.setString(4, student.getClassNum());
            pStmt.setBoolean(5, student.isAttend());
            pStmt.setString(6, student.getSchoolCode());

            int row = pStmt.executeUpdate();
            return row > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<StudentBean> findAll() {
        List<StudentBean> list = new ArrayList<>();
        String sql = "SELECT * FROM STUDENT ORDER BY NO";

        try { Class.forName("org.h2.Driver"); } catch (Exception e) { return list; }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql);
            ResultSet rs = pStmt.executeQuery()
        ) {
            while (rs.next()) {
                StudentBean student = new StudentBean();
                student.setNo(rs.getString("NO"));
                student.setName(rs.getString("NAME"));
                student.setEntYear(rs.getInt("ENT_YEAR"));
                student.setClassNum(rs.getString("CLASS_NUM"));
                student.setIsAttend(rs.getBoolean("IS_ATTEND"));
                student.setSchoolCode(rs.getString("SCHOOL_CD"));
                list.add(student);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}
