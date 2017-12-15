package action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EcsiteDao;
import database.Review_tblVo;

public class ReviewDataSelect implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        boolean writeReview = false;
        ArrayList<Review_tblVo> reviewList;
        try (EcsiteDao dao = new EcsiteDao()) {

            HttpSession session = request.getSession();
            String user_id = (String) session.getAttribute("user_id");
            String product_id = request.getParameter("product_id");
            if (product_id == null) {
                product_id = request.getParameter(product_id);
            }
            writeReview = dao.checkWriteReview(user_id, product_id);

            reviewList = dao.getReviewList(product_id);
            if (reviewList.isEmpty()) {
                request.setAttribute("message", "商品のレビューはありません");
            } else {
                request.setAttribute("reviewList", reviewList);
            }
            //商品を購入していればリクエスト変数writeReviewをセット
            if (writeReview) {
                request.setAttribute("writeReview", "true");
            }
            request.setAttribute("product_id", product_id);

        } catch (NumberFormatException e) {
            request.setAttribute("message", "数値を入力して下さい");
        } catch (SQLException e) {
            request.setAttribute("message", "JDBC のエラーです : " + e.getMessage());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return "/review.jsp";
    }

}
