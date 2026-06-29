package tool;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import bean.TestBean;
import dao.TestDao;

@WebServlet("/TestList.action")
public class TestListAction extends HttpServlet {

    @Override
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