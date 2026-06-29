package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClassNumDao {
    private final String URL = "jdbc:h2:~/bank";
    private final String USER = "sa";
    private final String PASSWORD = "";

    public List<String> filter(String schoolCd) {
        List<String> list = new ArrayList<>();
        String sql = "SELECT CLASS_NUM FROM CLASS_NUM WHERE SCHOOL_CD = ? ORDER BY CLASS_NUM";

        try {
            Class.forName("org.h2.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return list;
        }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, schoolCd);

            try (ResultSet rs = pStmt.executeQuery()) {
                while (rs.next()) {
                    list.add(rs.getString("CLASS_NUM"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
