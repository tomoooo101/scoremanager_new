package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SchoolDao {
    private final String URL = "jdbc:h2:~/bank";
    private final String USER = "sa";
    private final String PASSWORD = "";

    public String getSchoolName(String schoolCd) {
        String schoolName = "";
        String sql = "SELECT NAME FROM SCHOOL WHERE CD = ?";

        try {
            Class.forName("org.h2.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return schoolName;
        }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, schoolCd);

            try (ResultSet rs = pStmt.executeQuery()) {
                if (rs.next()) {
                    schoolName = rs.getString("NAME");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return schoolName;
    }
}
