package com.servlet;
import java.io.IOException;

import com.DB.DBConnect;
import com.dao.Userdao;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addUser")
public class RegisterServlet extends HttpServlet {  
    private static final long serialVersionUID = 1L;  

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("name");
            String qua = req.getParameter("qua");
            String email = req.getParameter("email");
            String ps = req.getParameter("ps");

            Userdao dao = new Userdao(DBConnect.getConn());
            User u = new User(name, email, ps,qua, "User");
            boolean f = dao.addUser(u);

            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("succMsg", "User registered successfully.");
                resp.sendRedirect("sign.jsp");
            } else {
                session.setAttribute("succMsg", "Something went wrong.");
                resp.sendRedirect("sign.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
