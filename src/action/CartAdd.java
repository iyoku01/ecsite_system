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

    private Map<Integer, Integer> cartMap; //�J�[�g���̏��i<���iID, ��>

    @SuppressWarnings("unchecked")
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("Windows-31J");

        try (EcsiteDao dao = new EcsiteDao()) {
            int product_id = Integer.parseInt(request.getParameter("product_id"));
            int buy_count = Integer.parseInt(request.getParameter("buy_count"));

            //�Z�b�V�����ϐ����J�[�g���擾
            HttpSession session = request.getSession();
            cartMap = (Map<Integer, Integer>) session.getAttribute(SESSION_CART_MAP);
            if (cartMap == null) {
                cartMap = new LinkedHashMap<Integer, Integer>(); //LinkedHashMap k=v����ꂽ���Ԃɕ���
            }

            //�J�[�g�ɏ��i��ǉ�����
            addCart(product_id, buy_count);
            session.setAttribute(SESSION_CART_MAP, cartMap);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "���l����͂��ĉ�����");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC �̃G���[�ł� : " + e.getMessage());
        }

        return "CartControl";
    }

    /***
     * �J�[�g�ɏ��i��ǉ�����
     * �����ꏤ�iID�̌��͍��Z�����
     * @param productId ���iID
     * @param num ���i��
     */
    private void addCart(int productId, int num) {
        if (cartMap.containsKey(productId)) {
            num += cartMap.get(productId);
        }
        cartMap.put(productId, num);
    }

}
