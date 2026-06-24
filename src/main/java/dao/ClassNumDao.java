package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import bean.ClassNumBean;

public class ClassNumDao {
    private final String URL = "jdbc:postgresql://localhost:5432/kadai";
    private final String USER = "postgres";
    private final String PASSWORD = "password"; // ★ご自身のパスワードに修正してください

    // 学校コードに所属するクラス番号の一覧をぜんぶ取得するメソッド
    public List<String> filter(String schoolCd) {
        List<String> list = new ArrayList<>();
        // ※テーブル名やカラム名はデータベースの定義（「クラス番号」等）に合わせて調整してください
        String sql = "SELECT クラス番号 FROM クラス番号 WHERE 学校コード = ? ORDER BY クラス番号 Jerusalem";
        
        // もしSQLが通らない場合はこちらのシンプルなSQLを試してください
        // String sql = "SELECT * FROM クラス番号 WHERE 学校コード = ?";

        try {
            Class.forName("org.postgresql.Driver");
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
                    // 文字列のリストとしてクラス番号（"01組" など）を追加していく
                    list.add(rs.getString("クラス番号"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}