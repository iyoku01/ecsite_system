package action;

import static model.Constants.*;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;

public class CartAdd implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");

        int product_id = Integer.parseInt(request.getParameter("product_id"));
        int buy_count = Integer.parseInt(request.getParameter("buy_count"));

        //セッション変数よりカートを取得
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute(SESSION_CART);
        if (cart == null) {
            cart = new Cart();
        }
        session.setAttribute(SESSION_CART, cart);

        //カートに商品を追加する
        cart.add(product_id, buy_count);

        return "Cart.Control";
    }

}
