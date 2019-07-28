<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Employer Posted Jobs</title>
  <%@include file="userNewHeader.jsp" %>
  <style type="text/css">
  /* width */
::-webkit-scrollbar {
  width: 5px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px grey; 
  border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: green; 
  border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #b30000; 
}
.optionlist {
	list-style: none;
	max-height: 250px;
	scroll-direction: horizontal;
	 overflow-y: auto;
  overflow-x: hidden;
}
.optionlist li {
	margin-bottom: 10px;
	padding: 5px 0;
	position: relative;
	padding-left: 30px;
}
.optionlist li span {
	position: absolute;
	right: 0;
	top: 6px;
}
.optionlist li input[type=checkbox] {
	display: none;
}
.optionlist li input[type=checkbox] + label {
	width: 20px;
	height: 20px;
	border: 1px solid #e0e0e0;
	background: #f5f5f5;
	cursor: pointer;
	position: absolute;
	left: 0;
	top: 0;
}
.optionlist li input[type=checkbox]:checked + label:before {
	content: '\f00c';
	font-family: 'FontAwesome';
	color: #4ece00;
	padding-left: 2px;
	position: relative;
	top: 2px;
}

.searchList {
	list-style: none;
	
}
.searchList li {
	background: #fff;
	border: 1px solid #e4e4e4;
	padding: 10px;
	margin-bottom: 30px;
	
}
.searchList li:hover {
	box-shadow: 0 0 10px rgba(0,0,0,0.1);
	border: 1px solid #263bd6;
}
.searchList li .jobimg {
	float: left;
	width: 70px;
	margin-right: 15px;
}
.searchList li h3 a {
	font-size: 18px;
	font-weight: 600;
	color: #00a8ff;
}
.searchList li .companyName {
	margin: 10px 0;
	color: #969595;
}
.searchList li .companyName a {
	color: #969595;
}
.searchList li a:hover {
	color: #333;
}
.searchList li .location {
	color: #000;
}
.searchList li .location span {
	color: #333;
}
.searchList li .listbtn {
	margin-top: 20px;
}
.searchList li .listbtn a {
	background: #fff;
	display: block;
	border-radius: 0;
	width: 100%;
	color: #263bd6;
	text-transform: uppercase;
	font-weight: 700;
	padding: 10px 15px;
	text-align: center;
	border:1px solid #263bd6;
}
.searchList li .listbtn a:hover {
	background: #263bd6;
	color:#fff;
	text-decoration: none;
}
.searchList li p {
	line-height: 22px;
	color: #333;
	margin: 10px 0 0 0;
}
.searchList li .cateinfo {
	color: #263bd6;
	margin: 10px 0;
}
.searchList li .minsalary {
	font-size: 22px;
	font-weight: 700;
	text-align: center;
	margin-top: 25px;
	color: #a8d815;
}
.searchList li .minsalary span {
	color: #999;
	font-weight: 400;
}
.btn-share {
    background-color: #BEBEBE;
    border-color: #CCCCCC;
    color: #333333;
}

.btn-twitter {
    background-color: #3399CC !important;
    width: 10px;
    color:#FFFFFF!important;
}

.btn-facebook {
    background-color: #3D5B96 !important;
    width: 10px;
    color:#FFFFFF!important;
}

.btn-facebook {
    background-color: #3D5B96 !important;
    width: 10px;
    color:#FFFFFF!important;
}

.btn-google {
    background-color: #DD3F34 !important;
    width: 10px;
    color:#FFFFFF!important;
}

.btn-linkedin {
    background-color: #1884BB !important;
    width: 10px;
    color:#FFFFFF!important;
}

.btn-pinterest {
    background-color: #CC1E2D !important;
    width: 10px;
    color:#FFFFFF!important;
}

.btn-mail {
    background-color: #FFC90E !important;
    width: 10px;
    color:#FFFFFF!important;
}




  </style>
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
              <li class="active">Employer Posted Job Links</li>
            </ol>
          </section>

          <!-- Main content -->
          <section class="content">
           <div class="col-md-12">
              <!-- Primary box -->
              <div class="box box-solid box-primary">
                <div class="box-header">
                  <h3 class="box-title">Employer Posted Job Links</h3> <code>Find your best job..</code>
                  <div class="box-tools pull-right">
                    <button class="btn btn-primary btn-sm" title="BACK" onclick="location.href='load-jobcategories'"><i class="fa fa-backward"></i></button>
                    <button class="btn btn-primary btn-sm" data-widget="collapse"><i class="fa fa-minus"></i></button>
                   <!--  <button class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i></button> -->
                  </div>
                </div>
                <div class="box-body">
                  <div class="row">
            
            <div class="col-md-12">
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
                  <div class="location"><label class="fulltime">${jobDetails.jobtype}</label>   - <span>${jobDetails.location}, </span>
                  <label class="fulltime"> Notice Period: </label>   - <span>${jobDetails.noticeperiod}, </span>
                  </div>
                </div>
        		 <div class="clearfix"></div>
                <div class="jobinfo">
                  <div class="location">
                   <label class="fulltime"> Experience Required: </label>   - <span>${jobDetails.experience}, </span>
                  <label class="fulltime"> Number Of Positions: </label>   - <span>${jobDetails.noofpossitions}, </span>
                  </div>
                </div>
                 <div class="clearfix"></div>
                <div class="jobinfo">
                  <div class="location">
                  <label class="fulltime"> Salary: </label>   - <span>${jobDetails.salary}, </span>
                  <label class="fulltime"> Industry: </label>   - <span>${jobDetails.industry}, </span>
                  </div>
                </div>
                 <div class="clearfix"></div>
                <div class="jobinfo">
                  <div class="location">
                  <label class="fulltime"> Role / Designation: </label>   - <span>${jobDetails.rolecategory}</span>
                  </div>
                </div>
                <div class="clearfix"></div>
              </div>
              <div class="col-md-4 col-sm-4">
                <form:form action="" commandName="listjobdetails">
                
                 <div class="listbtn">
                  
    				<button href="#" data-toggle="dropdown" class="btn btn-info dropdown-toggle share">
    					<i class="fa fa-share-alt" aria-hidden="true"></i><!-- <span class="caret"></span> -->
    				</button>
    				<ul class="dropdown-menu" style="border: none; max-height: 10px;">
    				<li >
        				<span onclick="twitterFun();">
								<i class="fa fa-twitter" style="color:#00acee; padding: 5px;cursor: pointer;font-size: 25px; "></i>
							</span> 
        					<span onclick="facebookFun();">
								<i class="fa fa-facebook" style="color:#3b5998; padding: 5px;cursor: pointer;font-size: 25px; "></i>
        					</span>
        					<span onclick="googlePlusFun();">
								<i class="fa fa-google-plus fa-3px" style="color:#CC3333; padding: 5px;cursor: pointer;font-size: 25px; "></i>
							</span>
							<span onclick="linkedinFun();">							
								<i class="fa fa-linkedin fa-3px" style="color:#0077B5; padding: 5px;cursor: pointer;font-size: 25px; "></i>
							</span>
							
							<span onclick="mailToFun();">
								<i class="fa fa-envelope fa-3px" style="color:#f1d592; padding: 5px;cursor: pointer;font-size: 25px; "></i>
							</span>
        				</li>
                    </ul>
                   <button class="btn btn-primary">Apply Now</button></div> 
                <form:hidden path="rowid" value="${jobDetails.rowid}"/>
                </form:form>
              </div>
            </div>
             <h4><a href="#.">Skill Requirement</a></h4>
            <p>${jobDetails.skillreq}</p>
             <h4><a href="#.">Job Responsibilities</a></h4>
            <p>${jobDetails.jobresponsibilities}</p>
            <h4><a href="#.">Other Information</a></h4>
            <p>${jobDetails.otherinfo}</p>
            <h4><a href="#.">Contact Information</a></h4>
            <p>Email: ${jobDetails.emailid}</p>
            <p>Contact: ${jobDetails.contactnum}</p>
            
          </li>
          </c:forEach>
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
      <script src="${pageContext.request.contextPath}/theme/usernewdesign/pagination/Flexible.Pagination.js" type="text/javascript"></script>
    
    <script>
    $(function() {

        var flexiblePagination = $('#content').flexiblePagination({
            itemsPerPage : 5,
            itemSelector : 'li.content-result:visible',
            pagingControlsContainer : '#pagination',
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

// Direct JS Object method of using the FlexiblePagination
//        var pager = new Flexible.Pagination();
//        pager.itemsPerPage = 1;
//        pager.pagingContainer = '#content';
//        pager.itemSelector = 'div.result:visible';  //That is, Select and paginate only the filtered visible '.result' div.
//        pager.pagingControlsContainer = '#pagingControls';
//        pager.showCurrentPage();
    });

    function socialWindow(url) {
        var left = (screen.width - 570) / 2;
        var top = (screen.height - 570) / 2;
        var params = "menubar=no,toolbar=no,status=no,width=570,height=570,top=" + top + ",left=" + left;
        window.open(url,"NewWindow",params);
    }

        var pageUrl = encodeURIComponent(document.URL);
        var tweet = encodeURIComponent(jQuery("meta[property='og:description']").attr("content"));
        
       function facebookFun() {
            url = "https://www.facebook.com/sharer.php?u=" + pageUrl;
            alert(url);
            socialWindow(url);
        }

        function twitterFun() {
            url = "https://twitter.com/intent/tweet?url=" + pageUrl + "&text=" + tweet;
            socialWindow(url);
        }
        function googlePlusFun() {
            url = "https://plus.google.com/share?url=" + pageUrl + "&text=" + tweet;
            socialWindow(url);
        }

        function linkedinFun() {
            url = "https://www.linkedin.com/shareArticle?mini=true&url=" + pageUrl;
            socialWindow(url);
        }
        var pageTitle = encodeURIComponent(page.title);
        var body_message = $('#content-result').html();
        var email = 'test@mail.com';
        var subject = pageTitle;
        var mailto_link = 'mailto:' + email + '?subject=' + subject + '&body=' + body_message;
        function mailToFun() {
        	socialWindow(mailto_link);
        }
    </script>
    
  </body>
</html>
