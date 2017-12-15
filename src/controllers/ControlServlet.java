package controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.CartAdd;
import action.CartDelete;
import action.CartSelect;
import action.Login;
import action.Logout;
import action.OrderHistorySelect;
import action.PersonalDataInsert;
import action.PersonalDataSelect;
import action.PersonalIdCheck;
import action.ProductBuySelect;
import action.ProductDatailSelect;
import action.ReviewDataInsert;
import action.ReviewDataSelect;
import action.TopSelect;
import exception.NotFoundServletException;

//@WebServlet("/ControlServlet")
@WebServlet(urlPatterns = { "*.Control" })
public class ControlServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        System.out.println("\n/// ControlServlet # doGet()");
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        request.setCharacterEncoding("Windows-31J");

        System.out.println("\n/// ControlServlet # doPost()");
        System.out.println("getServletPath = " + request.getServletPath());
        System.out.println("getQueryString = " + request.getQueryString());

        //振分け先のクラス登録
        Map<String, Action> controllerMap = new HashMap<String, Action>();

        controllerMap.put("/Cart.Control", new CartSelect());
        controllerMap.put("/CartAdd.Control", new CartAdd());
        controllerMap.put("/CartDelete.Control", new CartDelete());
        controllerMap.put("/Login.Control", new Login());
        controllerMap.put("/Logout.Control", new Logout());
        controllerMap.put("/MyPage.Control", new PersonalDataSelect());
        controllerMap.put("/ProductDetail.Control", new ProductDatailSelect());
        controllerMap.put("/CheckId.Control", new PersonalIdCheck());
        controllerMap.put("/Regist.Control", new PersonalDataInsert());
        controllerMap.put("/OrderHistory.Control", new OrderHistorySelect());
        controllerMap.put("/ReviewSelect.Control", new ReviewDataSelect());
        controllerMap.put("/ReviewWrite.Control", new ReviewDataInsert());

        controllerMap.put("/productBuyConf.Control", new ProductBuySelect());
        controllerMap.put("/Purchase.Control", new CartAdd());

        controllerMap.put("/Top.Control", new TopSelect());

        //振分け
        Action action = null;
        String dispatchUrl = "error.jsp";
        String servletPath = request.getServletPath();
        try {
            if (controllerMap.containsKey(servletPath)) {
                action = controllerMap.get(servletPath);
            } else {
                throw new NotFoundServletException(servletPath);
            }
            dispatchUrl = action.execute(request, response);
        } catch (NotFoundServletException e) {
            request.setAttribute("message", "指定したサーブレットが見つかりません = " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "原因不明のエラーです");
        }
        request.getRequestDispatcher(dispatchUrl).forward(request, response);
    }
}
