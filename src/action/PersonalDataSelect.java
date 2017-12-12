package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EcsiteDao;
import database.Personal_mstVo;

public class PersonalDataSelect implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String destination = "/myPage.jsp";
        try (EcsiteDao dao = new EcsiteDao()) {

            //セッション変数user_idの有無を確認
            HttpSession session = request.getSession();
            String user_id = (String) session.getAttribute("user_id");

            if (user_id != null) {
                //存在していれば(ログインが済んでいれば)個人情報を取得
                Personal_mstVo personalData = dao.getPersonal(user_id);
                if (personalData != null) {
                    request.setAttribute("personalData", personalData);
                } else {
                    request.setAttribute("message", "原因不明のエラーです");
                }
            } else {
                //存在していなければログイン画面へ
                destination = "/login.jsp";
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "数値を入力して下さい");
        } catch (SQLException | ClassNotFoundException e) {
            request.setAttribute("message", "JDBC のエラーです : " + e.getMessage());
        }
        return destination;
    }
}
