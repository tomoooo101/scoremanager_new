package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.SubjectBean;

public class SubjectDao {
    private final String URL = "jdbc:h2:~/bank";
    private final String USER = "sa";
    private final String PASSWORD = "";

    public SubjectBean get(String cd, String schoolCode) {
        SubjectBean subject = null;
        String sql = "SELECT * FROM SUBJECT WHERE CD = ? AND SCHOOL_CD = ?";

        try { Class.forName("org.h2.Driver"); } catch (Exception e) { return null; }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, cd);
            pStmt.setString(2, schoolCode);
            try (ResultSet rs = pStmt.executeQuery()) {
                if (rs.next()) {
                    subject = new SubjectBean();
                    subject.setCd(rs.getString("CD"));
                    subject.setName(rs.getString("NAME"));
                    subject.setSchoolCode(rs.getString("SCHOOL_CD"));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return subject;
    }

    public List<SubjectBean> filter(String schoolCode) {
        List<SubjectBean> list = new ArrayList<>();
        String sql = "SELECT * FROM SUBJECT WHERE SCHOOL_CD = ? ORDER BY CD";

        try { Class.forName("org.h2.Driver"); } catch (Exception e) { return list; }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, schoolCode);

            try (ResultSet rs = pStmt.executeQuery()) {
                while (rs.next()) {
                    SubjectBean subject = new SubjectBean();
                    subject.setCd(rs.getString("CD"));
                    subject.setName(rs.getString("NAME"));
                    subject.setSchoolCode(rs.getString("SCHOOL_CD"));
                    list.add(subject);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public boolean save(SubjectBean subject) {
        String sql = "INSERT INTO SUBJECT (CD, NAME, SCHOOL_CD) VALUES (?, ?, ?)";

        try { Class.forName("org.h2.Driver"); } catch (Exception e) { return false; }

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
