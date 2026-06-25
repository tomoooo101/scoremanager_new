package tool;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import bean.SubjectBean;
import dao.SubjectDao;

@WebServlet("/SubjectCreate.action")
public class SubjectCreateAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("subject_create.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String cd = request.getParameter("cd");
        String name = request.getParameter("name");

        if (cd == null || cd.trim().isEmpty() || name == null || name.trim().isEmpty()) {
            request.setAttribute("error", "科目コードと科目名は必須です");
            request.getRequestDispatcher("subject_create.jsp").forward(request, response);
            return;
        }

        SubjectBean subject = new SubjectBean();
        subject.setCd(cd.trim());
        subject.setName(name.trim());

        SubjectDao dao = new SubjectDao();
        boolean result = dao.save(subject);

        if (result) {
            response.sendRedirect("SubjectList.action");
        } else {
            request.setAttribute("error", "登録に失敗しました");
            request.getRequestDispatcher("subject_create.jsp").forward(request, response);
        }
    }
}
