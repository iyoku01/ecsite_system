package action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EcsiteDao;
import database.CartDto;
import database.ProductDetailDto;

public class CartSelect implements Action {

    private Map<Integer, Integer> cartMap; //�J�[�g���̏��i<���iID, ��>

    @SuppressWarnings("unchecked")
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");

        try (EcsiteDao dao = new EcsiteDao()) {
            ArrayList<CartDto> cartList = new ArrayList<CartDto>();
            int sumBuy_count = 0; //���v���i��
            int sumPrice = 0; //���v���i���z

            //�Z�b�V�����ϐ����J�[�g���擾
            HttpSession session = request.getSession();
            cartMap = (Map<Integer, Integer>) session.getAttribute("cartMap");
            if (cartMap == null) {
                cartMap = new LinkedHashMap<Integer, Integer>(); //LinkedHashMap k=v����ꂽ���Ԃɕ���
            }

            //�J�[�g���̏��i�����擾
            for (Map.Entry<Integer, Integer> e : cartMap.entrySet()) {
                CartDto cart = new CartDto();
                ProductDetailDto product = dao.getProductDetail(e.getKey().toString());
                cart.setBuy_count(e.getValue());
                cart.setProduct_id(product.getProduct_id());
                cart.setProduct_name(product.getProduct_name());
                cart.setPrice(product.getPrice());
                cart.setMainPic_file(product.getMainPic_file());
                cartList.add(cart);
                sumBuy_count++;
                sumPrice += cart.getPrice();
            }
            request.setAttribute("cartList", cartList);
            request.setAttribute("sumBuy_count", new Integer(sumBuy_count));
            request.setAttribute("sumPrice", new Integer(sumPrice));

        } catch (NumberFormatException e) {
            request.setAttribute("message", "���l����͂��ĉ�����");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC �̃G���[�ł� : " + e.getMessage());
        }

        return "cartMap.jsp";
    }
}
