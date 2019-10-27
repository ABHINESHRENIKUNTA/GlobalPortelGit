<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title><spring:eval expression="@viewPropertyConfigurer.getProperty('state.jobs')" /></title>
  <%@include file="userNewHeader.jsp" %>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/theme/vendor/plugins/select2/css/core.css">
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
              <li class="active">State-Wise Job Links</li>
            </ol> -->
          </section>
		  <form:form action="#" commandName="statewise" >
          <!-- Main content -->
          <section class="content">
           <div class="col-md-12">
              <!-- Primary box -->
              <div class="box box-solid box-primary" >
                <div class="box-header">
                  <h3 class="box-title"> <span class="glyphicon glyphicon-th"></span> <spring:eval expression="@viewPropertyConfigurer.getProperty('state.jobs')" /> </h3> 
                  <code>Find your best job..</code>
                  <div class="box-tools pull-right">
                    <button type="button" class="btn btn-primary btn-sm" title="BACK" onclick="location.href='load-jobcategories'"><i class="fa fa-backward"></i></button>
                    <button type="button" class="btn btn-primary btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                   <!--  <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button> -->
                  </div>
                </div>
                <div class="box-body">
                  <jsp:useBean id="now" class="java.util.Date" />
				  <fmt:formatDate var="curDate" value="${now}" pattern="dd MMM. yyyy" />
				  <fmt:formatDate var="curTime" value="${now}" pattern="HH:MM" />
			 <div class="col-sm-11 inputGroupContainer" style="right: 0px; left:-15px;">
        		<div class="input-group">
		           <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
		            <form:select path="statename" class="searchBoxList select2-single form-control">
                       <form:option value="">Search Your Job By Selecting State</form:option>
                       <c:forEach items="${stateList}" var="listofstates">
                       <form:option value="${listofstates.statename}">${listofstates.statename}</form:option>
                     </c:forEach>
                    </form:select>
		        </div>
		     </div>
		      <div class="col-sm-1" style="right: 0px;margin-right: -10px; float: right;">
		      <button type="button" class="btn btn-danger" id="clear"><span class="glyphicon glyphicon-hourglass"></span> CLEAR</button>
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
			  <c:forEach items="${jobsList}" var="jobsListData">
			    <li class="result well">
			        <!-- timeline icon -->
			        <i class="fa fa-globe bg-blue"></i>
			        <div class="timeline-item">
			       <span class="time"><label style="color:black;">STATE: ${jobsListData.statename}</label> <i class="fa fa-clock-o"></i>${curTime}</span>
					${jobsListData.comments}<br> Please Visit The Web Site For More Info:<br>
			            <h3 class="timeline-header"><a href="${jobsListData.linkaddress}" target="_blank"> ${jobsListData.linkname}</a> ...</h3>
			        </div>
			    </li>
			    </c:forEach>
			    <!-- timeline item -->
			    <%-- <li class="result well">
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
			    </li> --%>
    <!-- END timeline item -->
    

</ul>

<div id="pagingControls" class="text-right"></div>
<div id="showingInfo" class="well" style="margin-top:20px"></div>


                </div><!-- /.box-body -->
              </div><!-- /.box -->
              
            </div>
         

          </section><!-- /.content -->
          </form:form>
        </div><!-- /.container -->
      </div><!-- /.content-wrapper -->
      <%@include file="userNewFooter.jsp" %>
    </div><!-- ./wrapper -->

   <%@include file="userNewFooterJsLinks.jsp" %>
      <script src="${pageContext.request.contextPath}/theme/usernewdesign/pagination/Flexible.Pagination.js" type="text/javascript"></script>
    
    <script>
    $(function() {

        var flexiblePagination = $('#content').flexiblePagination({
            itemsPerPage : 10,
            itemSelector : 'li.result:visible',
            pagingControlsContainer : '#pagingControls',
            showingInfoSelector : '#showingInfo',
            css: {
            	  btnNumberingClass: 'btn btn-sm btn-default',
                  btnFirstClass: 'btn btn-sm btn-default',
                  btnLastClass: 'btn btn-sm btn-default',
                  btnNextClass: 'btn btn-sm btn-default',
                  btnPreviousClass: 'btn btn-sm btn-default',
                  btnActiveClass: 'btn btn-sm btn-primary'
            }
        });
        flexiblePagination.getController().onPageClick = function(pageNum, e){
            console.log('You Clicked Page: '+pageNum)
        };
        
    });

    </script>
    <!-- Select2 Plugin Plugin -->
  <script src="${pageContext.request.contextPath}/theme/vendor/plugins/select2/select2.min.js"></script>
    <script type="text/javascript">
         $(".select2-single").select2();
         $('#clear').click(function(){
        	$('#statename').val("");
        	 $(".select2-single").select2();
        	 location.reload(true);
        	});
       </script>
  </body>
</html>
