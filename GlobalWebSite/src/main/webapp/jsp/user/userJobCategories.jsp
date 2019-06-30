<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>AdminLTE 2 | Dashboard</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="${pageContext.request.contextPath}/theme/usernewdesign/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/theme/usernewdesign/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath}/theme/usernewdesign/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="../../https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="../../https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
  <!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
  <body class="skin-green layout-top-nav">
    <div class="wrapper">
      <!-- header logo: style can be found in header.less -->
      <header class="main-header">               
        <nav class="navbar navbar-static-top">
          <div class="container-fluid">
          <div class="navbar-header">
            <a href="#" class="navbar-brand"><b>Global </b>Job Portal</a>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
              <i class="fa fa-bars"></i>
            </button>
          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
              <li><a href="#">Link</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li><a href="#">Separated link</a></li>
                  <li class="divider"></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            <form class="navbar-form navbar-left" role="search">
              <div class="form-group">
                <input type="text" class="form-control" id="navbar-search-input" placeholder="Search">
              </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="#">Link</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li><a href="#">Separated link</a></li>
                </ul>
              </li>
            </ul>
          </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
      </header>
      <!-- Full Width Column -->
      <div class="content-wrapper">
        <div class="container-fluid">
          <!-- Content Header (Page header) -->
          <section class="content-header">
            <h1>
              Top Navigation
              <small>Example 2.0</small>
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
		              <div class="small-box bg-aqua">
		                <div class="inner">
		                  <h4>
		                    Popular Job Sites
		                  </h4>
		                  <p>
		                    11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="ion ion-job"></i>
		                </div>
		            
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-green">
		                <div class="inner">
		                 <h4>State Wise Government Jobs</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="ion ion-job"></i>
		                </div>
		             
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-yellow">
		                <div class="inner">
		                  <h4>Central Government Jobs</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="ion ion-job"></i>
		                </div>
		               
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-red">
		                <div class="inner">
		                 <h4>Abroad Jobs</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="ion ion-job"></i>
		                </div>
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-blue">
		                <div class="inner">
		                 <h4>IT Jobs</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="ion ion-job"></i>
		                </div>
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-purple">
		                <div class="inner">
		                  <h4>Non IT Jobs</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="ion ion-job"></i>
		                </div>
		              </div>
            	    </div>
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-teal">
		                <div class="inner">
		                  <h4>Job Consultants</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="ion ion-job"></i>
		                </div>
		              </div>
            	    </div>
                  <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-maroon" style="height:115px; max-height: 115px;">
		                <div class="inner">
		                 <h4>Free Job Training Institutes</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="ion ion-job"></i>
		                </div>
		          
		              </div>
            	    </div>
                  </div>
                  <div class="row">
                   <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-olive" style="height:115px; max-height: 115px;">
		                <div class="inner">
		                 <h4>Training & Placement Institutes</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="ion ion-job"></i>
		                </div>
		          
		              </div>
            	    </div>
            	     <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-lime" style="height:115px; max-height: 115px;">
		                <div class="inner">
		                 <h4>Training & Placement Institutes</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="ion ion-job"></i>
		                </div>
		          
		              </div>
            	    </div>
            	    <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-orange" style="height:115px; max-height: 115px;">
		                <div class="inner">
		                 <h4>Jobs Posted By Admin</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="ion ion-job"></i>
		                </div>
		          
		              </div>
            	    </div>
            	    <div class="col-lg-3 col-xs-6">
		              <!-- small box -->
		              <div class="small-box bg-fuchsia" style="height:115px; max-height: 115px;">
		                <div class="inner">
		                 <h4>Employer Posted Jobs</h4>
		                  <p>
		                   11 Listing
		                  </p>
		                </div>
		                <div class="icon">
		                  <i class="ion ion-job"></i>
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
      <footer class="main-footer">
        <div class="container-fluid">
          <div class="pull-right hidden-xs">
            <b>Version</b> 1.0
          </div>
           Global Website Development
        </div><!-- /.container -->
      </footer>
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="${pageContext.request.contextPath}/theme/usernewdesign/plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath}/theme/usernewdesign/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- SlimScroll -->
    <script src="${pageContext.request.contextPath}/theme/usernewdesign./plugins/slimScroll/jquery.slimScroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='${pageContext.request.contextPath}/theme/usernewdesign/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath}/theme/usernewdesign/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath}/theme/usernewdesign/dist/js/demo.js" type="text/javascript"></script>
  </body>
</html>
