package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EcsiteDao;

public class ProductDatailSelect implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");
        String product_id = request.getParameter("product_id");

        try (EcsiteDao dao = new EcsiteDao()) {
            //商品の詳細情報の取得・リクエスト変数に登録
            request.setAttribute("product", dao.getProductDetail(product_id));
            //商品の画像も取得・登録
            request.setAttribute("productPicSub", dao.getProductSubPicList(product_id));
        } catch (NumberFormatException e) {
            request.setAttribute("message", "数値を入力して下さい");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC のエラーです : " + e.getMessage());
        }

        return "productDetail.jsp";
    }
}
