<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Job</title>
<%@include file="all_components/all_css.jsp" %>

</head>
<body>
<%@include file="all_components/navbar.jsp" %>

<div class="container p-2">

<div class="col-md-10 offset-md-1">
<div class="card" style="border: 5px solid black; padding: 20px; border-radius: 10px">
<div class="card-body">
<div class="text-center text-success">
<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
<h5>Add Jobs</h5>
</div>
 
   <% 
                        String succMsg = (String) session.getAttribute("succMsg");
   String errorMsg = (String) session.getAttribute("errorMsg");
                        if (succMsg != null) { 
                    %>
                        <h4 class="text-center text-danger"><%= succMsg %></h4>
                    <% 
                        session.removeAttribute("succMsg"); // Remove message after displaying
                        }
                        if (errorMsg != null) { 
                        	%>
                        	        <h4 class="text-center text-danger"><%= errorMsg %></h4>
                        	<% 
                        	        session.removeAttribute("errorMsg"); 
                        	    }
                    %>
 
 
 
 
 
 
 

<form action="add_job" method="post" >
<div class="form-group">
<label>Enter title</label><input type="text" required="required" class="form-control"  name="title">
</div>

<div class="form-row">
<div class="form-group col-mod-4">
<label>Location</label><select name="location"
  class="custom-select" id="inlineFormCustomSelectPref">
  <option value="Karnataka">Karnataka</option>
    <option value="Maharashtra">Maharashtra</option>
    <option value="Andra Pradesh">Andra Pradesh</option>
    <option value="Kerala">Kerala</option>
    <option value="Tamil Nadu">Tamil Nadu</option>
  </select>
</div>

<div class="form-group col-md-4">
<label>Category</label><select name="category"
  class="custom-select" id="inlineFormCustomSelectPref">
  <option selected>Choose...</option>
  <option value="IT">IT</option>
    <option value="Developer">Developer</option>
    <option value="Banking">Banking</option>
    <option value="Engineer">Engineer</option>
    <option value="Teacher">Teacher</option>
  </select>
</div>

<div class="form-group col-md-4">
<label>Status</label>
<select class="form-control"  name="status">
 <option  class="Active" value="Active">Active</option>
 <option  class="InActive" value="InActive">InActive</option>
</select>
</div>
</div>
<div class="form-group">
<label>Enter Description</label>
<textarea required rows="6" cols="" name="desc" class="form-control"></textarea>
</div>
<button class="btn btn-success">Publish Job</button>
</form>
</div>

</div></div>
</div>

</body>
</html>