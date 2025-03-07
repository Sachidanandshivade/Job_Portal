<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="all_components/all_css.jsp" %>
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
<div class="container-fluid">
<div class="row p-5">
<div class="col-md-4 offset-md-4">
<div class="card" style="border: 5px solid black; padding: 20px; border-radius: 10px">
<div class="card-body">
<div class="text-center">
<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
<h5>Login Page</h5>
</div>
 <%-- <c:if test="${not emoty succMsg}"> 
<h4 class="text-center text-danger">${succMsg }</h4>
<c:remove var="succMsg" />
</c:if>
--%>

<form action="login" method="post" >
<div class="form-group">
<label>Enter Email</label><input type="email" required="required" class="form-control" id="exampleInputEmail1
" aria-describedby="emailHelp" name="email">
</div>
<div class="form-group">
<label for="exampleInputPassword1">Enter password</label><input type="password" required="required" class="form-control" id="exampleInputPassword1" name="password"></div>
<button type="submit" class="btn btnn-primary badge-pill btn-block" style="border: 2px solid black;width:80px;display: block; margin: 0 auto; ">Login</button>
</form>
</div>

</div></div>
</div>
</div>
</body>

</html>