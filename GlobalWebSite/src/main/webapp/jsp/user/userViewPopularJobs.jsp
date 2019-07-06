<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Job Categories</title>
  <%@include file="userNewHeader.jsp" %>
      <link href="${pageContext.request.contextPath}/theme/userhome/css/listnav.css" rel="stylesheet" type="text/css" />
  <style>
  
  .direct-chat-messages1 {
	  .translate(0, 0);
	  padding: 10px;
	  height: auto;
	  overflow: auto;
	}
  </style>
  </head>
  <!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
  <body class="skin-green layout-top-nav">
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
            <ol class="breadcrumb">
              <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
              <li class="active">Popular Job Links</li>
            </ol>
          </section>

          <!-- Main content -->
          <section class="content">
           <div class="col-md-12">
              <!-- Primary box -->
              <div class="box box-solid box-primary">
                <div class="box-header">
                  <h3 class="box-title">Popular Job Links</h3> <code>Find your best job..</code>
                  <div class="box-tools pull-right">
                    <button class="btn btn-primary btn-sm" title="BACK" onclick="location.href='load-jobcategories'"><i class="fa fa-backward"></i></button>
                    <button class="btn btn-primary btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                   <!--  <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button> -->
                  </div>
                </div>
                   <div class="direct-chat-messages1">

                  <section id="main_content" class="inner">
                  	<div id="tabpage_1" class="tabContainer">
                  	<ul id="demoOne" class="demo">
					<li class="col-sm-6"><a href='#' target="_blank">411 Services</a></li>
					</ul>
                  	</div>
                  </section>
                 
                  <div class="box-footer">
              
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
         <script src="${pageContext.request.contextPath}/theme/userhome/js/jquery-listnav.js" type="text/javascript"></script>
             <script src="${pageContext.request.contextPath}/theme/userhome/js/vendor.js" type="text/javascript"></script>
  <script>
$(function(){
	$('#demoOne').listnav();

	/* $('.demo a').click(function(e) {
		e.preventDefault();
	}); */
});
</script>
  </body>
</html>
