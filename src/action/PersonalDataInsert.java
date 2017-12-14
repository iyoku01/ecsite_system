package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EcsiteDao;

public class PersonalDataInsert implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");

        try (EcsiteDao dao = new EcsiteDao()) {
            String user_id = request.getParameter("user_id");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String nickname = request.getParameter("nickname");
            String phone = request.getParameter("phone");
            String postal_code = request.getParameter("postal_code");
            String address = request.getParameter("address");
            HttpSession session = request.getSession();

            if (session.getAttribute("user_id") != null) {
                user_id = (String) session.getAttribute("user_id");
                dao.updataPersonalData(user_id, password, name, nickname, phone, postal_code, address);
            } else {
                dao.insertPersonalData(user_id, password, name, nickname, phone, postal_code, address);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("message", "êîílÇì¸óÕÇµÇƒâ∫Ç≥Ç¢");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC ÇÃÉGÉâÅ[Ç≈Ç∑ : " + e.getMessage());
            System.out.println("ÅöSQLEx CNFEx" + e);
        }

        return "Top.Control";
    }
}
