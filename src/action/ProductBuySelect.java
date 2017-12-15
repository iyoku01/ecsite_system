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

        //セッション変数よりユーザ、カートを取得
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute(SESSION_USER_ID);
        Cart cart = (Cart) session.getAttribute(SESSION_CART);

        if (user_id == null) {
            //未ログイン時、ログイン画面へ遷移
            return "login.jsp";
        } else if (cart == null || cart.isEmpty()) {
            //カートが空の場合、カート画面へ遷移
            return "Cart.Control";
        }

        if (product_id == null) {
            request.setAttribute("message", "IEからこのページは表示できません");
            return "error.jsp";
        }

        try (EcsiteDao dao = new EcsiteDao()) {
            //商品の購入数を変更
            for (int i = 0; i < product_id.length; i++) {
                cart.update(Integer.parseInt(product_id[i]), Integer.parseInt(buy_count[i]));
            }
            //会員情報
            request.setAttribute("personalData", dao.getPersonal(user_id));
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC のエラーです : " + e.getMessage());
        }

        return "productBuyConf.jsp";
    }
}
