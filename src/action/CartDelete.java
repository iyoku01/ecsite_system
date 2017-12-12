package action;

import static model.Constants.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EcsiteDao;

public class CartDelete implements Action {

    private Map<Integer, Integer> cartMap; //カート内の商品<商品ID, 個数>

    @SuppressWarnings("unchecked")
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");

        try (EcsiteDao dao = new EcsiteDao()) {
            int product_id = Integer.parseInt(request.getParameter("product_id"));

            //セッション変数よりカートを取得
            HttpSession session = request.getSession();
            cartMap = (Map<Integer, Integer>) session.getAttribute(SESSION_CART_MAP);
            if (cartMap == null) {
                cartMap = new LinkedHashMap<Integer, Integer>(); //LinkedHashMap k=vを入れた順番に並ぶ
            }

            //カートの商品を削除する
            cartMap.remove(product_id);
            session.setAttribute(SESSION_CART_MAP, cartMap);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "数値を入力して下さい");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC のエラーです : " + e.getMessage());
        }

        return "Cart.Control";
    }

}
