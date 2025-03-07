package com.servlet;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.JOBDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class deletejobServlet extends HttpServlet {

	 private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			JOBDAO dao=new JOBDAO(DBConnect.getConn());
		   boolean f = dao.deleteJob(id);
		   
		   HttpSession session=req.getSession();
		   
		   if(f) {
		 	      session.setAttribute("succMsg","Job Deleted Successfully..");
		 	      resp.sendRedirect("view_job.jsp");
		   }else {
		 	  session.setAttribute("succMsg","Something went wrong");
		 	  resp.sendRedirect("view_job.jsp");
		   }
		   
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		

	
}
}
