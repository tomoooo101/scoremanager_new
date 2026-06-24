package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SchoolDao {
    private final String URL = "jdbc:postgresql://localhost:5432/kadai";
    private final String USER = "postgres";
    private final String PASSWORD = "password"; // ★ご自身のパスワードに修正してください

    // 学校コードを渡すと、学校名などを調べて返すメソッド（必要に応じて使います）
    public String getSchoolName(String schoolCd) {
        String schoolName = "";
        String sql = "SELECT 学校名 FROM 学校 WHERE 学校コード = ?";

        try {
            Class.forName("org.postgresql.Driver");
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
                    schoolName = rs.getString("学校名");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return schoolName;
    }
}