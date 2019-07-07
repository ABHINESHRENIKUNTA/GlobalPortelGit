 <!-- Start: Sidebar -->
    <aside id="sidebar_left" class="nano nano-light affix">

      <!-- Start: Sidebar Left Content -->
      <div class="sidebar-left-content nano-content">

        <!-- Start: Sidebar Header -->
        <header class="sidebar-header">

          <!-- Sidebar Widget - Author -->
          <div class="sidebar-widget author-widget">
            <div class="media">
              <a class="media-left" href="#">
                <img src="${pageContext.request.contextPath}/theme/assets/img/avatars/admin.jpg" class="img-responsive">
              </a>
              <div class="media-body">
                <div class="media-links">
                   <a href="#" class="sidebar-menu-toggle">Welcome Admin</a>
                </div>
                <div class="media-author"><%=session.getAttribute("username")%></div>
              </div>
            </div>
          </div>

          <!-- Sidebar Widget - Menu (slidedown) -->
         <!--  <div class="sidebar-widget menu-widget">
            <div class="row text-center mbn">
              <div class="col-xs-4">
                <a href="dashboard.html" class="text-primary" data-toggle="tooltip" data-placement="top" title="Dashboard">
                  <span class="glyphicon glyphicon-home"></span>
                </a>
              </div>
              <div class="col-xs-4">
                <a href="pages_messages.html" class="text-info" data-toggle="tooltip" data-placement="top" title="Messages">
                  <span class="glyphicon glyphicon-inbox"></span>
                </a>
              </div>
              <div class="col-xs-4">
                <a href="pages_profile.html" class="text-alert" data-toggle="tooltip" data-placement="top" title="Tasks">
                  <span class="glyphicon glyphicon-bell"></span>
                </a>
              </div>
              <div class="col-xs-4">
                <a href="pages_timeline.html" class="text-system" data-toggle="tooltip" data-placement="top" title="Activity">
                  <span class="fa fa-desktop"></span>
                </a>
              </div>
              <div class="col-xs-4">
                <a href="pages_profile.html" class="text-danger" data-toggle="tooltip" data-placement="top" title="Settings">
                  <span class="fa fa-gears"></span>
                </a>
              </div>
              <div class="col-xs-4">
                <a href="pages_gallery.html" class="text-warning" data-toggle="tooltip" data-placement="top" title="Cron Jobs">
                  <span class="fa fa-flask"></span>
                </a>
              </div>
            </div>
          </div> -->

          <!-- Sidebar Widget - Search (hidden) -->
          <div class="sidebar-widget search-widget hidden">
            <div class="input-group">
              <span class="input-group-addon">
                <i class="fa fa-search"></i>
              </span>
              <input type="text" id="sidebar-search" class="form-control" placeholder="Search...">
            </div>
          </div>

        </header>
        

        <!-- Start: Sidebar Menu -->
        <ul class="nav sidebar-menu">
          <li class="sidebar-label pt20">Menu</li>
          
           <li>
            <a class="accordion-toggle" href="#">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">User Dash board</span>
              <span class="caret"></span>
            </a>
            <ul class="nav sub-nav">
            <li>
                <a href="AdminAddImagesForUser" >
                  <span class="fa fa fa-arrows-h"></span>
                  User Dash board Images
                </a>
               </li>
              <li>
              <a href="addScrollLink" >
                  <span class="fa fa fa-arrows-h"></span>
                 Scroll Links
                </a>
                 
               </li>
                 <li>
                <a href="#">
                  <span class="fa fa fa-arrows-h"></span>
                  Popular Links
                </a>
               </li>
         
             </ul>
          </li>       
           
           
              <li>
              <a href="view-rolepermissions" >
                  <span class="fa fa-university"></span>
                  <span class="sidebar-title">Assign Permissions</span>
                </a>
               </li>
              
            
         
             <li>
              <a href="load-adminviewcommoninfo?selectedparam=global_popular_jobsites_page">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Popular Job Sites</span>
            </a>
            </li> 
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_statewisegovt_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">State-wise Govt. Jobs</span>
            </a>
            </li> 
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_centralgov_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Central Govt. Jobs</span>
            </a>
            </li> 
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_it_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">IT Jobs</span>
            </a>
            </li> 
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_nonit_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Non IT Jobs</span>
            </a>
            </li> 
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_jobconsult_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Job Consultants</span>
            </a>
            </li> 
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_refpost_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Referral Posted Jobs</span>
            </a>
            </li> 
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_postedbyadmin_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Jobs Posted By Admin</span>
            </a>
            </li> 
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_trainingandplace_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Training & Placement Inst.</span>
            </a>
            </li> 
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_freejobtraining_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Free Job Training Inst.</span>
            </a>
            </li> 
             
        </ul>
        <!-- End: Sidebar Menu -->

	      <!-- Start: Sidebar Collapse Button -->
	      <div class="sidebar-toggle-mini">
	        <a href="#">
	          <span class="fa fa-sign-out"></span>
	        </a>
	      </div>
	      <!-- End: Sidebar Collapse Button -->

      </div>
      <!-- End: Sidebar Left Content -->

    </aside>
    <!-- End: Sidebar Left -->