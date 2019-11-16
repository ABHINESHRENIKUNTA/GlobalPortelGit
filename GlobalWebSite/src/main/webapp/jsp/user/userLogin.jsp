<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Job Categories</title>
  <%@include file="userNewHeader.jsp" %>
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
							<h1>Login</h1>
						 </div>
					</div>
					<c:if test="${emsg!=null}">
			          <h5 style="color: red">${emsg}</h5>
			          </c:if>
			          <h5 style="color: green"><%=request.getParameter("smsg") %></h5>
                   <form action="submituserLoginDetails" method="post">
                           <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" name="username"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">Password</label>
                              <input type="password" name="password" id="password"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
                           </div>
                           <div class="form-group">
                              <p class="text-center">By signing up you accept our <a href="#">Terms Of Use</a></p>
                           </div>
                           <div class="col-md-12 text-center ">
                              <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
                           </div>
                           <div class="col-md-12 ">
                              <div class="login-or">
                                 <hr class="hr-or">
                                 <span class="span-or">or</span>
                              </div>
                           </div>
                           <div class="col-md-12 mb-3">
                              <!-- <p class="text-center">
                                 <a href="javascript:void();" class="google btn mybtn"><i class="fa fa-google-plus">
                                 </i> Signup using Google
                                 </a>
                              </p> -->
                           </div>
                           <div class="form-group">
                              <p class="text-center">Don't have account? <a href="studentLogin" id="signup">Sign up here</a></p>
                          <a href="load-studforgotPassword">I forgot my password</a>
                           </div>
                        </form>
                 
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
