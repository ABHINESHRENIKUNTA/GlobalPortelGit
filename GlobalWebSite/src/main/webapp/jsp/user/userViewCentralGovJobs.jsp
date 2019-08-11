<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title><spring:eval expression="@viewPropertyConfigurer.getProperty('central.jobs')" /></title>
  <%@include file="userNewHeader.jsp" %>
  <%@include file="alphabetsPaginationCSS.jsp" %>
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
            <!-- <ol class="breadcrumb">
              <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
              <li class="active">Free Job Training & Institute Links</li>
            </ol> -->
          </section>

          <!-- Main content -->
          <section class="content">
           <div class="col-md-12">
              <!-- Primary box -->
              <div class="box box-solid box-primary">
                <div class="box-header">
                  <h3 class="box-title"><spring:eval expression="@viewPropertyConfigurer.getProperty('central.jobs')" /></h3> <code>Find your best job..</code>
                  <div class="box-tools pull-right">
                    <button class="btn btn-primary btn-sm" title="BACK" onclick="location.href='load-jobcategories'"><i class="fa fa-backward"></i></button>
                    <button class="btn btn-primary btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                   <!--  <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button> -->
                  </div>
                </div>
                <div class="box-body">
                  
                 <div class="direct-chat-messages1">

                  <section id="main_content" class="inner">
                  	<div id="tabpage_1" class="tabContainer">
                  	<ul id="demoOne" class="demo">
                  	<c:forEach items="${jobsList}" var="jobsListData">
					<li class="col-sm-4"><a href='${jobsListData.linkaddress}' target="_blank">${jobsListData.linkname}</a>
					<!-- <div class="image-parent">
		              <img src="#" class="img-fluid" alt="quixote">
		          </div> -->
					</li>
					
                  	</c:forEach>
					</ul>
                  	</div>
                  </section>
                <!--  <div class="row"></div> -->
                 <!--  <div class="box-footer">
              
                 </div> -->
                </div><!-- /.box-body -->
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
     <%@include file="alphabetsPaginationJS.jsp" %>
         
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
