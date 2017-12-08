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
            request.setAttribute("product", dao.getProductDetail(product_id));
            request.setAttribute("productPicSub", dao.getProductSubPicList(product_id));
        } catch (NumberFormatException e) {
            request.setAttribute("message", "êîílÇì¸óÕÇµÇƒâ∫Ç≥Ç¢");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC ÇÃÉGÉâÅ[Ç≈Ç∑ : " + e.getMessage());
        }

        return "productDetail.jsp";
    }
}
