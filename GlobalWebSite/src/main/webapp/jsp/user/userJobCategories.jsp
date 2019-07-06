<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Job Categories</title>
  <%@include file="userNewHeader.jsp" %>
  </head>
  <!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
  <body class="skin-green layout-top-nav">
    <div class="wrapper">
      <!-- header logo: style can be found in header.less -->
       <%@include file="userTopMenu.jsp" %>
      <!-- Full Width Column -->
      <div class="content-wrapper">
        <div class="container-fluid">
          <!-- Content Header (Page header) -->
          <section class="content-header">
            <h1>
              Find your Jobs
              <small>There is a way to do it better...find it</small>
            </h1>
            <ol class="breadcrumb">
              <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
              <li class="active">Job Categories</li>
            </ol>
          </section>

          <!-- Main content -->
          <section class="content">
           <div class="col-md-12">
              <!-- Primary box -->
              <div class="box box-solid box-primary">
                <div class="box-header">
                  <h3 class="box-title">Job Categories</h3> <code>Find your best job..</code>
                  <div class="box-tools pull-right">
                    <button class="btn btn-primary btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                   <!--  <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button> -->
                  </div>
                </div>
                <div class="box-body">
                  <div class="row">
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-aqua" onclick="location.href='view-userpopularjobs'" style="cursor: pointer;">
		                <div class="inner">
		                  <h4>
		                    Popular Job Sites
		                  </h4>
		                  <p>
		                    11 Listing
		                  </p>
		                </div>
		                <div class="icon"><i class="fa fa-address-card-o" aria-hidden="true"></i>
		                </div>
		            
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-green" onclick="location.href='view-userstatewisejobs'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>State Wise Government Jobs</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="fa fa-map" aria-hidden="true"></i>
		                </div>
		             
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-yellow" onclick="location.href='view-usercentralgovjobs'" style="cursor: pointer;">
		                <div class="inner">
		                  <h4>Central Government Jobs</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                   <i class="fa fa-globe" aria-hidden="true"></i>
		                </div>
		               
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-red" onclick="location.href='view-userViewAbroadJobs'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>Abroad Jobs</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
						 <i class="fa fa-plane" aria-hidden="true"></i>
		                </div>
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-blue" onclick="location.href='view-useritjobs'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>IT Jobs</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="fa fa-fax" aria-hidden="true"></i>

		                </div>
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-purple" onclick="location.href='view-usernonitjobs'" style="cursor: pointer;">
		                <div class="inner">
		                  <h4>Non IT Jobs</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="fa fa-paper-plane-o" aria-hidden="true"></i>
		                </div>
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-teal" onclick="location.href='view-userconsultantsjobs'" style="cursor: pointer;">
		                <div class="inner">
		                  <h4>Job Consultants</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="fa fa-envelope-open" aria-hidden="true"></i>

		                </div>
		              </div>
            	    </div>
                  <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-maroon" onclick="location.href='view-userfreejobtraininginst'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>Free Job Training Institutes</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="fa fa-users" aria-hidden="true"></i>

		                </div>
		          
		              </div>
            	    </div>
                  </div>
                  <div class="row">
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-olive" onclick="location.href='view-usertrainingplacinst'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>Training & Placement Institutes</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
							<i class="fa fa-object-group" aria-hidden="true"></i>
		                </div>
		          
		              </div>
            	    </div>
            	     <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-lime" onclick="location.href='view-usertrainingplacinst'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>Training & Placement Institutes</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                 <i class="fa fa-certificate" aria-hidden="true"></i>

		                </div>
		          
		              </div>
            	    </div>
            	    <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-orange" onclick="location.href='view-userpostedbyadmin'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>Jobs Posted By Admin</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
						 <i class="fa fa-bullhorn" aria-hidden="true"></i>
		                </div>
		          
		              </div>
            	    </div>
            	    <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-fuchsia" onclick="location.href='view-useremployeepostedjobs'" style="cursor: pointer;">
		                <div class="inner">
		                 <h4>Employer Posted Jobs</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                   <i class="fa fa-envelope-open-o" aria-hidden="true"></i>
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
        </div><!-- /.container -->
      </div><!-- /.content-wrapper -->
       <%@include file="userNewFooter.jsp" %>
    </div><!-- ./wrapper -->

       <%@include file="userNewFooterJsLinks.jsp" %>
    
  </body>
</html>
