<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>
      <spring:eval expression="@viewPropertyConfigurer.getProperty('refpost.jobs')" />
    </title>
    <%@include file="userNewHeader.jsp" %>
    <%@include file="jobDetailsCss.jsp" %>
  
  </head>
  <!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
  <body class="
  <spring:eval expression="@viewPropertyConfigurer.getProperty('topmenu.color')" />
  layout-top-nav">
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
        
        </section>
        <!-- Main content -->
        <section class="content">
          <div class="col-md-12">
            <!-- Primary box -->
            <div class="box box-solid box-<spring:eval expression="@viewPropertyConfigurer.getProperty('box.header.color')" />" >
              <div class="box-header">
                <h3 class="box-title">
                  <spring:eval expression="@viewPropertyConfigurer.getProperty('refpost.jobs')" />
                </h3>
                <code>Find your best job..</code>
                <div class="box-tools pull-right">
                  <button class="btn btn-<spring:eval expression="@viewPropertyConfigurer.getProperty('box.header.color')" /> btn-sm" title="BACK" onclick="location.href='load-jobcategories'"><i class="fa fa-backward"></i></button>
                  <button class="btn btn-<spring:eval expression="@viewPropertyConfigurer.getProperty('box.header.color')" /> btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  <!--  <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button> -->
                </div>
              </div>
              <div class="box-body">
                <div class="row">
                  <div class="col-md-3">
                    <a href="#" class="btn btn-primary btn-block margin-bottom" onclick="location.href='view-userreferraljobs'">Clear Filters</a>
                    <form:form action="view-userreferraljobs" id="industryform" commandName="filterdetails">
                      <input type="hidden" name="tablekey" id="tablekey" value="${tablekey}">
                      <div class="widget">
                        <h4 class="widget-title">Jobs By Type</h4>
                        <ul class="optionlist">
                          <li>
                <c:choose>
                <c:when test="${jobtype eq 'Contractor'}">
                <input type="radio" name="jobtype" id="Contractor" class="filterjob" value="Contractor" checked="checked" onclick="test('Contractor')">
                </c:when>
                 <c:otherwise>
                <input type="radio" name="jobtype" id="Contractor" class="filterjob" value="Contractor" onclick="test('Contractor')">
                </c:otherwise>
                </c:choose>
                <label for="Contractor"></label>
               	Contractor <span></span> </li>
              <li>
               <c:choose>
                <c:when test="${jobtype eq 'Full-time'}">
                <input type="radio" name="jobtype" id="Full-time" class="filterjob" value="Full-time" checked="checked" onclick="test('Full-time')">
                </c:when>
                <c:otherwise>
                <input type="radio" name="jobtype" id="Full-time" class="filterjob" value="Full-time" onclick="test('Full-time')">
                
                </c:otherwise>
                </c:choose>
                <label for="Full-time"></label>
               	Full-time <span></span> </li>
              <li>
               <c:choose>
                <c:when test="${jobtype eq 'Internship'}">
                <input type="radio" name="jobtype" id="Internship" class="filterjob" value="Internship" checked="checked" >
                </c:when>
                <c:otherwise>
                 <input type="radio" name="jobtype" id="Internship" class="filterjob" value="Internship" >
                </c:otherwise>
                </c:choose>
                <label for="Internship"></label>
               	Internship <span></span> </li>
              <li>
               <c:choose>
                <c:when test="${jobtype eq 'Part-Time'}">
                <input type="radio" name="jobtype" id="Part-Time" class="filterjob" value="Part-Time" checked="checked" >
                </c:when>
                <c:otherwise>
                <input type="radio" name="jobtype" id="Part-Time" class="filterjob" value="Part-Time" >
                </c:otherwise>
                </c:choose>
                <label for="Part-Time"></label>
                Part-Time <span></span> </li>
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
                              <c:forEach items="${industryList}" var="industrydata">
                                <li>
                                 <c:choose>
					              <c:when test="${industrydataval eq industrydata.jobid}">
					               <input type="radio" name="industryid" class="filterjob" id="${industrydata.jobname}" checked="checked" value="${industrydata.jobid}">
					              </c:when>
					              <c:otherwise>
					               <input type="radio" name="industryid" class="filterjob" id="${industrydata.jobname}" value="${industrydata.jobid}">
					              </c:otherwise>
					              </c:choose>
               
                                  <label for="${industrydata.jobname}"></label>
                                  ${industrydata.jobname} <span class="count-class">${industrydata.jobscount}</span> 
                                </li>
                              </c:forEach>
                            </ul>
                          </div>
                        </div>
                        <!-- /.box-body -->
                      </div>
                      <!-- /.box -->
                    </form:form>
                  </div>
                  <!-- /.col -->
                  <div class="col-md-9">
                    <div class="box box-primary">
                      <div class="box-header with-border">
                        <h3 class="box-title">Jobs Inbox</h3>
                        <div class="box-tools pull-right">
                          <div class="has-feedback">
                            <input type="text" class="form-control input-sm" placeholder="Search Jobs">
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                          </div>
                        </div>
                        <!-- /.box-tools -->
                      </div>
                      <!-- /.box-header -->
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
                                  <form action="view-userreferraljobsid" >
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
                            <p>test.</p>
                            </li> -->
                          <!-- job end -->
                        </ul>
                      </div>
                      <!-- /.box-body -->
                    </div>
                    <!-- /. box -->
                    <div class="box-footer">
                      <div class="col-md-4 col-sm-4">
                        <div id="showingInfo" ></div>
                      </div>
                      <div class="col-md-8 col-sm-8 text-right">
                        <div  id="pagination"></div>
                      </div>
                    </div>
                  </div>
                  <!-- /.col -->
                </div>
              </div>
              <!-- /.box-body -->
            </div>
            <!-- /.box -->
          </div>
        </section>
        <!-- /.content -->
      </div>
      <!-- /.container -->
    </div>
    <!-- /.content-wrapper -->
    <%@include file="userNewFooter.jsp" %>
  </div>
  <!-- ./wrapper -->
  <%@include file="userNewFooterJsLinks.jsp" %>
  <%@include file="jobDetailsPaginationJS.jsp" %>
   <script type="text/javascript">
	    $(".filterjob").on("change", function(){
	        $("#industryform").submit();
	        
	});
   </script>
  </body>
</html>