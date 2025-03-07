<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Portal</title>
<%@include file="all_components/all_css.jsp" %>
<style>
.back-img{
background:url("all_components/img/jj.jpg");
width:100%;
height:90vh;
background-repeat:no-repeat;
background-size:cover;
}</style>
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
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
       
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <a href="login.jsp" class="btn btn-light mx-2"><i class="fa-solid fa-right-to-bracket"></i>Login</a>
      
            <a href="sign.jsp" class="btn btn-light"><i class="fa-solid fa-user"></i>Sign-up</a>
      
    </form>
  </div>
</nav>


	<div class="container-fluid back-img">
	<div class="text-center">
	<h1 class="text-white p-4"><i class="fa-solid fa-globe"></i>
	 Online Job Portal</h1></div></div>
	<%@include file="all_components/footer.jsp" %>
</body>
</html>																																																										