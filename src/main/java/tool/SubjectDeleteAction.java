package tool;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SubjectDelete.action") // 💡 科目削除確認画面を呼び出すURL
public class SubjectDeleteAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 科目削除画面、または確認画面（JSP）へ遷移させる準備
        request.getRequestDispatcher("subject_delete.jsp").forward(request, response);
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 削除ボタンが押された後の処理（一旦、一覧へリダイレクト）
        response.sendRedirect("SubjectList.action");
    }
}