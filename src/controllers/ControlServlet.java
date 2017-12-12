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
import action.CartSelect;
import action.Login;
import action.Logout;
import action.PersonalDataSelect;
import action.ProductDatailSelect;
import action.TopSelect;

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
        controllerMap.put("/CartDelete.Control", new Login());
        controllerMap.put("/Login.Control", new Login());
        controllerMap.put("/Logout.Control", new Logout());
        controllerMap.put("/MyPage.Control", new PersonalDataSelect());
        controllerMap.put("/ProductDetail.Control", new ProductDatailSelect());

        controllerMap.put("/PurchaseComp.Control", new CartAdd());
        controllerMap.put("/Purchase.Control", new CartAdd());

        controllerMap.put("/Top.Control", new TopSelect());

        //振分け
        Action ac = null;
        String dispatchUrl = "error.jsp";
        String servletPath = request.getServletPath();
        if (controllerMap.containsKey(servletPath)) {
            ac = controllerMap.get(servletPath);
            try {
                dispatchUrl = ac.execute(request, response);
            } catch (Exception e) {
                request.setAttribute("message", "原因不明のエラーです");
            }
        } else {
            request.setAttribute("message", "指定したサーブレットが見つかりません = " + servletPath);
        }
        request.getRequestDispatcher(dispatchUrl).forward(request, response);
    }
}
