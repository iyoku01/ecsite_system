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

        //セッション変数よりカートを取得
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute(SESSION_CART);

        //カートが空の場合、エラーメッセージを表示
        if (cart == null || cart.isEmpty()) {
            request.setAttribute("message", "カートに商品がありません");
        }

        return "cart.jsp";
    }
}
