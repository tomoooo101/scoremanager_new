package tool;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 💡登録画面(StudentCreate.action)と一覧画面(StudentList.action)の両方のエラーを防ぎます
@WebServlet("/StudentCreate.action")
public class StudentCreateAction extends HttpServlet {
    private static final long serialVersionUID = 1;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // 学生管理（登録や一覧）が押されたら、一旦作成済みのstudent_create.jspを表示します
        request.getRequestDispatcher("student_create.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("menu.jsp");
    }
}