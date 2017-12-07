package action;

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

    public String execute(HttpServletRequest request, HttpServletResponse response) {

        try (EcsiteDao dao = new EcsiteDao()) {

            String hard_id = request.getParameter("hard");
            String category_id = request.getParameter("category");
            String search = request.getParameter("search");

            //�J�e�S���[
            ArrayList<Category_tblVo> categoryList;
            categoryList = dao.getCategoryList();
            request.setAttribute("categoryList", categoryList);
            //�n�[�h
            ArrayList<Hard_tblVo> hardList;
            hardList = dao.getHardList(null);
            request.setAttribute("hardList", hardList);
            //�������ߏ��i
            ArrayList<Recommend_tblVo> recommendList;
            recommendList = dao.getRecommendList();
            request.setAttribute("recommendList", recommendList);
            //���i�ꗗ
            ArrayList<ListTop> topList;
            topList = dao.getProductList(hard_id, category_id, search);
            if (topList.get(0).getTpd() != null) {
                request.setAttribute("productList", topList);
            } else {
                request.setAttribute("topMessage", "�Y���̏��i������܂���");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "���l����͂��ĉ�����");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC �̃G���[�ł� : " + e.getMessage());
        }

        return "/top.jsp";
    }
}
