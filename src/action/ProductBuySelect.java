package action;

import static model.Constants.*;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.EcsiteDao;

public class ProductBuySelect implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");

        String[] product_id = request.getParameterValues("product_id");
        String[] buy_count = request.getParameterValues("buy_count");

        //�Z�b�V�����ϐ���胆�[�U�A�J�[�g���擾
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute(SESSION_USER_ID);
        Cart cart = (Cart) session.getAttribute(SESSION_CART);

        if (user_id == null) {
            //�����O�C�����A���O�C����ʂ֑J��
            return "login.jsp";
        } else if (cart == null || cart.isEmpty()) {
            //�J�[�g����̏ꍇ�A�J�[�g��ʂ֑J��
            return "Cart.Control";
        }

        if (product_id == null) {
            request.setAttribute("message", "IE���炱�̃y�[�W�͕\���ł��܂���");
            return "error.jsp";
        }

        try (EcsiteDao dao = new EcsiteDao()) {
            //���i�̍w������ύX
            for (int i = 0; i < product_id.length; i++) {
                cart.update(Integer.parseInt(product_id[i]), Integer.parseInt(buy_count[i]));
            }
            //������
            request.setAttribute("personalData", dao.getPersonal(user_id));
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC �̃G���[�ł� : " + e.getMessage());
        }

        return "productBuyConf.jsp";
    }
}
