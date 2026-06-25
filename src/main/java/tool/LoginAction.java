package tool;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import bean.TeacherBean;
import dao.TeacherDao;

@WebServlet("/Login.action")
public class LoginAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String password = request.getParameter("password");

        // 💡【多角的検証】画面からどんな文字が本当に届いているかコンソールに強制表示
        System.out.println("==========================================");
        System.out.println("【デバッグ】画面から届いたID: [" + id + "]");
        System.out.println("【デバッグ】画面から届いたPW: [" + password + "]");
        System.out.println("==========================================");

        TeacherDao dao = new TeacherDao();
        TeacherBean teacher = dao.login(id, password);

        if (teacher != null) {
            // セッションにユーザー情報を保存
            HttpSession session = request.getSession();
            session.setAttribute("user", teacher);
            response.sendRedirect("menu.jsp");
        } else {
            java.util.List<String> errors = new java.util.ArrayList<>();
            errors.add("ユーザーIDまたはパスワードが違います");
            request.setAttribute("errors", errors);
            request.setAttribute("id", id);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}