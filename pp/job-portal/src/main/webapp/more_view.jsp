<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JOBDAO"%>
<%@page import="com.entity.Jobs" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>More View</title>
<%@include file="all_components/all_css.jsp" %>
</head>
<body>
 <% 
                        String succMsg = (String) session.getAttribute("succMsg");
                        if (succMsg != null) { 
                    %>
                        <h4 class="text-center text-danger"><%= succMsg %></h4>
                    <% 
                        session.removeAttribute("succMsg"); // Remove message after displaying
                        }
                    %>
<%@include file="all_components/navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h5 class="text-center text-primary">All Jobs</h5>
            <%
            String loc = request.getParameter("loc");
            String cat = request.getParameter("cat");
            String msg = "" ;

            JOBDAO dao = new JOBDAO(DBConnect.getConn());
            List<Jobs> list = null;

            if ("lo".equals(loc) && "ca".equals(cat)) {
                list = new ArrayList<Jobs>();
                msg = "Job Not Available";
            } else if ("lo".equals(loc) || "ca".equals(cat)) {
                list = dao.getJobsByCategoryOrLocation(cat, loc);
            } else {
                list = dao.getJobsByCategoryAndLocation(cat, loc);
            }

            if (list.isEmpty()) {
            %>
                <h4 class="text-center text-danger">Job Not Available</h4>
            <%
            } else {
                for (Jobs j : list) { 
            %>
                <div class="card mt-5">
                    <div class="card-body">
                        <div class="text-center text-primary">
                            <i class="far fa-clipboard fa-2x"></i>
                        </div>
                        <h6><%= j.getTitle() %></h6>
                        <p><%= j.getDescription() %></p>
                        <br>
                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly required>
                            </div>
                            <div class="form-group col-md-3">
                                <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory() %>" readonly required>
                            </div>
                        </div>
                    </div>
                    <h6>Publish Date: <%= j.getPdate().toString() %></h6>
                    <div class="text-center">
                        <a href="one_view.jsp?id=<%= j.getId() %>" class="btn btn-sm bg-success text-white">View More</a>
                    </div>
                </div>
            <%
                } 
            } 
            %>
        </div>
    </div>
</div>
</body>
</html>
