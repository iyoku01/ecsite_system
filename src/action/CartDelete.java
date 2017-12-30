package action;

import static model.Constants.*;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;

public class CartDelete implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");

        int product_id = Integer.parseInt(request.getParameter("product_id"));

        //�Z�b�V�����ϐ����J�[�g���擾
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute(SESSION_CART);

        //�J�[�g���珤�i���폜����
        cart.delete(product_id);

        return "Cart.Control";
    }

}
