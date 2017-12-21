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

            //���͂��ꂽID�ƃp�X���[�h�Ɉ�v���郌�R�[�h��DB�ɑ��݂��邩����
            boolean personal = dao.login(user_id, password);
            if (personal) {
                //���݂��Ă���΃Z�b�V�����ϐ�user_id��o�^
                HttpSession session = request.getSession();
                session.setAttribute("user_id", user_id);
                System.out.print("��personal==true���[�g:");//��
                System.out.println(user_id);//��
            } else {
                request.setAttribute("message", "���͂��ꂽ�f�[�^�͑��݂��܂���");
                request.setAttribute("user_id", user_id);
                return "login.jsp";
            }

        } catch (NumberFormatException e) {
            request.setAttribute("message", "���l����͂��ĉ�����");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC �̃G���[�ł� : " + e.getMessage());
        }
        return "Top.Control";
    }

}
