package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EcsiteDao;

public class PersonalDataInsert implements Action {

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");

        //���͓��e���擾
        try (EcsiteDao dao = new EcsiteDao()) {
            String user_id = request.getParameter("user_id");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            String nickname = request.getParameter("nickname");
            String phone = request.getParameter("phone");
            String postal_code = request.getParameter("postal_code");
            String address = request.getParameter("address");
            HttpSession session = request.getSession();

            //�Z�b�V�����ϐ�user_id���擾�ł���(���O�C�����Ă���)
            //  ���l���̕ύX
            if (session.getAttribute("user_id") != null) {
                user_id = (String) session.getAttribute("user_id");
                dao.updataPersonalData(user_id, password, name, nickname,
                        phone, postal_code, address);
                request.setAttribute("message", "�ύX���������܂����I");
                //�Z�b�V�����ϐ�user_id���擾�ł��Ȃ�(���O�C�����ĂȂ�)
                //  ���l���̓o�^
            } else {
                dao.insertPersonalData(user_id, password, name, nickname,
                        phone, postal_code, address);
                session.setAttribute("user_id", user_id);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("message", "���l����͂��ĉ�����");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC �̃G���[�ł� : " + e.getMessage());
        }

        return "MyPage.Control";
    }
}
