package tool;

import java.io.IOException;
import java.util.List;

import bean.TestBean;
import dao.TestDao;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/TestList.action")
public class TestListAction extends HttpServlet {

    protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

        TestDao dao = new TestDao();

        List<TestBean> list =
            dao.getList();

        request.setAttribute(
            "testList",
            list);

        request.getRequestDispatcher(
            "/grade.jsp")
            .forward(request,response);
    }
}