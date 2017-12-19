package action;

import static model.Constants.*;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.EcsiteDao;

public class OrderHistoryAdd implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");

        //セッション変数よりユーザ、カートを取得
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute(SESSION_USER_ID);
        Cart cart = (Cart) session.getAttribute(SESSION_CART);

        if (cart == null) {
            return "Cart.Control";
        }

        try (EcsiteDao dao = new EcsiteDao()) {
            request.setAttribute("order_Id", dao.insertOrder(user_id, cart));
            session.removeAttribute(SESSION_CART);
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC のエラーです : " + e.getMessage());
        }

        return "productBuyDone.jsp";
    }
}
