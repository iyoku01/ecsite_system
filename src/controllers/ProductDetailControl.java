package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ProductDatailSelect;

/***
 * ���i�ڍ�
 * @author �ɔ\
 *
 */
@WebServlet("/ProductDetailControl")
public class ProductDetailControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("Windows-31J");
        System.out.println("\n/// doGet");
        System.out.println("getServletPath = " + request.getServletPath());
        System.out.println("getQueryString = " + request.getQueryString());

        String dispatchUrl = null;
        try {
            Action ac = new ProductDatailSelect();
            dispatchUrl = ac.execute(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "�����s���̃G���[�ł�");
            e.printStackTrace();
        }

        request.getRequestDispatcher(dispatchUrl).forward(request, response);
    }

}
