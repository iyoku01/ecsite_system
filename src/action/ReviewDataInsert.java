package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EcsiteDao;

public class ReviewDataInsert implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");
        try (EcsiteDao dao = new EcsiteDao()) {

            HttpSession session = request.getSession();
            String user_id = (String) session.getAttribute("user_id");

            String product_id = request.getParameter("product_id");
            String nickname = request.getParameter("nickname");
            String evaluation = request.getParameter("evaluation");
            String review = request.getParameter("review");

            //レビュー更新時
            if (request.getParameter("update") != null) {
                dao.updateReview(product_id, user_id, nickname, evaluation, review);
                //レビュー登録時
            } else {
                dao.insertReview(product_id, user_id, nickname, evaluation, review);
            }
            //レビューされた商品のレビュー数と評価平均の更新
            dao.updateEvaluation(product_id);
            dao.updateReviewCount(product_id);
            request.setAttribute("product_id", product_id);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "ReviewSelect.Control";
    }
}
