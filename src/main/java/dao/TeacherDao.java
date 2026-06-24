package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.TeacherBean;

public class TeacherDao {
    // 💡 画像から判明したH2データベースの正しい接続情報に修正！
    private final String URL = "jdbc:h2:~/bank"; 
    private final String USER = "sa";            // H2の標準ユーザー
    private final String PASSWORD = "";          // H2の標準パスワード（空っぽ）

    public TeacherBean login(String id, String password) {
        TeacherBean teacher = null;
        
        // 💡 テーブル名を日本語の「教員」から、画像に写っている「TEACHER」に変更！
        // 💡 カラム名もH2に合わせて英語（ID, PASSWORD）に直しています
        String sql = "SELECT * FROM TEACHER WHERE ID = ? AND PASSWORD = ?";

        try {
            // 💡 ドライバーも PostgreSQL から「H2用」に修正！
            Class.forName("org.h2.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, id);
            pStmt.setString(2, password);

            try (ResultSet rs = pStmt.executeQuery()) {
                if (rs.next()) {
                    teacher = new TeacherBean();
                    // 💡 H2からデータを取り出す名前も、英語のカラム名に合わせます
                    teacher.setId(rs.getString("ID"));
                    teacher.setPassword(rs.getString("PASSWORD"));
                    teacher.setName(rs.getString("NAME"));
                    
                    // 💡 学校コードの列名は「SCHOOL_CD」か「SCHOOL_CODE」のことが多いです。
                    // もしエラーが出たら、学校の設計書の英語名に合わせてみてください
                    teacher.setSchoolCode(rs.getString("SCHOOL_CD")); 
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return teacher;
    }
}