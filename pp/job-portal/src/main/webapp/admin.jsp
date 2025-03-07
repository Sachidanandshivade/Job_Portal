

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    Object obj = session.getAttribute("userobj");

    if (obj == null || !("admin".equals(((com.entity.User) obj).getRole()))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Pannel</title>
<%@include file="all_components/all_css.jsp" %>
<style>
.back-img{
background:url("all_components/img/admin.jpg");
width:100%;
height:90vh;
background-repeat:no-repeat;
background-size:cover;
}</style>
</head>
<body>
<%@include file="all_components/navbar.jsp" %>
<div class="container-fluidd back-img">
<div class="text-center">
<h1 class="text-white p-4">Welcome </h1>
</div>
</div>
</body>
</html>