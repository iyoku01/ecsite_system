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

            //���i�̏ڍ׏����擾
            request.setAttribute("product", dao.getProductDetail(product_id));

            //�w���������i���ǂ�������
            writeReview = dao.checkWriteReview(user_id, product_id);

            //���r���[�����Ă���Ύ擾
            Review_tblVo review = dao.getReview(product_id, user_id);

            //���r���[�̃��X�g���擾
            reviewList = dao.getReviewList(product_id);

            String nickname = dao.getNickname(user_id);

            if (nickname != null) {
                request.setAttribute("nickname", nickname);
            }
            if (reviewList.isEmpty()) {
                request.setAttribute("message", "���i�̃��r���[�͂���܂���");
            } else {
                request.setAttribute("reviewList", reviewList);
            }
            //���i���w�����Ă���΃��N�G�X�g�ϐ�writeReview���Z�b�g
            if (writeReview) {
                request.setAttribute("writeReview", "true");
            }
            if (review != null) {
                request.setAttribute("review", review);
            }

            request.setAttribute("product_id", product_id);

        } catch (NumberFormatException e) {
            request.setAttribute("message", "���l����͂��ĉ�����");
        } catch (SQLException e) {
            request.setAttribute("message", "JDBC �̃G���[�ł� : " + e.getMessage());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return "/review.jsp";
    }

}
