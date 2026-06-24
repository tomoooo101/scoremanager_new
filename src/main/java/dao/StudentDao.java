package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.StudentBean;

public class StudentDao {
    private final String URL = "jdbc:postgresql://localhost:5432/kadai";
    private final String USER = "postgres";
    private final String PASSWORD = "password"; // ★ご自身のパスワードに修正してください

    // ① 学生番号から学生1人の情報を取得するメソッド
    public StudentBean get(String no) {
        StudentBean student = null;
        String sql = "SELECT * FROM 学生 WHERE 学生番号 = ?";

        try { Class.forName("org.postgresql.Driver"); } catch (Exception e) { return null; }

        try (
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement pStmt = conn.prepareStatement(sql)
        ) {
            pStmt.setString(1, no);
            try (ResultSet rs = pStmt.executeQuery()) {
                if (rs.next()) {
                    student = new StudentBean();
                    student.setNo(rs.getString("学生番号"));
                    student.setName(rs.getString("氏名"));
                    student.setEntYear(rs.getInt("入学年度"));
                    student.setClassNum(rs.getString("クラス番号"));
                    student.setIsAttend(rs.getBoolean("在学中フラグ")); // or rs.getString などDB定義に合わせて
                    student.setSchoolCode(rs.getString("学校コード"));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return student;
    }

    // ② 条件（学校、入学年度、クラス、在学フラグ）で学生一覧を検索するメソッド
    public List<StudentBean> filter(String schoolCode, int entYear, String classNum, boolean isAttend) {
        List<StudentBean> list = new ArrayList<>();
        // 基本のSQL（学校コードと在学フラグは必須条件とする場合）
        String sql = "SELECT * FROM 学生 WHERE 学校コード = ? AND 入学年度 = ? AND クラス番号 = ? AND 在学中フラグ = ? ORDER BY 学生番号";

        try { Class.forName("org.postgresql.Driver"); } catch (Exception e) { return list; }

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
                    student.setNo(rs.getString("学生番号"));
                    student.setName(rs.getString("氏名"));
                    student.setEntYear(rs.getInt("入学年度"));
                    student.setClassNum(rs.getString("クラス番号"));
                    student.setIsAttend(rs.getBoolean("在学中フラグ"));
                    student.setSchoolCode(rs.getString("学校コード"));
                    list.add(student);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // ③ 新しい学生を登録するメソッド
    public boolean save(StudentBean student) {
        String sql = "INSERT INTO 学生 (学生番号, 氏名, 入学年度, クラス番号, 在学中フラグ, 学校コード) VALUES (?, ?, ?, ?, ?, ?)";
        
        try { Class.forName("org.postgresql.Driver"); } catch (Exception e) { return false; }

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
        return new ArrayList<>();
    }
}