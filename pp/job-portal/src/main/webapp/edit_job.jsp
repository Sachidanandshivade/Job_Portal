\<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JOBDAO"%>
<%@page import=" com.entity.Jobs" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Job</title>
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


<%
String idParam = request.getParameter("id");

int id = 0; // Default value

if (idParam != null && !idParam.isEmpty()) {
    try {
        id = Integer.parseInt(idParam);
    } catch (NumberFormatException e) {
        out.println("<p style='color:red;'>Invalid job ID!</p>");
        return; // Stop further execution
    }
} else {
    out.println("<p style='color:red;'>Job ID is missing!</p>");
    return; // Stop further execution
}

JOBDAO dao = new JOBDAO(DBConnect.getConn());
Jobs j = dao.getJobById(id);

if (j == null) {
    out.println("<p style='color:red;'>Job not found!</p>");
    return;
}
%>





<h5>Edit Jobs</h5>
</div>

<form action="update" method="post" >
<input type="hidden" value="<%=j.getId() %>" name="id">

<div class="form-group">
<label>Enter title</label><input type="text"  name="title" required="required" class="form-control" value="<%=j.getTitle() %>"  >
</div>

<div class="form-row">
<div class="form-group col-mod-4">
<label>Location</label><select name="location"
  class="custom-select" id="inlineFormCustomSelectPref">
  <option value="<%=j.getLocation()%>"><%=j.getLocation()%></option>
  <option value="Karnataka">Karnataka</option>
    <option value="Maharashtra">Maharashtra</option>
    <option value="Andra Pradesh">Andra Pradesh</option>
    <option value="Kerala">Kerala</option>
    <option value="Tamil Nadu">Tamil Nadu</option>
  </select>
</div>

<div class="form-group col-mod-4">
<label>Category</label><select name="category"
  class="custom-select" id="inlineFormCustomSelectPref">
  <option value="<%=j.getCategory() %>"><%=j.getCategory() %></option>
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
 <option  class="Active" value="<%=j.getStatus()%>"><%=j.getStatus()%> </option>

 <option  class="Active" value="Active">Active</option>
 <option  class="InActive" value="InActive">InActive</option>
</select>
</div>
</div>
<div class="form-group">
<label>Enter Description</label>
<textarea required rows="6" cols="" name="desc" class="form-control" <%=j.getDescription() %> ></textarea>
</div>
<button class="btn btn-sm bg-succes">Update Job</button>
</form>
</div>

</div></div>
</div>

</body>
</html>