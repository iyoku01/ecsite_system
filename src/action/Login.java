package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EcsiteDao;

public class Login implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try (EcsiteDao dao = new EcsiteDao()) {

            String user_id = request.getParameter("user_id");
            String password = request.getParameter("password");

            //入力されたIDとパスワードに一致するレコードがDBに存在するか判定
            boolean personal = dao.login(user_id, password);
            if (personal) {
                //存在していればセッション変数user_idを登録
                HttpSession session = request.getSession();
                session.setAttribute("user_id", user_id);
                System.out.print("★personal==trueルート:");//★
                System.out.println(user_id);//★
            } else {
                request.setAttribute("message", "入力されたデータは存在しません");
                request.setAttribute("user_id", user_id);
                return "login.jsp";
            }

        } catch (NumberFormatException e) {
            request.setAttribute("message", "数値を入力して下さい");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC のエラーです : " + e.getMessage());
        }
        return "Top.Control";
    }

}
