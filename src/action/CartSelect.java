package action;

import static model.Constants.*;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;

public class CartSelect implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");

        //�Z�b�V�����ϐ����J�[�g���擾
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute(SESSION_CART);

        //�J�[�g����̏ꍇ�A�G���[���b�Z�[�W��\��
        if (cart == null || cart.isEmpty()) {
            request.setAttribute("message", "�J�[�g�ɏ��i������܂���");
        }

        return "cart.jsp";
    }
}
