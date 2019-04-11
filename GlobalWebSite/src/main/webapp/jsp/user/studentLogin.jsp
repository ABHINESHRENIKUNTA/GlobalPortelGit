<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  margin: 0;
  padding: 0;
  background-color: #17a2b8;
  height: 100vh;
}
#login .container #login-row #login-column #login-box {
  margin-top:80px;
  max-width: 600px;
  height: 320px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;

}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
  
}
#login .container #login-row #login-column #login-box #login-form #register-link {
  margin-top: -85px;
}
</style>
</head>
<body>
     <div id="login">
        <h3 class="text-center text-white pt-5">Global Web Site</h3>    
    <div style="width: 100%; overflow: hidden;">
    <div id="login" style="width:450px; float: left;"> 
     <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-12">
   					 <div id="login-box" class="col-md-6">
                        <form:form id="login-form" class="form" modelAttribute="login" action="ValidateStudent" method="post">
                            <h3 class="text-center text-info">Student Login<i class="fa fa-lock"></i></h3>
                            <c:if test="${emsg!=null}">
                            <h4 style="color: red">${emsg}</h4>
                            </c:if>
                            <div class="form-group">
                                <label for="username" class="text-info"><i class="fa fa-user"></i>Username:</label><br>
                                <form:input path="username"  type="email" id="username" required="required" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info"><i class="fa fa-unlock-alt"></i>Password:</label><br>
                                <form:password path="password" id="password" required="required" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                            </div>
                         
                        </form:form>
                    </div>
                    </div>
                    </div>
                    </div>
     </div>
    <div id="login" style="margin-left: 320px;"> 
     <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-12">
    				<div id="login-box" class="col-md-6">
                        <form:form id="login-form" class="form" modelAttribute="login" action="registerStudent" method="post">
                            <h3 class="text-center text-info">Student Registration</h3>
                            <c:if test="${emsg!=null}">
                            <h4 style="color: red">${emsg}</h4>
                            </c:if>
                            <div class="form-group">
                                <label for="username" class="text-info">Username:</label><br>
                                <form:input path="username"  type="email" id="username" required="required" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <form:password path="password" id="password" required="required" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="submit">
                            </div>
                         
                        </form:form>
                    </div>
                    </div>
                    </div>
                    </div>
                    
     </div>
	</div>
	</div>
</body>
</html>