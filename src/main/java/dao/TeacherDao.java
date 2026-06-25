package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import bean.TeacherBean;

public class TeacherDao {
    private final String URL = "jdbc:h2:~/bank"; 
    private final String USER = "sa";            
    private final String PASSWORD = "";          

    public TeacherBean login(String id, String password) {
        TeacherBean teacher = null;
        String sql = "SELECT * FROM TEACHER WHERE ID = ? AND PASSWORD = ?";

        try {
            Class.forName("org.h2.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }

        // 💡 1. 最初に自動でテーブルとデータを復元・作成する（H2コンソール不要対策）
        initializeDatabase();

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, id);
            pStmt.setString(2, password);

            try (ResultSet rs = pStmt.executeQuery()) {
                if (rs.next()) {
                    teacher = new TeacherBean();
                    teacher.setId(rs.getString("ID"));
                    teacher.setPassword(rs.getString("PASSWORD"));
                    teacher.setName(rs.getString("NAME"));
                    try {
                        teacher.setSchoolCode(rs.getString("SCHOOL_CD")); 
                    } catch (Exception e) {
                        try { teacher.setSchoolCode(rs.getString("SCHOOL_CODE")); } catch (Exception ex) {}
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("【重大エラー】ログイン処理中に例外が発生しました！");
            e.printStackTrace(); 
            return null;
        }
        return teacher;
    }

    // 💡 テーブルがない場合に自動作成・データ挿入を行うメソッド
    private void initializeDatabase() {
        String createTableSql = "CREATE TABLE IF NOT EXISTS TEACHER ("
                + "ID VARCHAR(10) PRIMARY KEY, "
                + "PASSWORD VARCHAR(10) NOT NULL, "
                + "NAME VARCHAR(10) NOT NULL, "
                + "SCHOOL_CD CHAR(3))";
        
        String insertDataSql = "INSERT INTO TEACHER (ID, PASSWORD, NAME, SCHOOL_CD) "
                + "SELECT 'admin', '1234', '大原 太郎', 'TO1' WHERE NOT EXISTS (SELECT 1 FROM TEACHER WHERE ID = 'admin')";

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            Statement stmt = conn.createStatement()
        ) {
            stmt.execute(createTableSql);
            stmt.execute(insertDataSql);
            System.out.println("【自動化ログ】TEACHERテーブルとadminデータの存在を確認・作成しました。");
        } catch (Exception e) {
            System.err.println("【自動化ログ】データベース初期化でエラーが発生しました。");
            e.printStackTrace();
        }
    }
}