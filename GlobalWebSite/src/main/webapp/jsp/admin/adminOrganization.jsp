<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <title>Organization</title>
    <meta path="keywords" content="GlobalWebsite" />
    <meta path="description" content="GlobalWebsite">
    <meta path="author" content="GlobalWebsite">
    <meta path="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/jsp/admin/adminHeaderLinks.jsp"%>
    <link href="${pageContext.request.contextPath}/theme/vendor/plugins/daterange/daterangepicker.css" rel="stylesheet" type="text/css" />
  
  </head>
  <body class="dashboard-page">
    <%@include file="/jsp/admin/adminThemeChange.jsp"%>
    <%@include file="/jsp/admin/adminTopMenu.jsp"%>
    <%@include file="/jsp/admin/adminLeftMenu.jsp"%>
    <!-- Start: Content-Wrapper -->
<section id="content_wrapper" style="background-color:gray">
<div class="container">
  <div class = "panel panel-default">
   <div class = "panel-heading">
      <span style="text-transform: capitalize;">${typeofPage}</span> Organization
       <span class="pull-right" style="padding-top: 10px">
		<button type="button" class="btn btn-primary" onclick="location.href='adminvieworg'" >
		<span class="glyphicon glyphicon-backward"></span>  
		Back To List</button></span>
			               
   </div>
  
<div class = "panel-body">
<div class="tab-content">
<form:form action="${actiontype}" commandName="orginfo" autocomplete="off">
	<form:hidden path="orgid"/>
	<div class="col-sm-12">
         <div class="form-group">
            <label class="col-sm-12 control-label text-left">Organization Name</label>
            <div class="col-sm-12 inputGroupContainer">
               <div class="input-group"><span class="input-group-addon"><i class="fa fa-institution"></i></span>
               <form:input  path="orgname" placeholder="Organization Name" class="form-control" required="true" type="text" autocomplete="false" maxlength="499"/></div>
            </div>
         </div>
         <div class="col-sm-12"> &nbsp;
  </div>  
	</div>
	<div class="col-sm-12">
       <div class="form-group">
                        <label for="happy" class="col-sm-5 col-md-5 control-label text-right">Enable / Disable?</label>
                        <div class="col-sm-6 col-md-6">
                          <div class="input-group">
                            <div id="" class="btn-group">
                            <label><form:radiobutton path="isactive" value="true"/>Enabled</label>
                             <label><form:radiobutton path="isactive" value="false"/>Disabled</label>
                            </div>
                          </div>
                        </div>
                      </div>
         <div class="col-sm-12"> &nbsp;
  </div>  
	</div>

<div class="col-sm-12">
   <div class="col-sm-6" align="left">
      <button type="reset" class="btn btn-danger">Clear</button>   
   </div>
   <div class="col-sm-6" align="right">

      <button type="submit" class="btn btn-success submitdata">Submit</button>   
   </div>
</div>

  </form:form>
</div>
</div>
</div>
</div>             


</section>

 <%@include file="/jsp/admin/adminBodyScriptLinks.jsp" %>

</body>
</html>