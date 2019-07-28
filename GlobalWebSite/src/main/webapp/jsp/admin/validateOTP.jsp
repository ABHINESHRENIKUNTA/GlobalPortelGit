<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jobseeker's Find & Contact to Latest Jobs Online || Global Job Portal</title>
<%@include file="/jsp/user/userNewHeader.jsp" %>
</head>


 <!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
  <body class="layout-top-nav skin-purple">
    <div class="wrapper">
      <!-- header logo: style can be found in header.less -->
       <%@include file="/jsp/user/userTopMenu.jsp" %>
      <!-- Full Width Column -->
      <div class="content-wrapper">
        <div class="container-fluid">
         <div class="login-box">
      <div class="login-logo">
       <b>GJB </b>Login</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>
         <form:form id="login-form" class="form" modelAttribute="lmodel" action="ValidateAdminOTP" method="post">
          <c:if test="${ermsg!=null}">
           <h4 style="color: red">${ermsg}</h4>
           </c:if>
          <div class="form-group has-feedback">
            <form:input path="otp"   id="username" required="required" maxlength="6" minlength="6" class="form-control" autocomplete="off" placeholder="Enter OTP shared with your mail id"/>
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
    
          <div class="row">

            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
               <input type="hidden" name="usernameval" value="${username}">
            </div><!-- /.col -->
          </div>
        </form:form>

  
      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->
        
        
   
    </div>
    </div>
    </div>
    
</body>
    <%@include file="/jsp/user/userNewFooterLoginJsLinks.jsp" %>
</html>