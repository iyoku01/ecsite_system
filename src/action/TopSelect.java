package action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EcsiteDao;
import database.Category_tblVo;
import database.Hard_tblVo;
import database.ListTop;
import database.Recommend_tblVo;

public class TopSelect implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try (EcsiteDao dao = new EcsiteDao()) {

            String hard_id = request.getParameter("hard_id");
            String category_id = request.getParameter("category_id");
            String search = request.getParameter("search");

            //�J�e�S���[�̎擾
            ArrayList<Category_tblVo> categoryList;
            categoryList = dao.getCategoryList();
            request.setAttribute("categoryList", categoryList);

            //�n�[�h�̎擾
            ArrayList<Hard_tblVo> hardList;
            hardList = dao.getHardList(null);
            request.setAttribute("hardList", hardList);

            //�������ߏ��i�̎擾
            ArrayList<Recommend_tblVo> recommendList;
            recommendList = dao.getRecommendList();
            request.setAttribute("recommendList", recommendList);

            //�\�����鏤�i�ꗗ�̎擾
            ArrayList<ListTop> hardProductList = new ArrayList<ListTop>();
            for (Hard_tblVo hard : hardList) {
                ListTop hardProduct = new ListTop();
                hardProduct.setHard_id(hard.getHard_id());
                hardProduct.setHard_name(hard.getHard_name());
                if (hard_id == null && category_id == null && search == null) {
                    hardProduct.setPtd(dao.getProductListAll(hard.getHard_id()));
                } else if (search != null) {
                    hardProduct.setPtd(dao.getProductListByWord(hard.getHard_id(), search));
                } else {
                    hardProduct.setPtd(dao.getProductListById(hard.getHard_id(), hard_id, category_id));
                }
                if (!(hardProduct.getTpd().isEmpty())) {
                    hardProductList.add(hardProduct);
                }
            }
            if (hardProductList.isEmpty()) {
                request.setAttribute("message", "�Y���̏��i������܂���");
            } else {
                request.setAttribute("productList", hardProductList);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "���l����͂��ĉ�����");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC �̃G���[�ł� : " + e.getMessage());
        }

        return "/top.jsp";
    }
}
