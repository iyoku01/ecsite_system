package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EcsiteDao;
import database.Personal_mstVo;

public class PersonalDataSelect implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String destination = "/myPage.jsp";
        try (EcsiteDao dao = new EcsiteDao()) {

            HttpSession session = request.getSession();
            String user_id = (String) session.getAttribute("user_id");

            if (user_id != null) {
                Personal_mstVo personalData = dao.getPersonal(user_id);
                if (personalData != null) {
                    request.setAttribute("personalData", personalData);
                } else {
                    request.setAttribute("message", "�����s���̃G���[�ł�");
                }
            } else {
                destination = "/login.jsp";
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "���l����͂��ĉ�����");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC �̃G���[�ł� : " + e.getMessage());
        }
        return destination;
    }
}
