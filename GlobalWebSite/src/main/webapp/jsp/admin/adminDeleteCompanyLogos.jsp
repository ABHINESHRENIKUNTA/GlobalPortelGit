<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>Admin Delete Company Logos</title>
  <meta name="keywords" content="GlobalWebsite" />
  <meta name="description" content="GlobalWebsite">
  <meta name="author" content="GlobalWebsite">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
<%@include file="adminHeaderLinks.jsp" %>
</head>
<body class="dashboard-page">
<%@include file="adminThemeChange.jsp" %>
<%@include file="adminTopMenu.jsp" %>
<%@include file="adminLeftMenu.jsp" %>



<!-- Start: Content-Wrapper -->
<section id="content_wrapper">
<form:form method="post" action="admindelete-companyLogos" modelAttribute="companyLogos">
<div class="col-md-12">
           
              <div class="panel">
                <div class="panel-heading">
                  <ul class="nav panel-tabs-border panel-tabs panel-tabs-left">
                    <li >
                      <a href="view-companylogopage" >Add</a>
                    </li >
                    <li class="active">
                      <a href="delete-companylogopage">Delete</a>
                    </li>
                  </ul>
                </div>
                <div class="panel-body">
                  <div class="tab-content pn br-n">
                    <div id="tab2_1" class="tab-pane active">
                      <div class="row">
                        <div class="col-md-12">
                             <div class="admin-form">
                       <div class="admin-form theme-primary">

              <div class="panel heading-border panel-primary">
                <div class="panel-body bg-light">
                    <c:if test="${smsg!=null && smsg!=''}">
                   
	              <div class="alert alert-success alert-dismissable">
	                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">�</button>
	                <i class="fa fa-check pr10"></i>
	                <strong>Well done!</strong>${smsg}
	               
	              </div>
	           
                    </c:if>
                     <c:if test="${emsg!=null && emsg!=''}">
                    
		              <div class="alert alert-danger alert-dismissable">
		                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">�</button>
		                <i class="fa fa-remove pr10"></i>
		                <strong>Oh snap!</strong> ${emsg}
		              </div>
		           
                    </c:if>
               		 <div class="col-md-12">
             
                <div class="panel-body pn">
                  <table class="table table-striped table-hover" id="example" cellspacing="0" width="100%">
                    <thead>
                      <tr>
                       	<th>File Name</th>
                        <th>Title</th>
                        <th>Link</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${admdata}" var="admdata">
                      <tr>
                        <td>${admdata.filename}</td>
                        <td>${admdata.title}</td>
                        <td>${admdata.linkname}</td>
                        <td><button class="btn btn-danger" name="admid" value="${admdata.filename}_${admdata.imageid}">Delete</button></td>
                       
                      </tr>
                      </c:forEach>
                     </tbody>
                    </table>
                    </div>
                  
                   </div>
               </div>
            </div>
            </div>
                        </div>
                       
                      </div>
                    </div>
                 
                  </div>
                </div>
              </div>
            </div>
	</div>
         
           </form:form>
</section>

  <%@include file="/jsp/admin/adminBodyScriptLinks.jsp"%>
    <%@include file="/jsp/admin/adminDataTableJsLink.jsp"%>

</body>
</html>