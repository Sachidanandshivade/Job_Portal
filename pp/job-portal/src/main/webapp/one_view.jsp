<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JOBDAO"%>
<%@page import="com.entity.Jobs" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Jobs</title>
<%@include file="all_components/all_css.jsp" %>
</head>
<body>
<%@include file="all_components/navbar.jsp" %>
 <% 
                        String succMsg = (String) session.getAttribute("succMsg");
                        if (succMsg != null) { 
                    %>
                        <h4 class="text-center text-danger"><%= succMsg %></h4>
                    <% 
                        session.removeAttribute("succMsg"); // Remove message after displaying
                        }
                    %>
<div class="container">
<div class="row">
<div class="col-md-12">
<%
int id=Integer.parseInt(request.getParameter("id"));
JOBDAO dao=new JOBDAO(DBConnect.getConn());
Jobs j=dao.getJobById(id);
%>
            <div class="card mt-5">
                <div class="card-body">
                <div class="text-center text-primary">
                <i class="far fa-clipboard fa-2x"></i>
                </div>
                <h6><%=j.getTitle() %></h6>
                <p><%=j.getDescription() %></p>
                <br>
		<div class="form-row">
		<div class="form-group col-md-3">
		<input type="text" class="form-control form-control-sm" value="Location: <%=j.getLocation() %>" readonly>		</div>
		</div>
		<div class="form-group col-md-3">
		<input type="text" class="form-control form-control-sm" value="Category: <%=j.getCategory() %>" readonly>		</div>
		</div>
</div>
<h6>
Publish Date:
                        <%= (j.getPdate() != null) ? j.getPdate().toString() : "No Date Available" %>

</h6>
</div>
</div>
</div>

</body>
</html>