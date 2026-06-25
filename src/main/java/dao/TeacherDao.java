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

        // 💡 ログイン時にすべてのテーブルを裏で自動生成・復元する
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

    // 💡 全テーブルがなければ自動作成する無敵メソッド
    private void initializeDatabase() {
        // 1. TEACHER テーブル
        String createTeacher = "CREATE TABLE IF NOT EXISTS TEACHER ("
                + "ID VARCHAR(10) PRIMARY KEY, "
                + "PASSWORD VARCHAR(10) NOT NULL, "
                + "NAME VARCHAR(10) NOT NULL, "
                + "SCHOOL_CD CHAR(3))";
        
        // 2. STUDENT テーブル (エラー500の原因)
        String createStudent = "CREATE TABLE IF NOT EXISTS STUDENT ("
                + "NO VARCHAR(10) PRIMARY KEY, "
                + "NAME VARCHAR(10) NOT NULL, "
                + "ENT_YEAR INT NOT NULL, "
                + "CLASS_NUM VARCHAR(3) NOT NULL, "
                + "IS_ATTEND BOOLEAN DEFAULT TRUE, "
                + "SCHOOL_CD CHAR(3))";

        // 3. SUBJECT テーブル (科目管理用)
        String createSubject = "CREATE TABLE IF NOT EXISTS SUBJECT ("
                + "CD CHAR(3) PRIMARY KEY, "
                + "NAME VARCHAR(20) NOT NULL, "
                + "SCHOOL_CD CHAR(3))";

        // 4. SCORE / TEST テーブル (成績参照・登録エラー500の原因、両方に対応できるようにします)
        String createScore = "CREATE TABLE IF NOT EXISTS SCORE ("
                + "STUDENT_NO VARCHAR(10), "
                + "SUBJECT_CD CHAR(3), "
                + "POINT INT, "
                + "PRIMARY KEY(STUDENT_NO, SUBJECT_CD))";
        
        String createTest = "CREATE TABLE IF NOT EXISTS TEST ("
                + "STUDENT_NO VARCHAR(10), "
                + "SUBJECT_CD CHAR(3), "
                + "POINT INT, "
                + "PRIMARY KEY(STUDENT_NO, SUBJECT_CD))";

        // 初期データ（テスト用データも少し仕込みます）
        String insertTeacher = "INSERT INTO TEACHER (ID, PASSWORD, NAME, SCHOOL_CD) "
                + "SELECT 'admin', '1234', '大原 太郎', 'TO1' WHERE NOT EXISTS (SELECT 1 FROM TEACHER WHERE ID = 'admin')";

        String insertStudent = "INSERT INTO STUDENT (NO, NAME, ENT_YEAR, CLASS_NUM, IS_ATTEND, SCHOOL_CD) "
                + "SELECT '2221001', 'テスト生徒', 2026, '101', TRUE, 'TO1' WHERE NOT EXISTS (SELECT 1 FROM STUDENT WHERE NO = '2221001')";

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            Statement stmt = conn.createStatement()
        ) {
            // すべて実行
            stmt.execute(createTeacher);
            stmt.execute(createStudent);
            stmt.execute(createSubject);
            stmt.execute(createScore);
            stmt.execute(createTest);
            
            stmt.execute(insertTeacher);
            stmt.execute(insertStudent);
            
            System.out.println("【自動化ログ】全テーブル（STUDENT, SUBJECT, SCORE, TEST）の自動検証・復元が完了しました！");
        } catch (Exception e) {
            System.err.println("【自動化ログ】全自動データベース初期化でエラーが発生しました。");
            e.printStackTrace();
        }
    }
}