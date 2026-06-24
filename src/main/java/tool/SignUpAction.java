package tool;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SignUp.action") // 💡 新規登録画面を呼び出すためのURL
public class SignUpAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // 新規登録の入力画面（signup.jsp）へフォワードして表示させる
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // 💡 登録ボタンが押された後の処理
        // 本来はここでDAOを使ってデータベースにユーザーを保存しますが、
        // 「教員登録の機能自体はいらない」とのことですので、登録後はそのままログイン画面（login.jsp）へ戻します。
        response.sendRedirect("login.jsp");
    }
}