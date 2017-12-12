package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.PersonalDataSelect;

/***
 * マイページ
 * @author 竹原
 *
 */
@WebServlet("/MyPageControl")
public class MyPageControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        request.setCharacterEncoding("Windows-31J");
        String dispatchUrl = null;
        try {
            Action ac = new PersonalDataSelect();
            dispatchUrl = ac.execute(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "原因不明のエラーです");
            e.printStackTrace();
        }
        request.getRequestDispatcher(dispatchUrl).forward(request, response);
    }

}
