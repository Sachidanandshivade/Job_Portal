<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JOBDAO"%>
<%@page import="com.entity.Jobs" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>USER: Home</title>
<%@include file="all_components/all_css.jsp" %>
</head>
<body>
<%@include file="all_components/navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h5 class="text-center text-primary">All Jobs</h5>
            <div class="card">
                <div class="card-body">
                    <form class="form-inline" action="more_view.jsp" method="get">
                        <div class="col-md-2 mt-1">
                            <h5>Location</h5>
                            <h5>Category</h5>
                        </div>

                        <div class="row">
                            <div class="z">
                                <select name="loc" class="form-control" id="locationSelect">
                                   
                                    <option value="Karnataka">Karnataka</option>
                                    <option value="Maharashtra">Maharashtra</option>
                                    <option value="Andra Pradesh">Andra Pradesh</option>
                                    <option value="Kerala">Kerala</option>
                                    <option value="Tamil Nadu">Tamil Nadu</option>
                                </select>
                                <br>
                                <select name="cat" class="form-control" id="categorySelect">
                                    
                                    <option value="IT">IT</option>
                                    <option value="Developer">Developer</option>
                                    <option value="Banking">Banking</option>
                                    <option value="Engineer">Engineer</option>
                                    <option value="Teacher">Teacher</option>
                                </select>
                            </div>
                        </div>

                        <div class="text-center mt-5">
                            <button class="btn btn-success">Submit</button>
                        </div>
                    </form>
                </div>
            </div>

            <% 
            JOBDAO dao = new JOBDAO(DBConnect.getConn());
            List<Jobs> list = dao.getAllJobsForUser();
            for (Jobs j : list) { 
            %>
            <div class="card mt-2">
                <div class="card-body">
                    <div class="text-center text-primary">
                        <i class="far fa-clipboard fa-2x"></i>
                    </div>
                    <h6><%= j.getTitle() %></h6>

                    <% 
                    if (j.getDescription() != null && j.getDescription().length() > 0 && j.getDescription().length() < 120) {
                    %>
                        <p><%= j.getDescription() %></p>
                    <% } else { %>
                        <p><%= j.getDescription().substring(0, 120) %>...</p>
                    <% } %>

                    <br>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly>
                        </div>
                        <div class="form-group col-md-3">
                            <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory() %>" readonly>
                        </div>
                    </div>

                    <h6>
                        Publish Date:
                        <%= (j.getPdate() != null) ? j.getPdate().toString() : "No Date Available" %>
                    </h6>

                    <div class="text-center">
                        <a href="one_view.jsp?id=<%=j.getId() %>" class="btn btn-sm bg-success text-white">View more</a>
                    </div>
                </div>
            </div>
            <% } %>

        </div>
    </div>
</div>

</body>
</html>
