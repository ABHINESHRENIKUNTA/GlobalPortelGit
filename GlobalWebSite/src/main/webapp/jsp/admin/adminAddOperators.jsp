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
    <title>View Operators</title>
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
      Add Operator
       <span class="pull-right" style="padding-top: 10px">
		<button type="button" class="btn btn-primary" onclick="location.href='view-operators'" >
		VIEW / EDIT</button></span>
			               
   </div>
   
<div class = "panel-body">
<div class="tab-content">
<form:form action="process-operatorinfo" commandName="addoperator" autocomplete="off">
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
     <label class="col-sm-12 control-label text-left">Assign Role</label>
     <div class="col-sm-12 inputGroupContainer">
        <div class="input-group">
           <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
            <form:select path="roleid" class="select2-single form-control"  style="max-width:100%">
               <form:option value="0" >Select Assign Role </form:option>
               <c:forEach items="${listallroles}" var="rolelist">
               <form:option value="${rolelist.roleid}">${rolelist.rolename}</form:option>
               </c:forEach>
            </form:select>
        </div>
     </div>
  </div>
  <div class="col-sm-6">
         <div class="form-group">
            <label class="col-sm-12 control-label text-left">User Name / Email</label>
            <div class="col-sm-12 inputGroupContainer">
               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
               <form:input  path="username" placeholder="Username" class="form-control" required="true" type="text" autocomplete="true" /></div>
            </div>
         </div>
</div>
<div class="col-sm-6">
         <div class="form-group">
            <label class="col-sm-12 control-label text-left">Password</label>
            <div class="col-sm-12 inputGroupContainer">
               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
               <form:input  path="password" placeholder="Password" class="form-control" required="true" type="text" autocomplete="true"/></div>
            </div>
         </div>
</div>

<div class="col-sm-6">
         <div class="form-group">
            <label class="col-sm-12 control-label text-left">Full Name</label>
            <div class="col-sm-12 inputGroupContainer">
               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
               <form:input  path="fullname" placeholder="Employee Full Name" class="form-control" required="true" type="text" autocomplete="true"/></div>
            </div>
         </div>
          <div class="form-group">
            <label class="col-sm-12 control-label text-left">Qualification</label>
            <div class="col-sm-12 inputGroupContainer">
               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
               <form:input  path="qualification" placeholder="Employee Qualification" class="form-control" required="true"  type="text"/></div>
            </div>
         </div>
        
         <div class="form-group">
            <label class="col-sm-12 control-label text-left">Employee DOB</label>
            <div class="col-sm-12 inputGroupContainer">
               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                <form:input type="text" path="empdob" placeholder="YYYY/MM/DD" class="form-control pull-right" id="reservation" readonly="readonly"/> </div>
            </div>
         </div>
         <div class="form-group">
            <label class="col-sm-12 control-label text-left">Email</label>
            <div class="col-sm-12 inputGroupContainer">
               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
               <form:input path="email" placeholder="Employee Email" class="form-control" required="true" type="text" readonly="true"/></div>
            </div>
         </div> 
         <div class="form-group">
            <label class="col-sm-12 control-label text-left">Phone Number</label>
            <div class="col-sm-12 inputGroupContainer">
               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
               <form:input path="phonenumber" placeholder="Employee Phone Number" class="form-control" required="true" type="text"/></div>
            </div>
         </div>
         
         
         <div class="form-group">
            <label class="col-sm-12 control-label text-left">Job Description</label>
            <div class="col-sm-12 inputGroupContainer">
               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
               <textarea path="jobdescription" placeholder="Job Description" class="form-control" required="true" rows="3"></textarea></div>
            </div>
         </div>
         <div class="form-group">
            <label class="col-sm-12 control-label text-left">Address</label>
            <div class="col-sm-12 inputGroupContainer">
               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
               <textarea path="address" placeholder="Employee Address" class="form-control" required="true" rows="3"></textarea></div>
            </div>
         </div>
         
   		<div class="col-sm-12 ">
         <div class="form-group">
  		    <label for="happy" class="col-sm-12 col-sm-12 control-label text-right">Active / In-Active?</label>
   			<div class="col-sm-12 col-sm-12 control-label text-right">
   				<div id="radioBtn" class="btn-group  text-right">
   					<a class="btn btn-primary btn-sm active" data-toggle="isactive" data-title="true">YES</a>
   					<a class="btn btn-primary btn-sm notActive" data-toggle="isactive" data-title="false">NO</a>
   				</div>
   				<form:hidden path="status" />
   			</div>
   		</div>
   	</div>
         
</div>

<div class="col-sm-6">
      <div class="form-group">
         <label class="col-sm-12 control-label text-left">Referrar Name</label>
         <div class="col-sm-12 inputGroupContainer">
            <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <form:input path="referrarname" placeholder="Referrar Name" class="form-control" type="text"/></div>
         </div>
      </div>
      <div class="form-group">
         <label class="col-sm-12 control-label text-left">Company Name</label>
         <div class="col-sm-12 inputGroupContainer">
            <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <form:input path="companyname" placeholder="Company Name" class="form-control"  type="text"/></div>
         </div>
      </div>
      <div class="form-group">
         <label class="col-sm-12 control-label text-left">Company URL</label>
         <div class="col-sm-12 inputGroupContainer">
            <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>
            <form:input path="companyurl" placeholder="Company URL" class="form-control" type="text"/></div>
         </div>
      </div>
      <div class="form-group">
         <label class="col-sm-12 control-label text-left">HR Name</label>
         <div class="col-sm-12 inputGroupContainer">
            <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <form:input path="hrname" placeholder="HR Name" class="form-control" required="true" type="text"/></div>
         </div>
      </div>
      <div class="form-group">
         <label class="col-sm-12 control-label text-left">HR Email</label>
         <div class="col-sm-12 inputGroupContainer">
            <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
            <form:input path="hremail" placeholder="HR Email" class="form-control"  type="text" data-inputmask="'alias': 'email'" autocomplete="off"/></div>
         </div>
      </div>
      <div class="form-group">
         <label class="col-sm-12 control-label text-left">HR Phone Number</label>
         <div class="col-sm-12 inputGroupContainer">
            <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
            <form:input path="hrphonenumber" placeholder="HR Phone Number" class="form-control"  type="text" autocomplete="off"/></div>
         </div>
      </div>
       <div class="form-group">
         <label class="col-sm-12 control-label text-left">Comments</label>
         <div class="col-sm-12 inputGroupContainer">
            <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
            <textarea path="comments" placeholder="Comments" class="form-control" rows="5"></textarea></div>
         </div>
      </div>
      
      
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
  <script type="text/javascript">
      $(function () {
        //Date range picker
        $('#reservation').daterangepicker({
        	 singleDatePicker: true,
        	    showDropdowns: true,
        	   // startDate: moment().add(5, 'day'),
        	    format: 'YYYY/MM/DD'
        	   
        });

      });
      
      $(".select2-single").select2();
    
      window.onload=function(){
    	  var sel =  $("#radioBtn a").data('title');
    	  $("#status").val(sel);
    	  $("#hrphonenumber").mask('99999-99999');
    	
      }
      
      $(function() {
          $(".submitdata").click(function() {
      	      // validate and process form here
      	     var selroleid = $("#roleid").val();	
      	     var username = $("#username").val();	
      	     var password = $("#password").val();	
      	     if(selroleid=="0"){
      	    	 alert("Please select role")
      	    	 return false;
      	     }
      	     if(username == "" || username.trim()==""){
      	    	 alert("Please enter username")
      	    	 return false;
      	     }
      	     if(password=="" || password.trim()==""){
      	    	 alert("Please enter password")
      	    	 return false;
      	     }
          });
         
      });
      $(function() {
      $("#username").change(function() {
    	  
      	var username = $("#username").val();	
			$("#email").val(username);
      });
      
      });
      </script>
</body>
</html>