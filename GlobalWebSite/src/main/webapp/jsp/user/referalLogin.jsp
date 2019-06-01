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
 <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/build/css/intlTelInput.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/build/css/demo.css">
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
  height: 1100px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;

}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
  
}
#login .container #login-row #login-column #login-box #login-form #register-link {
  margin-top: -60px;
}
.intl-tel-input.allow-dropdown input, .intl-tel-input.allow-dropdown input[type=text], .intl-tel-input.allow-dropdown input[type=tel], .intl-tel-input.separate-dial-code input, .intl-tel-input.separate-dial-code input[type=text], .intl-tel-input.separate-dial-code input[type=tel] {
    width: 725px
}
</style>
<script type="text/javascript">

var otp="";
	var validateOTP = function(){
		otp=generateOTP();
		emailid=document.getElementById('emailid').value;
		if(emailid==''){
			alert("Please Enter Email Id.");
			return false;
		}
	    $.ajax({
	            url : "ValidateOTP?code=" +otp+"&&emailid="+emailid,
	            type: "GET",
	            dataType: "text",
	            success : 
	            function(data) {
	            	    
	            }
	    });
	    document.getElementById('otpbtn').style.display='none';
	    document.getElementById('submitbtn').style.display='block';
	    document.getElementById('otplabel').style.display='block';
	    document.getElementById('otplabelspan').innerHTML='Please EnterThe OTP Shared With Your Email Id.';
	}
	
	function generateOTP() { 
        
	    // Declare a digits variable  
	    // which stores all digits 
	    var digits = '0123456789'; 
	    let OTP = ''; 
	    for (let i = 0; i < 4; i++ ) { 
	        OTP += digits[Math.floor(Math.random() * 10)]; 
	    } 
	    return OTP; 
	} 

	function ValidateData(){
		var optval=document.getElementById('otptxt').value;
	
		if(String(optval)!=String(otp)){
			alert("Invalid OTP.");
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
                        <form:form id="login-form" class="form" modelAttribute="login" action="ValidateReferal" method="post">
                            <h3 class="text-center text-info">Referal Login<i class="fa fa-lock"></i></h3>
                            <c:if test="${emsg!=null}">
                            <h4 style="color: red">${emsg}</h4>
                            </c:if>
                             <c:if test="${smsg!=null}">
                            <h4 style="color: green">${smsg}</h4>
                            </c:if>
                            <div class="form-group">
                                <label for="referalemail" class="text-info"><i class="fa fa-user"></i><span style="color:red">*</span>Username:</label><br>
                                <form:input path="referalemail"  type="email" id="username" required="required" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info"><i class="fa fa-unlock-alt"></i><span style="color:red">*</span>Password:</label><br>
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
                        <form:form id="login-form" class="form" modelAttribute="login" action="registerReferal" method="post" enctype="multipart/form-data" onsubmit="return ValidateData()">
                            <h3 class="text-center text-info">Referal Registration</h3>
                              <h4 style="color: green" id="otplabelspan"></h4>
                            <c:if test="${regemsg!=null}">
                            <h4 style="color: red">${regemsg}</h4>
                            </c:if>
                               <c:if test="${regsmsg!=null}">
                            <h4 style="color: green">${regsmsg}</h4>
                            </c:if>
                             <div class="form-group">
                                <label for="referalname" class="text-info"><span style="color:red">*</span>Referal Name:</label><br>
                                <form:input path="referalname"   id="referalname" required="required" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="username" class="text-info"><span style="color:red">*</span>Company Name:</label><br>
                                <form:input path="companyname"   id="companyname" required="required" class="form-control"/>
                            </div>
                            
                              <div class="form-group">
                                <label for="referalemail" class="text-info"><span style="color:red">*</span>Email Id:</label><br>
                                <form:input path="referalemail" type="email"   id="emailid" required="required" class="form-control"/>
                            </div>
                             
                            <div class="form-group">
                                <label for="password" class="text-info"><span style="color:red">*</span>Password:</label><br>
                                <form:password path="password" id="password1" required="required" class="form-control"/>
                            </div>
                           
                            <div class="form-group">
                                <label for="referalcontactno" class="text-info"><span style="color:red">*</span>Contact No:</label><br>
                                <form:input  path="referalcontactno" id="phone"  type="tel"  required="required" class="form-control"/>
                            </div>
                             
                              <div class="form-group">
                                <label for="positionoffering" class="text-info"><span style="color:red">*</span>Position Offering:</label><br>
                                <form:input path="positionoffering" id="positionoffering" required="required"  class="form-control"/>
                            </div>
                              <div class="form-group">
                                <label for="qualification" class="text-info"><span style="color:red">*</span>Minimum Qualification Required:</label><br>
                                <form:input path="qualification" id="qualification" required="required"  class="form-control"/>
                            </div>
                              <div class="form-group">
                                <label for="jobdescription" class="text-info"><span style="color:red">*</span>Job Description:</label><br>
                                <form:textarea path="jobdescription" id="jobdescription" required="required"  class="form-control"/>
                            </div>
		                                     
		                      <div class="form-group" id="otplabel" style="display: none">
                                <label for="passingyear" class="text-info"><span style="color:red">*</span>OTP:</label><br>
		                        <input type="text" id="otptxt" class="form-control" >
		                       </div>
		             		<div>
		             		<a href="#" class="btn btn-info btn-md" id="otpbtn" onclick="return validateOTP()">Submit</a>
		             		</div>
		             		<div class="form-group">
                                <input type="submit" name="submit" id="submitbtn"  class="btn btn-info btn-md" value="Register" style="display: none" >
                            </div>

                         
                        </form:form>
                    </div>
                    </div>
                    </div>
                    </div>
                    
     </div>
	</div>
	</div>
	<script src="${pageContext.request.contextPath}/theme/build/js/intlTelInput.js"></script>
  <script>
    var input = document.querySelector("#phone");
    window.intlTelInput(input, {
    	
    	geoIpLookup: function(callback) {
    	      $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
    	        var countryCode = (resp && resp.country) ? resp.country : "";
    	         callback(countryCode);
    	      });
    	      },
    	      separateDialCode: true,
      // allowDropdown: false,
      // autoHideDialCode: false,
      // autoPlaceholder: "off",
      // dropdownContainer: document.body,
      // excludeCountries: ["us"],
      // formatOnDisplay: false,
      // geoIpLookup: function(callback) {
      //   $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
      //     var countryCode = (resp && resp.country) ? resp.country : "";
      //     callback(countryCode);
      //   });
      // },
      // hiddenInput: "full_number",
      // initialCountry: "auto",
      // localizedCountries: { 'de': 'Deutschland' },
      // nationalMode: false,
      // onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
      // placeholderNumberType: "MOBILE",
      // preferredCountries: ['cn', 'jp'],
      // separateDialCode: true,
      utilsScript: "${pageContext.request.contextPath}/theme/build/js/utils.js",
    });
  </script>
</body>
</html>