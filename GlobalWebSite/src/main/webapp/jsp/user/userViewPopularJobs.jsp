<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title><spring:eval expression="@viewPropertyConfigurer.getProperty('popular.jobs')" /></title>
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
            <ol class="breadcrumb">
              <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
              <li class="active"><spring:eval expression="@viewPropertyConfigurer.getProperty('popular.jobs')" /></li>
            </ol>
          </section>

          <!-- Main content -->
          <section class="content">
           <div class="col-md-12">
              <!-- Primary box -->
              <div class="box box-solid box-<spring:eval expression="@viewPropertyConfigurer.getProperty('box.header.color')" />" >
                <div class="box-header">
                  <h3 class="box-title">Popular Job Links</h3> <code>Browse Jobs by Companies..</code>
                  <div class="box-tools pull-right">
                    <button class="btn btn-<spring:eval expression="@viewPropertyConfigurer.getProperty('box.header.color')" /> btn-sm" title="BACK" onclick="location.href='load-jobcategories'"><i class="fa fa-backward"></i></button>
                    <button class="btn btn-<spring:eval expression="@viewPropertyConfigurer.getProperty('box.header.color')" /> btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                   <!--  <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button> -->
                  </div>
                </div>
                   <div class="direct-chat-messages1">

                  <section id="main_content" class="inner">
                  	<div id="tabpage_1" class="tabContainer">
                  	<ul id="demoOne" class="demo">
                  	<c:forEach items="${jobsList}" var="populardata">
                  	
                  	 
					<li class="col-sm-6"><a href='${populardata.linkaddress}' target="_blank">${populardata.comments}<br>${populardata.linkname}</a>
					<!-- <div class="image-parent">
		              <img src="https://static.naukimg.com/s/4/100/i/naukri_Logo.png" class="img-fluid" alt="quixote">
		          </div> -->
					</li><br>
					
                  	</c:forEach>
					</ul>
                  	</div>
                  </section>
                <!--  <div class="row"></div> -->
                 <!--  <div class="box-footer">
              
                 </div> -->
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
