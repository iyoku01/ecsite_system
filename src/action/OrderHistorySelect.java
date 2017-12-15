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

            //�Z�b�V�����ϐ�user_id�̎擾
            HttpSession session = request.getSession();
            String user_id = (String) session.getAttribute("user_id");

            ArrayList<HistoryDto> historyList = dao.getHistoryList(user_id);

            if (historyList.isEmpty()) {
                request.setAttribute("message", "�w�������͂���܂���");
            } else {
                request.setAttribute("historyList", historyList);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("message", "���l����͂��ĉ�����");
        } catch (SQLException e) {
            request.setAttribute("message", "JDBC �̃G���[�ł� : " + e.getMessage());
        } catch (ClassNotFoundException e) {
            request.setAttribute("message", "���l����͂��ĉ�����");
        }

        return "history.jsp";
    }

}
