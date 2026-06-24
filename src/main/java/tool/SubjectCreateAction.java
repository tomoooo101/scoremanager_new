package tool;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SubjectCreateAction {


    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String method = request.getMethod();

        if (method.equals("GET")) {
            // 【GETの場合】ただ登録画面のJSPの名前を返す
            return "subject_create.jsp";
            
        } else {
            // 【POSTの場合】「登録」ボタンが押されたとき
            
            // 本来はここでDAOの登録処理を行います
            // String cd = request.getParameter("cd");
            // String name = request.getParameter("name");
            
            // 登録後はメニュー画面（Menu.action）へ自動で戻す
            response.sendRedirect("Menu.action");
            return null; // リダイレクト時は遷移先JSPがないためnullを返します
        }
    }
}