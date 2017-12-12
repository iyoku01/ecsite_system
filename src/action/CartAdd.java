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

public class CartAdd implements Action {

    private Map<Integer, Integer> cartMap; //カート内の商品<商品ID, 個数>

    @SuppressWarnings("unchecked")
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");

        try (EcsiteDao dao = new EcsiteDao()) {
            int product_id = Integer.parseInt(request.getParameter("product_id"));
            int buy_count = Integer.parseInt(request.getParameter("buy_count"));

            //セッション変数よりカートを取得
            HttpSession session = request.getSession();
            cartMap = (Map<Integer, Integer>) session.getAttribute(SESSION_CART_MAP);
            if (cartMap == null) {
                cartMap = new LinkedHashMap<Integer, Integer>(); //LinkedHashMap k=vを入れた順番に並ぶ
            }

            //カートに商品を追加する
            addCart(product_id, buy_count);
            session.setAttribute(SESSION_CART_MAP, cartMap);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "数値を入力して下さい");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC のエラーです : " + e.getMessage());
        }

        return "CartControl";
    }

    /***
     * カートに商品を追加する
     * ※同一商品IDの個数は合算される
     * @param productId 商品ID
     * @param num 商品数
     */
    private void addCart(int productId, int num) {
        if (cartMap.containsKey(productId)) {
            num += cartMap.get(productId);
        }
        cartMap.put(productId, num);
    }

}
