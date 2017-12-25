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
            //���i�̏ڍ׏��̎擾�E���N�G�X�g�ϐ��ɓo�^
            request.setAttribute("product", dao.getProductDetail(product_id));
            //���i�̉摜���擾�E�o�^
            request.setAttribute("productPicSub", dao.getProductSubPicList(product_id));
        } catch (NumberFormatException e) {
            request.setAttribute("message", "���l����͂��ĉ�����");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC �̃G���[�ł� : " + e.getMessage());
        }

        return "productDetail.jsp";
    }
}
