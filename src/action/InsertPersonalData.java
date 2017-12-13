package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EcsiteDao;

public class InsertPersonalData implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");
        System.out.println("★InsertPersonalData開始");//★

        try (EcsiteDao dao = new EcsiteDao()) {
            System.out.println("★InsertPersonalDataでdao生成");//★
            String user_id = request.getParameter("user_id");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String nickname = request.getParameter("nickname");
            String phone = request.getParameter("phone");
            String postal_code = request.getParameter("postal_code");
            String address = request.getParameter("address");
            HttpSession session = request.getSession();

            if (session.getAttribute("user_id") != null) {
                System.out.println("★[before] session.getAttribute(\"user_id\") != null");//★
                user_id = (String) session.getAttribute("user_id");
                dao.updataPersonalData(user_id, password, name, nickname, phone, postal_code, address);
                System.out.println("★session.getAttribute(\"user_id\") != null");//★
            } else {
                System.out.println("★[before] session.getAttribute(\"user_id\") == null");//★
                dao.insertPersonalData(user_id, password, name, nickname, phone, postal_code, address);
                System.out.println("★session.getAttribute(\"user_id\") == null");//★
            }

        } catch (NumberFormatException e) {
            request.setAttribute("message", "数値を入力して下さい");
            System.out.println("★NFex");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC のエラーです : " + e.getMessage());
            System.out.println("★SQLEx CNFEx" + e);
        }

        return "Top.Control";
    }
}
