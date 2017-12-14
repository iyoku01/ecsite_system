package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EcsiteDao;

public class PersonalIdCheck implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");

        String destination = "/";
        try (EcsiteDao dao = new EcsiteDao()) {

            String user_id = request.getParameter("user_id");

            if (dao.checkId(user_id)) {
                destination = "memberAddConf.jsp";
            } else {
                request.setAttribute("message", "‚»‚ÌID‚ÍŠù‚É“o˜^‚³‚ê‚Ä‚¢‚Ü‚·");
                destination = "memberAdd.jsp";
            }

        } catch (NumberFormatException e) {
            request.setAttribute("message", "”’l‚ğ“ü—Í‚µ‚Ä‰º‚³‚¢");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC ‚ÌƒGƒ‰[‚Å‚· : " + e.getMessage());
        }

        return destination;
    }

}
