<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>State-Wise Jobs</title>
  <%@include file="userNewHeader.jsp" %>
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
              <li class="active">State-Wise Job Links</li>
            </ol>
          </section>

          <!-- Main content -->
          <section class="content">
           <div class="col-md-12">
              <!-- Primary box -->
              <div class="box box-solid box-primary">
                <div class="box-header">
                  <h3 class="box-title"> <span class="glyphicon glyphicon-list"></span> State-Wise Job Links</h3> <code>Find your best job..</code>
                  <div class="box-tools pull-right">
                    <button class="btn btn-primary btn-sm" title="BACK" onclick="location.href='load-jobcategories'"><i class="fa fa-backward"></i></button>
                    <button class="btn btn-primary btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                   <!--  <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button> -->
                  </div>
                </div>
                <div class="box-body">
                  <jsp:useBean id="now" class="java.util.Date" />
				  <fmt:formatDate var="curDate" value="${now}" pattern="dd MMM. yyyy" />
				  <fmt:formatDate var="curTime" value="${now}" pattern="HH:MM" />
			
                    <div class="input-group add-on">
				      <input class="searchBox form-control" placeholder="Search State: E.g Telangana" type="text">
				      <div class="input-group-btn">
				        <button class="btn btn-default" type="button"><i class="glyphicon glyphicon-search"></i></button>
				      </div>
				    </div>
				  <div class="row" style="padding-bottom: 10px;"></div>
                 <ul class="timeline" id="content">

			    <!-- timeline time label -->
			    <li class="time-label">
			        <span class="bg-red">
			           ${curDate}
			        </span>
			    </li>
			    <!-- /.timeline-label -->
			
			    <!-- timeline item -->
			    <li class="result well">
			        <!-- timeline icon -->
			        <i class="fa fa-envelope bg-blue"></i>
			        <div class="timeline-item">
			            <span class="time"><i class="fa fa-clock-o"></i>  ${curTime}</span>
			
			            <h3 class="timeline-header"><a href="#">Choose your job</a> ...</h3>
			
			            <div class="timeline-body">
			                ...
			                Content goes here1
			            </div>
			
			            <div class='timeline-footer'>
			                <a class="btn btn-primary btn-xs">VIEW</a>
			            </div>
			        </div>
			    </li>
			    <!-- timeline item -->
			    <li class="result well">
			        <!-- timeline icon -->
			        <i class="fa fa-envelope bg-blue"></i>
			        <div class="timeline-item">
			            <span class="time"><i class="fa fa-clock-o"></i>  ${curTime}</span>
			
			            <h3 class="timeline-header"><a href="#">Choose your job</a> ...</h3>
			
			            <div class="timeline-body">
			                ...
			                Content goes here
			            </div>
			
			            <div class='timeline-footer'>
			                <a class="btn btn-primary btn-xs">VIEW</a>
			            </div>
			        </div>
			    </li>
    <!-- END timeline item -->
    

</ul>

<div id="pagingControls"></div>
<div id="showingInfo" class="well" style="margin-top:20px"></div>


                
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div>
         

          </section><!-- /.content -->
        </div><!-- /.container -->
      </div><!-- /.content-wrapper -->
      <%@include file="userNewFooter.jsp" %>
    </div><!-- ./wrapper -->

   <%@include file="userNewFooterJsLinks.jsp" %>
      <script src="${pageContext.request.contextPath}/theme/usernewdesign/pagination/Flexible.Pagination.js" type="text/javascript"></script>
    
    <script>
    $(function() {

        var flexiblePagination = $('#content').flexiblePagination({
            itemsPerPage : 1,
            itemSelector : 'li.result:visible',
            pagingControlsContainer : '#pagingControls',
            showingInfoSelector : '#showingInfo',
            css: {
                btnNumberingClass: 'btn btn-sm btn-success',
                btnFirstClass: 'btn btn-sm btn-success',
                btnLastClass: 'btn btn-sm btn-success',
                btnNextClass: 'btn btn-sm btn-success',
                btnPreviousClass: 'btn btn-sm btn-success'
            }
        });
        flexiblePagination.getController().onPageClick = function(pageNum, e){
            console.log('You Clicked Page: '+pageNum)
        };

// Direct JS Object method of using the FlexiblePagination
//        var pager = new Flexible.Pagination();
//        pager.itemsPerPage = 1;
//        pager.pagingContainer = '#content';
//        pager.itemSelector = 'div.result:visible';  //That is, Select and paginate only the filtered visible '.result' div.
//        pager.pagingControlsContainer = '#pagingControls';
//        pager.showCurrentPage();
    });

    </script>
  </body>
</html>
