package action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EcsiteDao;
import database.Category_tblVo;

public class TopSelect implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try (EcsiteDao dao = new EcsiteDao()) {
            //カテゴリー
            ArrayList<Category_tblVo> entList;
            entList = dao.getCategoryList();
            request.setAttribute("categoryList", entList);

        } catch (NumberFormatException e) {
            request.setAttribute("message", "数値を入力して下さい");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC のエラーです : " + e.getMessage());
        }

        return "/top.jsp";
    }
}
