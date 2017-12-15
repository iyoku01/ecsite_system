package action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EcsiteDao;
import database.HistoryDto;

public class OrderHistorySelect implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try (EcsiteDao dao = new EcsiteDao()) {

            //セッション変数user_idの取得
            HttpSession session = request.getSession();
            String user_id = (String) session.getAttribute("user_id");

            ArrayList<HistoryDto> historyList = dao.getHistoryList(user_id);

            if (historyList.isEmpty()) {
                request.setAttribute("message", "購入履歴はありません");
            } else {
                request.setAttribute("historyList", historyList);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("message", "数値を入力して下さい");
        } catch (SQLException e) {
            request.setAttribute("message", "JDBC のエラーです : " + e.getMessage());
        } catch (ClassNotFoundException e) {
            request.setAttribute("message", "数値を入力して下さい");
        }

        return "history.jsp";
    }

}
