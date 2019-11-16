<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Job Categories</title>
  <%@include file="userNewHeader.jsp" %>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/build/css/intlTelInput.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/build/css/demo.css">
	<style type="text/css">
	  .myform{
		position: relative;
		display: -ms-flexbox;
		display: flex;
		padding: 1rem;
		-ms-flex-direction: column;
		flex-direction: column;
		width: 100%;
		pointer-events: auto;
		background-color: #fff;
		background-clip: padding-box;
		border: 1px solid rgba(0,0,0,.2);
		border-radius: 1.1rem;
		outline: 0;
		max-width: 500px;
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
	
	function otherFunction(othervalue){
		if(othervalue=='Others'){
			document.getElementById("othercatgr").style.display='block';
		}
		else{
			document.getElementById("othercatgr").style.display='none';
		}
	}

	function ValidateData(){
		var pwd=document.getElementById("password1").value;
		var cnfpwd=document.getElementById("confirmpassword").value;
		var optval=document.getElementById('otptxt').value;
		if(pwd!=cnfpwd){
			alert("Password and Confirm Password are not equal.");
			return false;
		}
		if(String(optval)!=String(otp)){
			alert("Invalid OTP.");
			return false;
		}
		return true;
	}

</script>
  </head>
  <!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
  <body class="<spring:eval expression="@viewPropertyConfigurer.getProperty('topmenu.color')" /> layout-top-nav">
    <div class="wrapper">
      <!-- header logo: style can be found in header.less -->
       <%@include file="userTopMenu.jsp" %>
      <!-- Full Width Column -->
      <div class="content-wrapper">
        <div class="container-fluid">
          <!-- Content Header (Page header) -->
          <section class="content-header">
            <h1>
            <i class="glyphicon glyphicon-th-large gly-spin"></i> Find your Jobs
              <small>There is a way to do it better...find it</small>
            </h1>

          </section>

          <!-- Main content -->
          <section class="content">
           <div class="col-md-12" id="jobcategories">
              <!-- Primary box -->
              <div class="box box-solid bg-gray" style="box-shadow: 10px 10px 5px #888888;  border-radius: 15px">
                <div class="box-body">
                 
            
        <div class="row">
        <div class="col-sm-4"></div>
			<div class="col-sm-7 text-center">
			<div id="first">
				<div class="myform form ">
					 <div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<h1>Register</h1>
						 </div>
						
					</div>
				
                  <form:form id="login-form" class="form" modelAttribute="login" action="registerStudent" method="post" enctype="multipart/form-data" onsubmit="return ValidateData()">
                         	 <c:if test="${regemsg!=null}">
                            <h4 style="color: red">${regemsg}</h4>
                      </c:if>
                       <c:if test="${regsmsg!=null}">
                         <h4 style="color: green">${regsmsg}</h4>
                      </c:if>
                      <h4 style="color: green" id="otplabelspan"></h4>
                           <div class="form-group">
                                <label for="username" class="text-info"><span style="color:red">*</span>Name As Per S.S.C:</label><br>
                                <form:input path="name"   id="username" required="required" class="form-control"/>
                            </div>
                             <div class="form-group">
                                <label for="mobileno" class="text-info"><span style="color:red">*</span>Mobile No:</label><br>
                                <form:input path="mobileno" id="phone"  type="tel" required="required" class="form-control" style="width:480px"/>
                            </div>
                              <div class="form-group">
                                <label for="emailid" class="text-info"><span style="color:red">*</span>Email Id:</label><br>
                                <form:input path="emailid" type="email"   id="emailid" required="required" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info"><span style="color:red">*</span>Password:</label><br>
                                <form:password path="password" id="password1" required="required" class="form-control"/>
                            </div>
                             <div class="form-group">
                                <label for="confirmpassword" class="text-info"><span style="color:red">*</span>Confirm Password:</label><br>
                                <form:password path="confirmpassword" id="confirmpassword" required="required" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <label for="passingyear" class="text-info"><span style="color:red">*</span>Highest Qualification:</label><br>
                                <form:input path="qualification" id="qualification" required="required" class="form-control"/>
                            </div>
                              <div class="form-group">
                                <label for="passingyear" class="text-info"><span style="color:red">*</span>Passing Year:</label><br>
                                <form:input path="passingyear" type="number" id="passingyear" required="required" minlength="4"	 maxlength="4" class="form-control"/>
                            </div>
                             <div class="form-group">
                                <label for="jobcategory" class="text-info"><span style="color:red">*</span>Job Category:</label><br>
                                <form:select path="jobcategory" type="text" id="jobcategory" required="required" class="form-control" onchange="otherFunction(this.value)">
                               <form:option value="0">---Select One---</form:option>
                                <c:forEach items="${jobcat}" var="items">
                                <form:option value="${items.jobcategoryid}">${items.jobcategory}</form:option>
                                </c:forEach>
                                <form:option value="Others">Others</form:option>
                                </form:select>
                            </div>
                            
                             <div class="form-group" id="othercatgr" style="display: none">
                                <label for="otherjobcategory" class="text-info"><span style="color:red">*</span>Job Category:</label><br>
                                <form:input path="otherjobcategory" type="text" id="otherjobcategory"  class="form-control"/>
                            </div>
                             
		                        <div class="section">
		                        <label for="passingyear" class="text-primary"><span style="color:red">*</span>Upload Resume:</label><br>
		                          <label class="field prepend-icon append-button file">
		                         
		                            <input type="file" class="btn btn-primary btn-md " name="file1" id="file1" required="required" accept=".jpg,.jpeg,.png,.word,.pdf">
		                            </label>
		                        </div>
		                                               
		                      <div class="form-group" id="otplabel" style="display: none">
                                <label for="passingyear" class="text-info"><span style="color:red">*</span>OTP:</label><br>
		                        <input type="text" id="otptxt" class="form-control" >
		                       </div>
		             		<div>
		             		<a href="#" class="btn btn-primary btn-md" id="otpbtn" onclick="return validateOTP()">Submit</a>
		             		 <center><input type="submit" name="submit" id="submitbtn"  class="btn btn-primary" value="Register" style="display: none;width: 100px;text-align: center" ></center>
		             		</div>
		             		<div>
		             		 <div class="col-md-12 text-left">
							Existing User<a href="viewuserloginpage"  id="otpbtn" > Login Here...</a>
						 </div>
		             		
		             		</div>
		             		
                        </form:form>
                 
				</div>
			</div>
			</div>
			</div>
			
            	    </div>
                  </div>
                  <div class="box-footer">
            	  </div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
         

          </section><!-- /.content -->
       <%@include file="userNewFooter.jsp" %>
    </div><!-- ./wrapper -->

       <%@include file="userNewFooterJsLinks.jsp" %>
       <script src="${pageContext.request.contextPath}/theme/build/js/intlTelInput.js"></script>
   <script>
    var input = document.querySelector("#phone");
    window.intlTelInput(input, {
      // allowDropdown: false,
      // autoHideDialCode: false,
      // autoPlaceholder: "off",
      // dropdownContainer: document.body,
      // excludeCountries: ["us"],
       //formatOnDisplay: false,
       geoIpLookup: function(callback) {
         $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
           var countryCode = (resp && resp.country) ? resp.country : "";
           callback(countryCode);
         });
       },
      // hiddenInput: "full_number",
      // initialCountry: "auto",
      // localizedCountries: { 'de': 'Deutschland' },
      nationalMode: false,
      // onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
      // placeholderNumberType: "MOBILE",
      // preferredCountries: ['cn', 'jp'],
      // separateDialCode: true,
      utilsScript: "${pageContext.request.contextPath}/theme/build/js/utils.js",
    });
  </script>
       <script type="text/javascript">
       $(document).ready(function(){
         $("#navbar-search-input").on("keyup", function() {
           var value = $(this).val().toLowerCase();
           $("#jobcategories div").filter(function() {
             $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
           });
         });
       });
       </script>
    
  </body>
</html>
