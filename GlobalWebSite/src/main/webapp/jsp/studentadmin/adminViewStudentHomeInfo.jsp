<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta charset="utf-8">
      <title>View ${tableval} </title>
      <meta name="keywords" content="GlobalWebsite" />
      <meta name="description" content="GlobalWebsite">
      <meta name="author" content="GlobalWebsite">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <%@include file="/jsp/admin/adminHeaderLinks.jsp" %>
      <%@include file="/jsp/admin/adminDataTableCssLink.jsp" %>
   </head>
   <body class="dashboard-page">
      <%@include file="/jsp/admin/adminThemeChange.jsp" %>
      <%@include file="/jsp/admin/adminTopMenu.jsp" %>
      <%@include file="/jsp/admin/adminLeftMenu.jsp" %>
      <!-- Start: Content-Wrapper -->
      <section id="content_wrapper">
            <div class="col-md-12">
            
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <div class="panel with-nav-tabs">
                           <div class="panel-heading">
                             <h4>View ${tableval} 
                              <span class="pull-right">
			               <button type="button" class="btn btn-success" onclick="location.href='load-adminaddstuinfo?selectedparam=${tablekey}'">Add Information</button></span>
			               </h4>
                           </div>
                           <div class="panel-body">
                              <div class="tab-content">
                                 <c:if test="${smsg!=null && smsg!=''}">
                                    <div class="alert alert-success alert-dismissable">
                                       <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                       <i class="fa fa-check pr10"></i>
                                       <strong>Well done!</strong>${smsg}
                                    </div>
                                 </c:if>
                                 <c:if test="${emsg!=null && emsg!=''}">
                                    <div class="alert alert-danger alert-dismissable">
                                       <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                       <i class="fa fa-remove pr10"></i>
                                       <strong>Oh snap!</strong> ${emsg}
                                    </div>
                                 </c:if>
                               
                               <div class="table-responsive">  
                                 <table id="example" class="table table-striped table-hover dt-responsive" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>#</th>
						<th>Link Name</th>
						<th>Created By</th>
						<th>Created Date</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>

				<tbody>
				<c:forEach items="${listdata}" var="listdata" varStatus="loop">
					<tr>
						<td>${loop.index+1}</td>
						<td>${listdata.linkname}</td>
						<td>${listdata.addedby}</td>
						<td>
						<fmt:parseDate value="${listdata.addeddate}" pattern="yyyy-MM-dd HH:mm:ss" var="myDate"/>
						<fmt:formatDate type = "date" value = "${myDate}"  pattern="dd-MMM-yyyy"/></td>
						<td>
						<c:choose>
						<c:when test="${listdata.isactive==true}"> Enabled </c:when>
						<c:otherwise> Disabled </c:otherwise>
						</c:choose>
						
						</td>
						<td>
						<a href="#"><i class="fa fa-eye" aria-hidden="true" style="padding-left: 10px;"></i></a> 
						<a href="#"><i class="fa fa-edit" aria-hidden="true" style="padding-left: 10px;"></i></a></td>
					</tr>
				
				</c:forEach>
				

				</tbody>
			</table>
             </div>                    
                                 
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
      </section>
      <%@include file="/jsp/admin/adminBodyScriptLinks.jsp" %>
      <%@include file="/jsp/admin/adminDataTableJsLink.jsp" %>
     
   </body>
</html>