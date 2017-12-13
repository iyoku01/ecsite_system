package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EcsiteDao;

public class CheckInsert implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");

        String destination = "/";
        try (EcsiteDao dao = new EcsiteDao()) {

            String user_id = request.getParameter("user_id");

            if (dao.checkId(user_id)) {
                destination = "registConf.jsp";
            } else {
                request.setAttribute("message", "そのIDは既に登録されています");
                destination = "newMemberRegist.jsp";
            }

        } catch (NumberFormatException e) {
            request.setAttribute("message", "数値を入力して下さい");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC のエラーです : " + e.getMessage());
        }

        return destination;
    }

}
