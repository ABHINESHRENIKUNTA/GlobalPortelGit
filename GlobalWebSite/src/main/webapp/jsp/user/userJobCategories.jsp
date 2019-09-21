<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Job Categories</title>
  <%@include file="userNewHeader.jsp" %>

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
            <!-- <ol class="breadcrumb">
              <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
              <li class="active">Job Categories</li>
            </ol> -->
          </section>

          <!-- Main content -->
          <section class="content">
           <div class="col-md-12">
              <!-- Primary box -->
              <div class="box box-solid bg-gray" style="box-shadow: 10px 10px 5px #888888;  border-radius: 15px">
               <%--  <div class="box-header" style=" border-radius: 15px;">
                  <h3 class="box-title"><span class="glyphicon glyphicon-th"></span> Job Categories</h3> <code>Find your best job..</code>
                  <!-- <div class="box-tools pull-right">
                    <button class="btn btn-purple btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div> -->
                </div> --%>
                <div class="box-body">
                  <div class="row">
                   <div class="col-lg-3 col-xs-6" >
		              <!-- small box -->
		              <div class="small-box bg-white" style=" border-radius: 15px 25px ;" onclick="location.href='<spring:eval expression="@viewPropertyConfigurer.getProperty('popular.url')" />'" style="cursor: pointer;">
		                <div class="inner">
		                  <h4>
		                    Popular Job Sites
		                  </h4>
		                  <p>
		                    ${popularcnt} Listing
		                  </p>
		                </div>
		               <!--  <div class="icon"><i class="fa fa-address-card-o" aria-hidden="true"></i>
		                </div> -->
		            
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-white" style=" border-radius: 15px 25px ;" onclick="location.href='<spring:eval expression="@viewPropertyConfigurer.getProperty('statewisejobs.url')" />'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>State Wise Government Jobs</h4>
		                  <p>
		                   ${statecnt} Listing
		                  </p>
		                </div>
		               <!--  <div class="icon">
		                  <i class="fa fa-map" aria-hidden="true"></i>
		                </div> -->
		             
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-white" style=" border-radius: 15px 25px ;" onclick="location.href='<spring:eval expression="@viewPropertyConfigurer.getProperty('centralgov.url')" />'" style="cursor: pointer;">
		                <div class="inner">
		                  <h4>Central Government Jobs</h4>
		                  <p>
		                   ${centralcnt} Listing
		                  </p>
		                </div>
		                <!-- <div class="icon">
		                   <i class="fa fa-globe" aria-hidden="true"></i>
		                </div> -->
		               
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-white" style=" border-radius: 15px 25px ;" onclick="location.href='<spring:eval expression="@viewPropertyConfigurer.getProperty('abroadjobs.url')" />'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>Abroad Jobs</h4>
		                  <p>
		                   ${abroadcnt} Listing
		                  </p>
		                </div>
		                <!-- <div class="icon">
						 <i class="fa fa-plane" aria-hidden="true"></i>
		                </div> -->
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-white" style=" border-radius: 15px 25px ;" onclick="location.href='<spring:eval expression="@viewPropertyConfigurer.getProperty('itjobs.url')" />'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>IT Jobs</h4>
		                  <p>
		                   ${itcnt} Listing
		                  </p>
		                </div>
		                <!-- <div class="icon">
		                  <i class="glyphicon glyphicon-info-sign" aria-hidden="true"></i>

		                </div> -->
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-white" style=" border-radius: 15px 25px ;" onclick="location.href='<spring:eval expression="@viewPropertyConfigurer.getProperty('nonitjobs.url')" />'" style="cursor: pointer;">
		                <div class="inner">
		                  <h4>Non IT Jobs</h4>
		                  <p>
		                   ${nonitcnt} Listing
		                  </p>
		                </div>
		                <!-- <div class="icon">
		                  <i class="fa fa-paper-plane-o" aria-hidden="true"></i>
		                </div> -->
		              </div>
            	    </div>
                   
                  <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-white" style=" border-radius: 15px 25px ;" onclick="location.href='<spring:eval expression="@viewPropertyConfigurer.getProperty('freejobtraining.url')" />'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>Free Job Training Institutes</h4>
		                  <p>
		                   ${freecnt} Listing
		                  </p>
		                </div>
		                <!-- <div class="icon">
		                  <i class="fa fa-users" aria-hidden="true"></i>
		                </div> -->
		              </div>
            	    </div>
            	    
            	    <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-white" style=" border-radius: 15px 25px ;" onclick="location.href='<spring:eval expression="@viewPropertyConfigurer.getProperty('trainingplacmnt.url')" />'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>Training & Placement Institutes</h4>
		                  <p>
		                   ${placementcnt} Listing
		                  </p>
		                </div>
		                <!-- <div class="icon">
							<i class="fa fa-object-group" aria-hidden="true"></i>
		                </div> -->
		          
		              </div>
            	    </div>
            	    
                  </div>
                  <div class="row">
            	    <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-white" style=" border-radius: 15px 25px ;" onclick="location.href='<spring:eval expression="@viewPropertyConfigurer.getProperty('postedbyconsultants.url')" />'" style="cursor: pointer;">
		                <div class="inner">
		                  <h4>Jobs Posted By Consultants</h4>
		                  <p>
		                   ${consultantcnt} Listing
		                  </p>
		                </div>
		                <!-- <div class="icon">
		                  <i class="fa fa-envelope-open" aria-hidden="true"></i>

		                </div> -->
		              </div>
            	    </div>
            	     <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-white" style=" border-radius: 15px 25px ;" onclick="location.href='<spring:eval expression="@viewPropertyConfigurer.getProperty('postedbyreferral.url')" />'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>Referral Jobs</h4>
		                  <p>
		                   ${referralcnt} Listing
		                  </p>
		                </div>
		                <!-- <div class="icon">
		                 <i class="glyphicon glyphicon-registration-mark" aria-hidden="true"></i>

		                </div> -->
		          
		              </div>
            	    </div>
            	    <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-white" style=" border-radius: 15px 25px ;" onclick="location.href='<spring:eval expression="@viewPropertyConfigurer.getProperty('postedbyadmin.url')" />'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>Jobs Posted By Admin</h4>
		                  <p>
		                   ${admincnt} Listing
		                  </p>
		                </div>
		               <!--  <div class="icon">
						 <i class="fa fa-bullhorn" aria-hidden="true"></i>
		                </div> -->
		          
		              </div>
            	    </div>
            	    <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-white" style=" border-radius: 15px 25px ;" onclick="location.href='<spring:eval expression="@viewPropertyConfigurer.getProperty('postedbyemp.url')" />'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>Employer Posted Jobs</h4>
		                  <p>
		                   ${empcnt} Listing
		                  </p>
		                </div>
		                <!-- <div class="icon">
		                   <i class="fa fa-envelope-open-o" aria-hidden="true"></i>
		                </div> -->
		          
		              </div>
            	    </div>
                  </div>
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
       
       
    
  </body>
</html>
