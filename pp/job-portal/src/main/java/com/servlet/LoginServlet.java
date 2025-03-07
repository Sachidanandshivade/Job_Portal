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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String em = req.getParameter("email");
            String ps = req.getParameter("password");

            HttpSession session = req.getSession(); // Get session

            System.out.println("Login Attempt: " + em); // Debugging

            if ("admin@gmail.com".equals(em) && "admin@121".equals(ps)) {
                User u = new User();
                u.setRole("admin");
                
                // Set session attribute
                session.setAttribute("userobj", u);

                System.out.println("Admin logged in. Session Set: " + session.getAttribute("userobj"));

                resp.sendRedirect("admin.jsp");
            } else {
                Userdao dao = new Userdao(DBConnect.getConn());
                User user = dao.login(em, ps);

                if (user != null) {
                    session.setAttribute("userobj", user);
                    System.out.println("User logged in. Session Set: " + session.getAttribute("userobj"));
                    resp.sendRedirect("home.jsp");
                } else {
                    session.setAttribute("succMsg", "Invalid email & password");
                    resp.sendRedirect("login.jsp");
                }
            }
            System.out.println("DEBUG: Session userobj set as: " + session.getAttribute("userobj"));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
