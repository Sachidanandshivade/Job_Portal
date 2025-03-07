<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JOBDAO"%>
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>

<%
    // Session validation
    User loggedInUser = (User) session.getAttribute("userobj");




    if (loggedInUser == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if no session found
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Job</title>
    <%@include file="all_components/all_css.jsp" %>
</head>
<body>
    <%@include file="all_components/navbar.jsp" %>
    <div class="container" style="border:2px solid black; margin:20px; padding:20px;">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center text-primary">ALL JOBS</h5>
<h4>DEBUG: Logged in as <%= (loggedInUser != null) ? loggedInUser.getEmail() : "NULL" %></h4>
                <% 
                    String succMsg = (String) session.getAttribute("succMsg");
                    if (succMsg != null) { 
                %>
                    <h4 class="text-center text-danger"><%= succMsg %></h4>
                <% 
                    session.removeAttribute("succMsg"); // Remove message after displaying
                    }
                %>

                <% 
                    JOBDAO dao = new JOBDAO(DBConnect.getConn());
                    List<Jobs> list = dao.getJobsByUserEmail(loggedInUser.getEmail());
                    for (Jobs j : list) {
                %>
                    <div class="card mt-2">
                        <div class="card-body">
                            <div class="text-center text-primary">
                                <i class="far fa-clipboard fa-2x"></i>
                            </div>
                            <h6><%= j.getTitle() %></h6>
                            <p><%= j.getDescription() %></p>
                            <br>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly>
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory() %>" readonly>
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Status: <%= j.getStatus() %>" readonly>
                                </div>
                            </div>
                            <h6> <%= j.getPdate() %> </h6>
                            <div class="text-center">
                                <a href="edit_job.jsp?id=<%= j.getId() %>" class="btn btn-sm bg-success text-white">Edit</a>
                                <form action="delete" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= j.getId() %>">
                                    <button type="submit" class="btn btn-sm bg-danger text-white">Delete</button>
                                </form>
                            </div>
                        </div> 
                    </div>
                <% } %> 
            </div>
        </div>
    </div>
</body>
</html>
