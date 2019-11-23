 <!-- Start: Sidebar -->
    <%@page import="com.globalwebsite.admin.model.AdminRolePermissionModel"%>
<%@page import="java.util.ArrayList"%>

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
                   <a href="#" class="sidebar-menu-toggle">Welcome</a>
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
           <c:set value="nopermission" var="admindashboard"></c:set>
           <c:set value="nopermission" var="permissions"></c:set>
           <c:set value="nopermission" var="organization"></c:set>
           <c:set value="nopermission" var="operators"></c:set>
           <c:set value="nopermission" var="abroadjobs"></c:set>
           <c:set value="nopermission" var="popularjobs"></c:set>
           <c:set value="nopermission" var="statewisejobs"></c:set>
           <c:set value="nopermission" var="centralgovtjobs"></c:set>
           <c:set value="nopermission" var="itjobs"></c:set>
           <c:set value="nopermission" var="nonitjobs"></c:set>
           <c:set value="nopermission" var="jobconsultants"></c:set>
           <c:set value="nopermission" var="referralpostjobs"></c:set>
           <c:set value="nopermission" var="postedbyadminjobs"></c:set>
           <c:set value="nopermission" var="employerpostedjobs"></c:set>
           <c:set value="nopermission" var="trainingplacejobs"></c:set>
           <c:set value="nopermission" var="freetrainingjobs"></c:set>
           <c:set value="nopermission" var="admitcards"></c:set>
           <c:set value="nopermission" var="results"></c:set>
           <%
           @SuppressWarnings("unchecked")
           ArrayList<AdminRolePermissionModel> list = (ArrayList<AdminRolePermissionModel>)request.getSession().getAttribute("leftMenuList");
		   request.setAttribute("leftMenuListjsp", list);
           %>
           <c:set var="leftMenuList" value="${leftMenuListjsp}"></c:set>
          <c:forEach items="${leftMenuList}" var="menulist">
          
            <c:if test="${menulist.permname == 'VIEW_ADMIN_DASHBOARD'}">
            <c:set value="yespermission" var="admindashboard"></c:set>
            </c:if> 
            
            <c:if test="${menulist.permname == 'VIEW_PERMISSIONS'  or menulist.permname == 'EDIT_PERMISSIONS'}">
            <c:set value="yespermission" var="permissions"></c:set>
            </c:if> 
            
            <c:if test="${menulist.permname == 'VIEW_OPERATORS'  or menulist.permname == 'EDIT_OPERATORS'}">
            <c:set value="yespermission" var="operators"></c:set>
            </c:if> 
            
            <c:if test="${menulist.permname == 'VIEW_ORGANIZATION'  or menulist.permname == 'EDIT_ORGANIZATION'}">
            <c:set value="yespermission" var="organization"></c:set>
            </c:if> 
           
            <c:if test="${menulist.permname == 'VIEW_ABROAD_JOBS'  or menulist.permname == 'EDIT_ABROAD_JOBS'}">
            <c:set value="yespermission" var="abroadjobs"></c:set>
       	    </c:if>
       	    
            <c:if test="${menulist.permname == 'VIEW_POPULAR_JOBSITES_PAGE'  or menulist.permname == 'EDIT_POPULAR_JOBSITES_PAGE'}">
            <c:set value="yespermission" var="popularjobs"></c:set>
       	    </c:if>
       	   
       	    <c:if test="${menulist.permname == 'VIEW_STATEWISEGOVT_JOBS'  or menulist.permname == 'EDIT_STATEWISEGOVT_JOBS'}">
       	    <c:set value="yespermission" var="statewisejobs"></c:set>
            </c:if>
          
            <c:if test="${menulist.permname == 'VIEW_CENTRALGOV_JOBS'  or menulist.permname == 'EDIT_CENTRALGOV_JOBS'}">
            <c:set value="yespermission" var="centralgovtjobs"></c:set>
            </c:if>
           
           <c:if test="${menulist.permname == 'VIEW_IT_JOBS'  or menulist.permname == 'EDIT_IT_JOBS'}">
           <c:set value="yespermission" var="itjobs"></c:set>
            </c:if>
            
            <c:if test="${menulist.permname == 'VIEW_NONIT_JOBS'  or menulist.permname == 'EDIT_NONIT_JOBS'}">
            <c:set value="yespermission" var="nonitjobs"></c:set>
            </c:if>
            
            <c:if test="${menulist.permname == 'VIEW_JOBCONSULT_JOBS'  or menulist.permname == 'EDIT_JOBCONSULT_JOBS'}">
            <c:set value="yespermission" var="jobconsultants"></c:set>
            </c:if>  
                    
            <c:if test="${menulist.permname == 'VIEW_REFPOST_JOBS'  or menulist.permname == 'EDIT_REFPOST_JOBS'}">
            <c:set value="yespermission" var="referralpostjobs"></c:set>
            </c:if>
            
            <c:if test="${menulist.permname == 'VIEW_POSTEDBYADMIN_JOBS'  or menulist.permname == 'EDIT_POSTEDBYADMIN_JOBS'}">
            <c:set value="yespermission" var="postedbyadminjobs"></c:set>
            </c:if>
            
            <c:if test="${menulist.permname == 'VIEW_EMPLOYEE_POSTED_JOBS'  or menulist.permname == 'EDIT_EMPLOYEE_POSTED_JOBS'}">
            <c:set value="yespermission" var="employerpostedjobs"></c:set>
            </c:if>
            
            <c:if test="${menulist.permname == 'VIEW_TRAININGANDPLACE_JOBS'  or menulist.permname == 'EDIT_TRAININGANDPLACE_JOBS'}">
             <c:set value="yespermission" var="trainingplacejobs"></c:set>
            </c:if>  
                      
            <c:if test="${menulist.permname == 'VIEW_FREEJOBTRAINING_JOBS'  or menulist.permname == 'EDIT_FREEJOBTRAINING_JOBS'}">
            <c:set value="yespermission" var="freetrainingjobs"></c:set>
            </c:if>
            
            <c:if test="${menulist.permname == 'VIEW_ADMIT_CARDS'  or menulist.permname == 'EDIT_ADMIT_CARDS'}">
            <c:set value="yespermission" var="admitcards"></c:set>
            </c:if>
            
            <c:if test="${menulist.permname == 'VIEW_RESULTS'  or menulist.permname == 'EDIT_RESULTS'}">
            <c:set value="yespermission" var="results"></c:set>
            </c:if>
            
          </c:forEach>  
         
          <!--  <li>
            <a class="accordion-toggle" href="#"> 
            <a class="" href="view-admindashboard">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Dash board</span>
              <span class="caret"></span>
            </a>
            <!-- <ul class="nav sub-nav">
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
          </li>  -->     
           <c:if test="${admindashboard == 'yespermission'}">
              <li>
               <a class="" href="view-admindashboard">
              	<span class="fa fa-user"></span>
              	<span class="sidebar-title">Dash board</span>
              	<span class="caret"></span>
           		</a>
               </li>
           </c:if>
           <c:if test="${operators == 'yespermission'}">
              <li>
                <a href="view-operators" >
                  <span class="fa fa-university"></span>
                  <span class="sidebar-title">View Operators</span>
                </a>
               </li>
           </c:if>
             <c:if test="${permissions == 'yespermission'}">
              <li>
              <a href="view-rolepermissions" >
                  <span class="fa fa-university"></span>
                  <span class="sidebar-title">Assign Permissions</span>
                </a>
               </li>
             </c:if> 
             <c:if test="${organization == 'yespermission'}">
              <li>
              <a href="adminvieworg" >
                  <span class="fa fa-university"></span>
                  <span class="sidebar-title">View Organization</span>
                </a>
               </li>
             </c:if> 
            
           <c:if test="${abroadjobs == 'yespermission'}">
             <li>
              <a href="load-adminviewcommoninfo?selectedparam=global_abroad_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Abroad Jobs</span>
            </a>
            </li> 
       	  </c:if> 
       	  
           <c:if test="${popularjobs == 'yespermission'}">
             <li>
              <a href="load-adminviewcommoninfo?selectedparam=global_popular_jobsites_page">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Popular Job Sites</span>
            </a>
            </li> 
       	  </c:if> 
       	  
       	  <c:if test="${statewisejobs == 'yespermission'}">
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_statewisegovt_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">State-wise Govt. Jobs</span>
            </a>
            </li> 
            </c:if>
            
            <c:if test="${centralgovtjobs== 'yespermission'}">
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_centralgov_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Central Govt. Jobs</span>
            </a>
            </li> 
            </c:if>
            
            <c:if test="${itjobs == 'yespermission'}">
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_it_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">IT Jobs</span>
            </a>
            </li> 
            </c:if>
            
            <c:if test="${nonitjobs == 'yespermission'}">
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_nonit_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Non IT Jobs</span>
            </a>
            </li> 
            </c:if>
            
            <c:if test="${jobconsultants == 'yespermission'}">
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_jobconsult_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Job Consultants</span>
            </a>
            </li> 
            </c:if>
            
            <c:if test="${referralpostjobs == 'yespermission'}">
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_refpost_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Referral Posted Jobs</span>
            </a>
            </li> 
            </c:if>
            
            <c:if test="${postedbyadminjobs == 'yespermission'}">
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_postedbyadmin_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Jobs Posted By Admin</span>
            </a>
            </li> 
            </c:if>
            
            <c:if test="${employerpostedjobs == 'yespermission'}">
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_empposted_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Employer Posted Jobs</span>
            </a>
            </li> 
            </c:if>
            
            <c:if test="${trainingplacejobs == 'yespermission'}">
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_trainingandplace_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Training & Placement Inst.</span>
            </a>
            </li> 
            </c:if>
            
            <c:if test="${freetrainingjobs == 'yespermission'}">
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_freejobtraining_jobs">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Free Job Training Inst.</span>
            </a>
            </li> 
            </c:if>
            <c:if test="${admitcards == 'yespermission'}">
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_admit_cards">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Admit Cards</span>
            </a>
            </li> 
            </c:if>
            <c:if test="${results == 'yespermission'}">
             <li>
               <a href="load-adminviewcommoninfo?selectedparam=global_results">
              <span class="fa fa-user"></span>
              <span class="sidebar-title">Results</span>
            </a>
            </li> 
            </c:if>
             
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