<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title><spring:eval expression="@viewPropertyConfigurer.getProperty('postedbyadmin.jobs')" /></title>
  <%@include file="userNewHeader.jsp" %>
  <%@include file="jobDetailsCss.jsp" %>
  <style type="text/css">
.error{
    color: red;
}
  </style>
    <script type="text/javascript">
    var openLoginOrRegistrationModel = function(){
    	 var urlValue = "";
   	  var sessIsLive = <%=session.getAttribute("useremailid")!=null%>;
   	  if(sessIsLive){
   		$("#loginModal").modal("toggle");
   	  }else{
   		/* $("#regModal").modal("toggle"); */
   		$("#loginModal").modal("toggle");
   	  }
    }
  var userApplyPostedJob = function(fnType){
	  $(".error").hide();
      var hasError = false;
      var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
      var numberReg = /^[0-9-+()]*$/;

      var fullNameVal = $("#userfullname").val();
      var phoneVal = $("#userphone").val();
      var emailaddressVal = $("#email").val();
      var userPwdVal = $("#userpwd").val();
      
      var loginEmailVal = $("#loginemail").val();
      var loginPwdVal = $("#loginpwd").val();
      var rowid = $("#rowid").val();
      var tablekey = $("#tablekey").val();
      var actionValue = "";
      var datParams="";
      var encodeData="";
	  if(fnType=="regisration"){
		    actionValue = "register-applyjob?fullname="+fullNameVal+"&"+"phonenum="+phoneVal+"&"+"email="+emailaddressVal+"&"+"password="+userPwdVal;
	        if(fullNameVal.trim()==''){
	        	 $("#userfullname").after('<span class="error">Please enter your valid full name. </span>');
		            hasError = true;
	        }else if(phoneVal.trim()=='' || phoneVal.length<10 ){
	        	 $("#userphone").after('<span class="error">Please enter your valid phone number. </span>');
		            hasError = true;
	        }else if(emailaddressVal.trim() == '') {
	            $("#email").after('<span class="error">Please enter your email address.</span>');
	            hasError = true;
	        }else if(!emailReg.test(emailaddressVal)) {
	            $("#email").after('<span class="error">Enter a valid email address.</span>');
	            hasError = true;
	        }else if(userPwdVal.trim()=='' || userPwdVal.length<6 ){
	        	 $("#userpwd").after('<span class="error">Please enter your valid password.And Minimum length is 6 characters. </span>');
		            hasError = true;
	        }
	        datParams = "fullname: "+fullNameVal+","+"phonenum: "+phoneVal+","+"email: "+emailaddressVal+","+"password: "+userPwdVal;
	  }
	  
	  if(fnType=="login"){
		  actionValue = "login-applyjob?email= "+loginEmailVal+"&password= "+loginPwdVal+"&rowid="+rowid+"&tablekey="+tablekey;
		  encodeData = encodeURI(actionValue);
		  if(loginEmailVal.trim() == '') {
	            $("#loginemail").after('<span class="error">Please enter your email address.</span>');
	            hasError = true;
	        }else if(!emailReg.test(loginEmailVal)) {
	            $("#loginemail").after('<span class="error">Enter a valid email address.</span>');
	            hasError = true;
	        }else if(loginPwdVal.trim()=='' || loginPwdVal.length<4 ){
	        	 $("#loginpwd").after('<span class="error">Please enter your valid password.And Minimum length is 4 characters. </span>');
		            hasError = true;
	        } 
		  datParams = "email: "+loginEmailVal+","+"password: "+loginPwdVal;
	  }
	  if(hasError == true) { return false; }
	    $.ajax({
	            url : ""+encodeData,
	            type: "POST",
	            dataType: "json",
	            success : 
	            function(data) {
	            	var errorData=null;
	            	var successData=null;
	            	const userStr = JSON.stringify(data);
	            	JSON.parse(userStr, function replacer(key, value) {
	            		  if(key=="errormsg"){
	            			  if(value!=null){
	            				  errorData = value;
	            				  
	            			  }
	            		  }
	            		});
	            	
	            	if(null==errorData){
	            		successData ="success";
	            	}
	            	alert(errorData);
	            	alert(successData)
	            }
	    });
	 
	}
  </script>

 
  </head>
  <!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
  <body class="<spring:eval expression="@viewPropertyConfigurer.getProperty('topmenu.color')" /> layout-top-nav">
    <div class="wrapper">
      <%@include file="userTopMenu.jsp" %>
      <!-- Full Width Column -->
      <div class="content-wrapper">
        <div class="container-fluid">
          <!-- Content Header (Page header) -->
          <section class="content-header">
            <h1>
              Find your link
              <small>There is a way to do it better...find it</small>
            </h1>
         
          </section>

          <!-- Main content -->
          <section class="content">
           <div class="col-md-12">
              <!-- Primary box -->
              <div class="box box-solid box-<spring:eval expression="@viewPropertyConfigurer.getProperty('box.header.color')" />" >
                <div class="box-header">
                  <h3 class="box-title"><spring:eval expression="@viewPropertyConfigurer.getProperty('postedbyadmin.jobs')" /></h3> <code>Find your best job..</code>
                  <div class="box-tools pull-right">
                    <button class="btn btn-<spring:eval expression="@viewPropertyConfigurer.getProperty('box.header.color')" /> btn-sm" title="BACK" onclick="location.href='load-jobcategories'"><i class="fa fa-backward"></i></button>
                    <button class="btn btn-<spring:eval expression="@viewPropertyConfigurer.getProperty('box.header.color')" /> btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                   <!--  <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button> -->
                  </div>
                </div>
                <div class="box-body">
                  <div class="row">
            
            <div class="col-md-12">
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Jobs Inbox</h3>
                  <div class="box-tools pull-right">
                    <div class="has-feedback">
                      <input type="text" class="form-control input-sm" placeholder="Search Jobs">
                      <span class="glyphicon glyphicon-search form-control-feedback"></span>
                    </div>
                  </div><!-- /.box-tools -->
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
         		<input type="hidden" name="tablekey" id="tablekey" value="${tablekey}">
         		
                <ul class="searchList" id="content">
          <!-- job start -->
          <c:forEach items="${listData}" var="jobDetails" varStatus="loop">
          <input type="hidden" name="rowid" id="rowid" value="${jobDetails.rowid}">
          <li class="content-result">
            <div class="row">
              <div class="col-md-10 col-sm-10">
                <div class="jobimg"><i class="fa fa-black-tie fa-5x" aria-hidden="true" style="color:#DDDDDD;"></i></div>
                <div class="jobinfo">
                  <h3><a href="#.">${jobDetails.jobtitle}</a></h3>
                  <div class="companyName"><a href="#.">${jobDetails.company}</a></div>
                  <div class="location">
                  
                   <div class="col-sm-2"> <label class="fulltime">Job Type - Location</label></div>
        		   <div class="col-sm-4">${jobDetails.jobtype} - ${jobDetails.location},</div>
                   <div class="col-sm-2"> <label class="fulltime">Notice Period</label></div>
        		   <div class="col-sm-4">${jobDetails.noticeperiod},</div>
      
                 <%--  <label class="fulltime">${jobDetails.jobtype}</label>   - <span>${jobDetails.location}, </span>
                  <label class="fulltime"> Notice Period: </label>   - <span>${jobDetails.noticeperiod}, </span> --%>
                  </div>
                </div>
        		 <div class="clearfix"></div>
                <div class="jobinfo">
                  <div class="location">
                   <div class="col-sm-2"> <label class="fulltime">Experience Required</label></div>
        		   <div class="col-sm-4">${jobDetails.experience},</div>
                   <div class="col-sm-2"> <label class="fulltime">Number Of Positions</label></div>
        		   <div class="col-sm-4">${jobDetails.noofpossitions},</div>
                  </div>
                </div>
                 <div class="clearfix"></div>
                <div class="jobinfo">
                  <div class="location">
                   <div class="col-sm-2"> <label class="fulltime">Salary</label></div>
        		   <div class="col-sm-4">${jobDetails.salary},</div>
                   <div class="col-sm-2"> <label class="fulltime">Industry</label></div>
        		   <div class="col-sm-4">${jobDetails.industry},</div>
                  </div>
                </div>
                 <div class="clearfix"></div>
                <div class="jobinfo">
                  <div class="location">
                   <div class="col-sm-2"> <label class="fulltime">Role / Designation</label></div>
        		   <div class="col-sm-4">${jobDetails.rolecategory}</div>
                  </div>
                </div>
                <div class="clearfix"></div>
              </div>
              <div class="col-md-2 col-sm-2">
                
                 <div class="listbtn">
    				<button href="#" data-toggle="dropdown" class="btn btn-warning dropdown-toggle share">
    					<i class="fa fa-share-alt" aria-hidden="true"></i><!-- <span class="caret"></span> -->
    				</button>
    				<ul class="dropdown-menu" style="border: none; max-height: 10px;">
    				<li >
        				<span onclick="twitterFun();">
								<i class="fa fa-twitter" style="color:#00acee; padding: 2px;cursor: pointer;font-size: 25px; "></i>
							</span> 
        					<span onclick="facebookFun();">
								<i class="fa fa-facebook" style="color:#3b5998; padding: 2px;cursor: pointer;font-size: 25px; "></i>
        					</span>
        					<span onclick="googlePlusFun();">
								<i class="fa fa-google-plus fa-3px" style="color:#CC3333; padding: 2px;cursor: pointer;font-size: 25px; "></i>
							</span>
							<span onclick="linkedinFun();">							
								<i class="fa fa-linkedin fa-3px" style="color:#0077B5; padding: 2px;cursor: pointer;font-size: 25px; "></i>
							</span>
							
							<!-- <span onclick="mailToFun();">
								<i class="fa fa-envelope fa-3px" style="color:#f1d592; padding: 2px;cursor: pointer;font-size: 25px; "></i>
							</span> -->
        				</li>
                    </ul>
                   <button type="button" class="btn btn-warning" onclick="openLoginOrRegistrationModel();"><i class="glyphicon glyphicon-thumbs-up" style="padding-right: 3px;"></i> Apply Now</button></div> 
                <input type="hidden" name="rowid" value="${jobDetails.rowid}"/>
              </div>
            </div>
             <h4><a href="#.">Skill Requirement</a></h4>
            <p style="white-space: pre-wrap;">${jobDetails.skillreq}</p>
             <h4><a href="#.">Job Responsibilities</a></h4>
            <p style="white-space: pre-wrap;">${jobDetails.jobresponsibilities}</p>
            <h4><a href="#.">Other Information</a></h4>
            <p style="white-space: pre-wrap;text-align: justify;">${jobDetails.otherinfo}</p>
            <h4><a href="#.">Contact Information</a></h4>
            <p>Email: ${jobDetails.emailid}</p>
            <p>Contact: ${jobDetails.contactnum}</p>
            
          </li>
          </c:forEach>
          <!-- job end --> 
        </ul>
                  
                </div><!-- /.box-body -->
     
              </div><!-- /. box -->
               <div class="box-footer">
               <div class="col-md-4 col-sm-4"><div id="showingInfo" ></div></div>
               <div class="col-md-8 col-sm-8 text-right"> <div  id="pagination"></div></div>
             

                 </div>
            </div><!-- /.col -->
            
          </div>
                 
                 
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
         

          </section><!-- /.content -->
        </div><!-- /.container -->
      </div><!-- /.content-wrapper -->
      <%@include file="userNewFooter.jsp" %>
    </div><!-- ./wrapper -->

   <%@include file="userNewFooterJsLinks.jsp" %>
   
   <!-- set up the modal to start hidden and fade in and out -->
<div id="regModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
        	<div class="modal-header bg-purple">
        		Registration
                <button type="button" class="close" data-dismiss="modal" style="color: white;">&times;</button>
        	</div>
            <!-- dialog body -->
            <div class="modal-body bg-gray">
                <div class="note">
                    <p>Register with us for latest jobs</p>
                </div>
                    <div class="row">
                        <div class="col-xs-24">
                        <div class="col-xs-6">
                            <div class="form-group">
                                <input name="userfullname" id="userfullname" type="text" class="form-control" placeholder="Your Name *" />
                            </div>
                         </div>
                         <div class="col-xs-6">
                            <div class="form-group">
                                <input name="userphone" id="userphone" type="number" class="form-control" placeholder="Phone Number *" step="0" />
                            </div>
                        </div>
                       </div>
                	</div>
                    <div class="row">
                        <div class="col-xs-24">
                        <div class="col-xs-6">
                            <div class="form-group">
                                <input type="email" name="email" id="email" class="form-control" placeholder="Your Email *" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required="required"/>
                            </div>
                         </div>
                         <div class="col-xs-6">
                            <div class="form-group">
                                <input name="userpwd" id="userpwd" type="password" class="form-control" placeholder="Your Password *" />
                            </div>
                        </div>
                       </div>
                	</div>
            </div>
            <!-- dialog buttons -->
            <div class="modal-footer bg-purple"><button type="button" class="btn btn-primary" onclick="userApplyPostedJob('regisration');">Submit</button></div>
        </div>
    </div>
</div>
<div id="loginModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
        		Login
                <button type="button" class="close" data-dismiss="modal">&times;</button>
        	</div>
            <!-- dialog body -->
            <div class="modal-body">
                <div class="row">
                        <div class="col-xs-24">
                        <div class="col-xs-6">
                            <div class="form-group">
                                <input type="email" name="username" id="loginemail" class="form-control" placeholder="Your Email *" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required="required"/>
                            </div>
                         </div>
                         <div class="col-xs-6">
                            <div class="form-group">
                                <input name="password" id="loginpwd" type="password" class="form-control" placeholder="Your Password *" />
                            </div>
                        </div>
                       </div>
                	</div>
            </div>
            <!-- dialog buttons -->
            <div class="modal-footer bg-purple"><button type="button" class="btn btn-primary" onclick="userApplyPostedJob('login');">Login & Apply</button>
           <button type="button" class="btn btn-primary pull-left" onclick="userApplyPostedJob('regisration');">Register & Apply</button></div>
        </div>
    </div>
</div>
<script>


      $("#regModal").modal('hide');
      $("#loginModal").modal('hide');
      
    function socialWindow(url) {
        var left = (screen.width - 570) / 2;
        var top = (screen.height - 570) / 2;
        var params = "menubar=no,toolbar=no,status=no,width=570,height=570,top=" + top + ",left=" + left;
        window.open(url,"NewWindow",params);
    }

        var pageUrl = encodeURIComponent(document.URL);
        var tweet = encodeURIComponent(jQuery("meta[property='og:description']").attr("content"));
        
       function facebookFun() {
            url = "https://www.facebook.com/sharer.php?u=" + pageUrl;
            alert(url);
            socialWindow(url);
        }

        function twitterFun() {
            url = "https://twitter.com/intent/tweet?url=" + pageUrl + "&text=" + tweet;
            socialWindow(url);
        }
        function googlePlusFun() {
            url = "https://plus.google.com/share?url=" + pageUrl + "&text=" + tweet;
            socialWindow(url);
        }

        function linkedinFun() {
            url = "https://www.linkedin.com/shareArticle?mini=true&url=" + pageUrl;
            socialWindow(url);
        }
       /*  var pageTitle = encodeURIComponent(page.title);
        var body_message = $('#content-result').html();
        var email = 'test@mail.com';
        var subject = pageTitle;
        var mailto_link = 'mailto:' + email + '?subject=' + subject + '&body=' + body_message;
        function mailToFun() {
        	socialWindow(mailto_link);
        } */
    </script>
    
  </body>
</html>
