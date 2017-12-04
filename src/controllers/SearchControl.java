package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.TopSelect;

/**
 * Servlet implementation class SearchControl
 */
@WebServlet("/SearchControl")
public class SearchControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("Windows-31J");
        String dispatchUrl = null;
        try {
            Action ac = new TopSelect();
            dispatchUrl = ac.execute(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "å¥àˆïsñæÇÃÉGÉâÅ[Ç≈Ç∑");
            e.printStackTrace();
        }

        request.getRequestDispatcher(dispatchUrl).forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        // TODO Auto-generated method stub
    }

}
