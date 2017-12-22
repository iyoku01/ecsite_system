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

            //商品の詳細情報を取得
            request.setAttribute("product", dao.getProductDetail(product_id));

            //購入した商品かどうか判定
            writeReview = dao.checkWriteReview(user_id, product_id);

            //レビューをしていれば取得
            Review_tblVo review = dao.getReview(product_id, user_id);

            //レビューのリストを取得
            reviewList = dao.getReviewList(product_id);

            String nickname = dao.getNickname(user_id);

            if (nickname != null) {
                request.setAttribute("nickname", nickname);
            }
            if (reviewList.isEmpty()) {
                request.setAttribute("message", "商品のレビューはありません");
            } else {
                request.setAttribute("reviewList", reviewList);
            }
            //商品を購入していればリクエスト変数writeReviewをセット
            if (writeReview) {
                request.setAttribute("writeReview", "true");
            }
            if (review != null) {
                request.setAttribute("review", review);
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
