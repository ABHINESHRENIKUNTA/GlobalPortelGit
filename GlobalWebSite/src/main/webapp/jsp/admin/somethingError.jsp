<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>Access Denied</title>
  <meta name="keywords" content="Cricket" />
  <meta name="description" content="Cricket">
  <meta name="author" content="cricket">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@include file="adminHeaderLinks.jsp" %>

</head>
<body class="dashboard-page">
<%@include file="adminThemeChange.jsp" %>
<%@include file="adminTopMenu.jsp" %>
<%@include file="adminLeftMenu.jsp" %>

<!-- Start: Content-Wrapper -->
<section id="content_wrapper">

 <!-- PAGE CONTENT -->
 <div class="page-title">                    
<!-- START BREADCRUMB -->
<!-- END BREADCRUMB -->

<!-- PAGE CONTENT WRAPPER -->
<div class="page-content-wrap">

    <div class="row">
        <div class="col-md-12">
         <div class="panel with-nav-tabs">
         <div class="panel-heading"> Error
         </div>
             <div class="panel-body">
              Something went wrong. Please contact support team or navigate to other page. 
            </div>
            </div>
          </div>
       </div>
   </div>
   <!-- END PAGE CONTENT WRAPPER -->
 </div>
 <!-- END PAGE CONTENT -->   
</section>
<%@include file="adminBodyScriptLinks.jsp" %>


</body>
</html>