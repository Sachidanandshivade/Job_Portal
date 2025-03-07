package com.servlet;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.JOBDAO;
import com.entity.Jobs;
import com.entity.User;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/add_job")
public class AddPostServlet extends HttpServlet {

	 private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("userobj");

			if (user == null) {
			    session.setAttribute("errorMsg", "Please login to post a job.");
			    resp.sendRedirect("login.jsp");
			    return;
			}
			String title=req.getParameter("title");
			String description=req.getParameter("desc");
			String location=req.getParameter("location");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			


			
			Jobs j = new Jobs(title, description, category, status, location, user.getEmail()); 

			JOBDAO dao = new JOBDAO(DBConnect.getConn());
			boolean f = dao.addJobs(j);

			if (f) {
			    session.setAttribute("succMsg", "Job posted successfully!");
			    resp.sendRedirect("add_job.jsp");
			} else {
			    session.setAttribute("errorMsg", "Something went wrong!");
			    resp.sendRedirect("add_job.jsp");
			}

  

		}catch (Exception e){
			e.printStackTrace();
		}
	}

	
}
