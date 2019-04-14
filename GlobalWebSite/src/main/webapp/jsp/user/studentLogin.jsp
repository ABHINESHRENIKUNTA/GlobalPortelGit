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
#login1 .container #login-row #login-column #login-box {
  margin-top:80px;
  max-width: 800px;
  height: 320px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;

}
#login .container #login-row #login-column #login-box {
  margin-top:80px;
  max-width: 800px;
  height: 870px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;

}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
  
}
#login .container #login-row #login-column #login-box #login-form #register-link {
  margin-top: -80px;
}
</style>
<script type="text/javascript">

function ValidateData(){
	var pwd=document.getElementById("password1").value;
	var cnfpwd=document.getElementById("confirmpassword").value;
	if(pwd!=cnfpwd){
		alert("Password and Confirm Password are not equal.");
		return false;
	}
	return true;
}

</script>
</head>
<body>
     <div >
        <h3 class="text-center text-white pt-5">Global Web Site</h3>    
    <div style="width: 100%; overflow: hidden;">
    <div id="login1" style="width:450px; float: left;margin-left: 30px"> 
     <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-12">
   					 <div id="login-box" class="col-md-6">
                        <form:form id="login-form" class="form" modelAttribute="login" action="ValidateStudent" method="post">
                            <h3 class="text-center text-info">Student Login<i class="fa fa-lock"></i></h3>
                            <c:if test="${emsg!=null}">
                            <h4 style="color: red">${emsg}</h4>
                            </c:if>
                             <c:if test="${smsg!=null}">
                            <h4 style="color: green">${smsg}</h4>
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
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="Login">
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
    				<div id="login-box" class="col-md-8">
                        <form:form id="login-form" class="form" modelAttribute="login" action="registerStudent" method="post" enctype="multipart/form-data" onsubmit="return ValidateData()">
                            <h3 class="text-center text-info">Student Registration</h3>
                            <c:if test="${regemsg!=null}">
                            <h4 style="color: red">${regemsg}</h4>
                            </c:if>
                               <c:if test="${regsmsg!=null}">
                            <h4 style="color: green">${regsmsg}</h4>
                            </c:if>
                            <div class="form-group">
                                <label for="username" class="text-info">Name As Per S.S.C:</label><br>
                                <form:input path="name"   id="username" required="required" class="form-control"/>
                            </div>
                             <div class="form-group">
                                <label for="mobileno" class="text-info">Mobile No:</label><br>
                                <form:input path="mobileno" type="number"  id="mobileno" required="required" class="form-control" minlength="10" maxlength="10" />
                            </div>
                              <div class="form-group">
                                <label for="emailid" class="text-info">Email Id:</label><br>
                                <form:input path="emailid" type="email"   id="emailid" required="required" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Password:</label><br>
                                <form:password path="password" id="password1" required="required" class="form-control"/>
                            </div>
                             <div class="form-group">
                                <label for="confirmpassword" class="text-info">Confirm Password:</label><br>
                                <form:password path="confirmpassword" id="confirmpassword" required="required" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="passingyear" class="text-info">Highest Qualification:</label><br>
                                <form:input path="qualification" id="qualification" required="required" class="form-control"/>
                            </div>
                              <div class="form-group">
                                <label for="passingyear" class="text-info">Passing Year:</label><br>
                                <form:input path="passingyear" type="number" id="passingyear" required="required" minlength="4"	 maxlength="4" class="form-control"/>
                            </div>
                             
		                        <div class="section">
		                        <label for="passingyear" class="text-info">Upload Resume:</label><br>
		                          <label class="field prepend-icon append-button file">
		                         
		                            <input type="file" class="btn btn-info btn-md " name="file1" id="file1" required="required" accept=".jpg,.jpeg,.png,.word,.pdf">
		                            </label>
		                        </div>
		             		
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="Register">
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