<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Job Categories</title>
  <%@include file="../user/userNewHeader.jsp" %>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/build/css/intlTelInput.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/build/css/demo.css">
      <link href="${pageContext.request.contextPath}/theme/vendor/plugins/daterange/daterangepicker.css" rel="stylesheet" type="text/css" />
  
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
	
  </head>
  <!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
  <body class="<spring:eval expression="@viewPropertyConfigurer.getProperty('topmenu.color')" /> layout-top-nav">
    <div class="wrapper">
      <!-- header logo: style can be found in header.less -->
       <%@include file="../user/userTopMenu.jsp" %>
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
                <div class="box-body" style="background-color: white">
                 
            
        <div class="row">
        <div class="col-sm-3"></div>
			<div id="first" >
					 <div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<h1>Register</h1>
						 </div>
						
					</div>
				
               
<form:form action="process-registeroperatorinfo" commandName="addoperator" autocomplete="off">
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
	   <strong>Sorry!</strong> ${emsg}
	</div>
	</c:if>
	<div class="col-sm-12">
	<div class="col-sm-6">
	<div class="form-group">
     <label class="col-sm-12 control-label text-left">Role Type</label>
     <div class="col-sm-12 inputGroupContainer">
        <div class="input-group">
           <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
            <form:select path="roleid" class="form-control"  style="max-width:100%">
               <form:option value="0" >Select Role </form:option>
               <c:forEach items="${listallroles}" var="rolelist">
               <c:if test="${rolelist.roleid!=1 && rolelist.roleid!=5 }">
               <form:option value="${rolelist.roleid}">${rolelist.rolename}</form:option>
               </c:if>
               </c:forEach>
            </form:select>
        </div>
     </div>
  </div>
  </div>
  <div class="col-sm-6">
	<div class="form-group">
     <label class="col-sm-12 control-label text-left">Organization</label>
     <div class="col-sm-12 inputGroupContainer">
        <div class="input-group">
           <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
            <form:select path="orgid" class="form-control"  style="max-width:100%">
               <form:option value="0" >Select Organization </form:option>
               <c:forEach items="${orgList}" var="organizationList">
               <form:option value="${organizationList.orgid}">${organizationList.orgname}</form:option>
               </c:forEach>
            </form:select>
        </div>
     </div>
  </div>
  </div>
  <div class="col-sm-6">
         <div class="form-group">
            <label class="col-sm-12 control-label text-left">User Name / Email</label>
            <div class="col-sm-12 inputGroupContainer">
               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
               <form:input  path="username" placeholder="Username" class="form-control" required="true" type="email" autocomplete="true" /></div>
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
                <form:input type="text" path="empdob" placeholder="YYYY/MM/DD" class="form-control pull-right" id="reservation" readonly="true"/> </div>
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
            <label class="col-sm-12 control-label text-left">Address</label>
            <div class="col-sm-12 inputGroupContainer">
               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
               <textarea path="address" placeholder="Employee Address" class="form-control" required="true" rows="3"></textarea></div>
            </div>
         </div>
           <div class="form-group">
            <label class="col-sm-12 control-label text-left">Phone Number</label>
            <div class="col-sm-12 inputGroupContainer">
               <div class="input-group">
               <form:input path="phonenumber" id="phone"  type="tel"  placeholder="Employee Phone Number" class="form-control" required="true"  style="width:540px"/></div>
            </div>
         </div>
         
         <div class="form-group" style="display: none;">
            <label class="col-sm-12 control-label text-left">Job Description</label>
            <div class="col-sm-12 inputGroupContainer">
               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
               <textarea path="jobdescription" placeholder="Job Description" class="form-control"  rows="3"></textarea></div>
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
       <div class="form-group" style="display: none;">
         <label class="col-sm-12 control-label text-left">Comments</label>
         <div class="col-sm-12 inputGroupContainer">
            <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
            <textarea path="comments" placeholder="Comments" class="form-control" rows="5"></textarea></div>
         </div>
      </div>
      
      <form:hidden path="status" value="true"/>
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
                  <div class="box-footer">
            	  </div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
         

          </section><!-- /.content -->
       <%@include file="../user/userNewFooter.jsp" %>
    </div><!-- ./wrapper -->

       <%@include file="../user/userNewFooterJsLinks.jsp" %>
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
   <%@include file="/jsp/admin/adminBodyScriptLinks.jsp" %>
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
    	 
    	  $("#hrphonenumber").mask('99999-99999');
    	
      }
      
      $(function() {
          $(".submitdata").click(function() {
      	      // validate and process form here
      	     var selroleid = $("#roleid").val();	
      	     var username = $("#username").val();	
      	     var password = $("#password").val();	
      	     var orgid = $("#orgid").val();	
      	     if(selroleid=="0"){
      	    	 alert("Please select role")
      	    	 return false;
      	     }
      	   if(orgid=="0"){
    	    	 alert("Please select organization");
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
