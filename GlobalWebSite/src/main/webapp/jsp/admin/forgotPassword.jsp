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
        <p class="login-box-msg">Enter your email id password will be shared to your email.	</p>
        <form:form id="login-form" class="form" modelAttribute="login" action="validateForgotPassword" method="post">
         <c:if test="${emsg!=null}">
          <h5 style="color: red">${emsg}</h5>
          </c:if>
         <c:if test="${smsg!=null}">
          <h5 style="color: green">${smsg}</h5>
          </c:if>
          <div class="form-group has-feedback">
            <form:input path="username"  type="email" required="required" class="form-control" placeholder="Email"/>
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
            <div class="row">
            <div class="col-xs-4">&nbsp;</div>
       		<div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Submit</button>
            </div>
            </div>
         
        </form:form>

     <!--    <div class="social-auth-links text-center">
          <p>- OR -</p>
          <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using Facebook</a>
          <a href="#" class="btn btn-block btn-social btn-google-plus btn-flat"><i class="fa fa-google-plus"></i> Sign in using Google+</a>
        </div>/.social-auth-links -->


      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->
        
        
   
    </div>
    </div>
     <%@include file="/jsp/user/userNewFooter.jsp" %>
    </div>
    
</body>

 <%@include file="/jsp/user/userNewFooterLoginJsLinks.jsp" %>
 <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
    </script>
</html>