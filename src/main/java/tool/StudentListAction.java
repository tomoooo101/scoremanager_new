package tool;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.StudentBean; // 💡 学生情報を格納するBean
import dao.StudentDao;   // 💡 データベースと通信するDAO（すでに作成されているもの、またはこれから作成するもの）

@WebServlet("/StudentList.action") // 💡 メインメニューやサイドメニューからの飛び先URLです
public class StudentListAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. データベースから学生一覧を取得するためのDAOを準備
        StudentDao dao = new StudentDao();
        List<StudentBean> students = null;
        
        try {
            // 💡 DAOから全学生のリスト（ID、名前、クラスなどの特定フィールドのみ）を取得します
            // ※メソッド名は、すでにあるStudentDaoの実装（findAllなど）に合わせて適宜調整してください
            students = dao.findAll(); 
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 2. 取得した学生リストをリクエスト属性（"students" という名前）にセット
        request.setAttribute("students", students);

        // 3. 学生一覧画面（list.jsp）へフォワードしてデータを引き渡す
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // 検索ボタンなどが押された場合も、同様に一覧表示処理を行います
        doGet(request, response);
    }
}