 <!-- header logo: style can be found in header.less -->
      <header class="main-header">               
        <nav class="navbar navbar-static-top">
          <div class="container-fluid">
          <div class="navbar-header">
            <a href="load-jobcategories" class="navbar-brand"><b>Global </b>Job Portal</a>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
              <i class="fa fa-bars"></i>
            </button>
          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="view-userpopularjobs"><span class="glyphicon glyphicon-eye-open"></span> Popular Jobs</a></li>
              <li><a href="load-jobcategories"><span class="glyphicon glyphicon-globe"></span> Job Categories</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-envelope"></span> More Jobs<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="<spring:eval expression="@viewPropertyConfigurer.getProperty('popular.url')" />">
                  <spring:eval expression="@viewPropertyConfigurer.getProperty('popular.jobs')" />
                  </a></li>
                  <li><a href="<spring:eval expression="@viewPropertyConfigurer.getProperty('centralgov.url')" />">
                  <spring:eval expression="@viewPropertyConfigurer.getProperty('central.jobs')" />
                  </a></li>
                  <li><a href="<spring:eval expression="@viewPropertyConfigurer.getProperty('itjobs.url')" />">
                  <spring:eval expression="@viewPropertyConfigurer.getProperty('it.jobs')" />
                  </a></li>
                  <li><a href="<spring:eval expression="@viewPropertyConfigurer.getProperty('nonitjobs.url')" />">
                  <spring:eval expression="@viewPropertyConfigurer.getProperty('nonit.jobs')" />
                  </a></li>
                  <li><a href="<spring:eval expression="@viewPropertyConfigurer.getProperty('freejobtraining.url')" />">
                  <spring:eval expression="@viewPropertyConfigurer.getProperty('freejobtraining.jobs')" />
                  </a></li>
                  <li><a href="<spring:eval expression="@viewPropertyConfigurer.getProperty('trainingplacmnt.url')" />">
                  <spring:eval expression="@viewPropertyConfigurer.getProperty('trainingandplace.jobs')" />
                  </a></li>
                  <li class="divider"></li>
                  <li><a href="<spring:eval expression="@viewPropertyConfigurer.getProperty('statewisejobs.url')" />">
                  <spring:eval expression="@viewPropertyConfigurer.getProperty('state.jobs')" />
                  </a></li>
                  <li><a href="<spring:eval expression="@viewPropertyConfigurer.getProperty('abroadjobs.url')" />">
                  <spring:eval expression="@viewPropertyConfigurer.getProperty('abroad.jobs')" />
                  </a></li>
                  <li class="divider"></li>
                  <li><a href="<spring:eval expression="@viewPropertyConfigurer.getProperty('postedbyconsultants.url')" />">
                  <spring:eval expression="@viewPropertyConfigurer.getProperty('jobconsult.jobs')" />
                  </a></li>
                  <li><a href="<spring:eval expression="@viewPropertyConfigurer.getProperty('postedbyreferral.url')" />">
                  <spring:eval expression="@viewPropertyConfigurer.getProperty('refpost.jobs')" />
                  </a></li>
                  <li><a href="<spring:eval expression="@viewPropertyConfigurer.getProperty('postedbyadmin.url')" />">
                  <spring:eval expression="@viewPropertyConfigurer.getProperty('postedbyadmin.jobs')" />
                  </a></li>
                  <li><a href="<spring:eval expression="@viewPropertyConfigurer.getProperty('postedbyemp.url')" />">
                  <spring:eval expression="@viewPropertyConfigurer.getProperty('employee.jobs')" />
                  </a></li>
                </ul>
              </li>
            </ul>
            <form class="navbar-form navbar-left" role="search">
              <div class="form-group">
                <input type="text" class="form-control" id="navbar-search-input" placeholder="Search">
              </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="view-adminLogin" class="btn btn-warning"> <span class="glyphicon glyphicon-user"></span> Employee Login </a></li>
              <!-- <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li><a href="#">Separated link</a></li>
                </ul>
              </li> -->
            </ul>
          </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
      </header>