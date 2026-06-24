package tool;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.TeacherBean;
import dao.TeacherDao;

@WebServlet("/Login.action") // ログイン用のURLを設定します
public class LoginAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 最初にログイン画面を表示するときの処理（GET）
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // login.jspを表示する
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    // ログインボタンが押されて、IDとパスワードが送られてきたときの処理（POST）
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        // 💡 JSPの name="id" に合わせて "id" で受け取る
        String id = request.getParameter("id"); 
        String password = request.getParameter("password");
        
        // ② 厨房（DAO）を呼び出して、データベースを調べてもらう
        TeacherDao dao = new TeacherDao();
        TeacherBean teacher = dao.login(id, password);
        
        // ③ 判定結果によって画面遷移（案内）を切り替える
        if (teacher != null) {
            // ログイン成功！メニュー画面にリダイレクト
            response.sendRedirect("menu.jsp");
        } else {
            // 💡 JSPに合わせて「errors」というリストを作って渡す
            java.util.List<String> errors = new java.util.ArrayList<>();
            errors.add("ユーザーIDまたはパスワードが違います");
            request.setAttribute("errors", errors);
            
            // 入力したIDを画面に残すための処理
            request.setAttribute("id", id);
            
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
} // 💡 貼り付けるときは、この最後の閉じカッコまでしっかり入れてね！