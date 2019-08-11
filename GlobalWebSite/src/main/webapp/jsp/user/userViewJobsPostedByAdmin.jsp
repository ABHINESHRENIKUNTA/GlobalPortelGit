<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title><spring:eval expression="@viewPropertyConfigurer.getProperty('postedbyadmin.jobs')" /></title>
  <%@include file="userNewHeader.jsp" %>
<%@include file="jobDetailsCss.jsp" %>
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
           <!--  <ol class="breadcrumb">
              <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
              <li class="active">Employer Posted Job Links</li>
            </ol> -->
          </section>

          <!-- Main content -->
          <section class="content">
           <div class="col-md-12">
              <!-- Primary box -->
              <div class="box box-solid box-primary">
                <div class="box-header">
                  <h3 class="box-title"><spring:eval expression="@viewPropertyConfigurer.getProperty('postedbyadmin.jobs')" /></h3> <code>Find your best job..</code>
                  <div class="box-tools pull-right">
                    <button class="btn btn-primary btn-sm" title="BACK" onclick="location.href='load-jobcategories'"><i class="fa fa-backward"></i></button>
                    <button class="btn btn-primary btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                   <!--  <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button> -->
                  </div>
                </div>
                <div class="box-body">
                  <div class="row">
            <div class="col-md-3">
              <a href="#" class="btn btn-primary btn-block margin-bottom">Search Jobs</a>
            <div class="widget">
            <h4 class="widget-title">Jobs By Title</h4>
            <ul class="optionlist">
              <li>
                <input type="checkbox" name="checkname" id="webdesigner">
                <label for="webdesigner"></label>
                Web Designer <span>12</span> </li>
              <li>
                <input type="checkbox" name="checkname" id="3dgraphic">
                <label for="3dgraphic"></label>
                3D Graphic Designer <span>33</span> </li>
              <li>
                <input type="checkbox" name="checkname" id="graphic">
                <label for="graphic"></label>
                Graphic Designer <span>33</span> </li>
              <li>
                <input type="checkbox" name="checkname" id="electronicTech">
                <label for="electronicTech"></label>
                Electronics Technician <span>33</span> </li>
              <li>
                <input type="checkbox" name="checkname" id="webgraphic">
                <label for="webgraphic"></label>
                Web / Graphic Designer <span>33</span> </li>
              <li>
                <input type="checkbox" name="checkname" id="brandmanager">
                <label for="brandmanager"></label>
                Brand Manager <span>33</span> </li>
            </ul>
            <!-- title end --> 
           </div>
              <div class="box box-solid">
                <!-- <div class="box-header with-border">
                  <h3 class="box-title">Labels</h3>
                </div> --> 
                <div class="box-body no-padding">
                  <div class="widget">
            <h4 class="widget-title">Jobs By Industry</h4>
            <ul class="optionlist">
              <li>
                <input type="checkbox" name="checkname" id="infotech">
                <label for="infotech"></label>
                Information Technology <span>22</span> </li>
              <li>
                <input type="checkbox" name="checkname" id="advertise">
                <label for="advertise"></label>
                Advertising/PR <span>45</span> </li>
              <li>
                <input type="checkbox" name="checkname" id="services">
                <label for="services"></label>
                Services <span>44</span> </li>
              <li>
                <input type="checkbox" name="checkname" id="health">
                <label for="health"></label>
                Health &amp; Fitness <span>88</span> </li>
              <li>
                <input type="checkbox" name="checkname" id="mediacomm">
                <label for="mediacomm"></label>
                Media/Communications <span>22</span> </li>
              <li>
                <input type="checkbox" name="checkname" id="fashion">
                <label for="fashion"></label>
                Fashion <span>11</span> </li>
            </ul>
             </div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
            <div class="col-md-9">
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Jobs Inbox</h3>
                  <div class="box-tools pull-right">
                    <div class="has-feedback">
                      <input type="text" class="form-control input-sm" placeholder="Search Jobs">
                      <span class="glyphicon glyphicon-search form-control-feedback"></span>
                    </div>
                  </div><!-- /.box-tools -->
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                <ul class="searchList" id="content">
         
          <!-- job start -->
          <c:forEach items="${listData}" var="jobDetails" varStatus="loop">
          <li class="content-result">
            <div class="row">
              <div class="col-md-8 col-sm-8">
                <div class="jobimg"><i class="fa fa-black-tie fa-5x" aria-hidden="true" style="color:#DDDDDD;"></i></div>
                <div class="jobinfo">
                  <h3><a href="#.">${jobDetails.jobtitle}</a></h3>
                  <div class="companyName"><a href="#.">${jobDetails.company}</a></div>
                  <div class="location"><label class="fulltime">${jobDetails.jobtype}</label>   - <span>${jobDetails.location}</span></div>
                </div>
                <div class="clearfix"></div>
              </div>
              <div class="col-md-4 col-sm-4">
                <form action="view-userpostedbyadminid" >
                <div class="listbtn"><button class="btn btn-primary">View More</button></div>
                <input type="hidden" name="rowid" value="${jobDetails.rowid}"/>
                </form>
              </div>
            </div>
            <p style="white-space: nowrap; width: 99%; overflow: hidden; text-overflow: ellipsis;">${jobDetails.skillreq}</p>
          </li>
          </c:forEach>
          <!-- job end --> 
          
         
          
          <!-- job start -->
          <!--  <li class="content-result">
            <div class="row">
              <div class="col-md-8 col-sm-8">
                <div class="jobimg"><i class="fa fa-black-tie fa-5x" aria-hidden="true" style="color:#DDDDDD;"></i></div>
                <div class="jobinfo">
                  <h3><a href="#.">Technical Database Engineer</a></h3>
                  <div class="companyName"><a href="#.">Datebase Management Company</a></div>
                  <div class="location"><label class="partTime">Part Time</label>   - <span>New York</span></div>
                </div>
                <div class="clearfix"></div>
              </div>
              <div class="col-md-4 col-sm-4">
                <div class="listbtn"><a href="#.">View More</a></div>
              </div>
            </div>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce venenatis arcu est. Phasellus vel dignissim tellus. Aenean fermentum fermentum convallis.</p>
          </li> -->
          <!-- job end -->
          
        </ul>
                  
                </div><!-- /.box-body -->
     
              </div><!-- /. box -->
               <div class="box-footer">
               <div class="col-md-4 col-sm-4"><div id="showingInfo" ></div></div>
               <div class="col-md-8 col-sm-8 text-right"> <div  id="pagination"></div></div>
             

                 </div>
            </div><!-- /.col -->
            
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
       <%@include file="jobDetailsPaginationJS.jsp" %>
    
  </body>
</html>
