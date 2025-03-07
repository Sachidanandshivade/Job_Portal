<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.entity.User" %>

<%@ page isELIgnored="false" %>


<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#">JOBS</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="add_job.jsp"><i class="fa-solid fa-suitcase mx-2"></i>Post Job</a>
       </li>
     <li class="nav-item"><a class="nav-link" href="view_job.jsp"><i class="fa-solid fa-binoculars mx-2"></i>View Job</a></li>
    </ul>
<form class="form-inline my-2 my-lg-0">
    <%
        User user = (User) session.getAttribute("userobj");
        if (user != null) {
            if ("admin".equalsIgnoreCase(user.getRole())) {
    %>
                <a href="#" class="btn btn-light mx-2"><i class="fa-solid fa-right-to-bracket"></i> Admin</a>
    <%
            } else if ("user".equalsIgnoreCase(user.getRole())) {
    %>
                <a href="#" class="btn btn-light mx-2"><i class="fa-solid fa-right-to-bracket"></i> <%= user.getName() %></a>
    <%
            }
    %>


    <%
        } else {
    %>
            <a href="login.jsp" class="btn btn-light mx-2"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
            <a href="sign.jsp" class="btn btn-light"><i class="fa-solid fa-user"></i> Sign-up</a>
    <%
        }
    %>
 
</form>
<form action="${pageContext.request.contextPath}/logoutServlet" method="get">
    <button type="submit" class="btn btn-danger">Logout</button>
</form>


  </div>
</nav>
</body>
</html>