<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta charset="utf-8">
      <title>Add Student Home Info</title>
      <meta name="keywords" content="GlobalWebsite" />
      <meta name="description" content="GlobalWebsite">
      <meta name="author" content="GlobalWebsite">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <%@include file="/jsp/admin/adminHeaderLinks.jsp" %>
	   
   </head>
   <body class="dashboard-page">
      <%@include file="/jsp/admin/adminThemeChange.jsp" %>
      <%@include file="/jsp/admin/adminTopMenu.jsp" %>
      <%@include file="/jsp/admin/adminLeftMenu.jsp" %>
      <!-- Start: Content-Wrapper -->
      <section id="content_wrapper">
         <form:form method="post" action="adminaddstudenthomeinfo" modelAttribute="adminaddstuinfo"  enctype="multipart/form-data">
            <div class="col-md-12">
               <div class="page-header">
                  <h4>Student Home Info</h4>
               </div>
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <div class="panel with-nav-tabs">
                           <div class="panel-heading">
                              <ul class="nav panel-tabs-border panel-tabs panel-tabs-left">
                                 <li class="active">
                                    <a href="#">Add</a>
                                 </li>
                                 <li >
                                    <a href="load-adminupdatestuinfo">Edit</a>
                                 </li>
                                 <li>
                                    <a href="load-admindeletestuinfo">Delete</a>
                                 </li>
                              </ul>
                           </div>
                           <div class="panel-body">
                              <div class="tab-content">
                                 <c:if test="${smsg!=null && smsg!=''}">
                                    <div class="alert alert-success alert-dismissable">
                                       <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                       <i class="fa fa-check pr10"></i>
                                       <strong>Well done!</strong>${smsg}
                                    </div>
                                 </c:if>
                                 <c:if test="${emsg!=null && emsg!=''}">
                                    <div class="alert alert-danger alert-dismissable">
                                       <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                       <i class="fa fa-remove pr10"></i>
                                       <strong>Sorry!</strong> ${emsg}
                                    </div>
                                 </c:if>
                                 
       
               
						<div class="col-sm-12">
						<div class="form-group">
                            <label for="tablename">Select Page to Add<span class="text-danger">*</span></label>
                            <form:select path="tablename" class="select2-single form-control"  >
                             <form:option value="0" >Select Page to Add Info </form:option>
                             <form:options items="${tablelist}" />
                             </form:select>
                         
                        </div>
                        </div>
						<div class="col-sm-6">
						<div class="form-group">
                            <label for="linkname">Link Name<span class="text-danger">*</span></label>
                            <form:input type="text" path="linkname"  placeholder="Enter Link name" class="form-control"/>
                        </div>
                        </div>
						<div class="col-sm-6">
						<div class="form-group">
                            <label for="siteurl">Site URL<span class="text-danger">*</span></label>
                            <form:input type="text" path="linkaddress" placeholder="Enter sie URL" class="form-control"/>
                        </div>
                        </div>
						<div class="col-sm-6">
						<div class="form-group">
                            <label for="uploadimage">Upload Image<span class="text-danger">*</span> (Accepts only .jpg/jpeg/png)</label>
                            <input type="file" name="imagepath" class="form-control" accept=".png, .jpg, .jpeg">
                        </div>
                        </div>
						<div class="col-sm-6">
						<div class="form-group">
                            <label for="emailid">Email#<span class="text-danger">*</span></label>
                            <form:input type="text" path="emailid"  placeholder="Enter sie URL" class="form-control"/>
                        </div>
                        </div>
						<div class="col-sm-12">
						<div class="form-group">
                            <label for="emailid">Comments / Description<span class="text-danger">*</span></label>
                            <form:textarea path="comments" class="form-control"  placeholder="Please Enter Comments" rows="6"/>
                            <label for="comment" class="field-icon">
                              <i class="fa fa-comments"></i>
                            </label>
                            <span class="input-footer">
                              <strong>Hint:</strong>To Know Why Adding Link</span>
                        </div>
                        </div>
                    

                       <button type="submit">Submit</button>   
      
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </form:form>
      </section>
      <%@include file="/jsp/admin/adminBodyScriptLinks.jsp" %>
      <script type="text/javascript">
$(".select2-single").select2();
</script>
   </body>
</html>