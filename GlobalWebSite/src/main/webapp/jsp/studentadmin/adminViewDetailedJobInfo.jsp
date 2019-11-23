<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.io.File" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <title>Add Job Info</title>
    <meta name="keywords" content="GlobalWebsite" />
    <meta name="description" content="GlobalWebsite">
    <meta name="author" content="GlobalWebsite">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/jsp/admin/adminHeaderLinks.jsp" %>
  </head>
  <body class="dashboard-page theme-danger">
    <%@include file="/jsp/admin/adminThemeChange.jsp" %>
    <%@include file="/jsp/admin/adminTopMenu.jsp" %>
    <%@include file="/jsp/admin/adminLeftMenu.jsp" %>
    <!-- Start: Content-Wrapper -->
    <section id="content_wrapper" style="background-color:gray">
      <div class="col-md-12" style="background-color:gray">
      <form:form action="load-admineditcommoninfobyid" commandName="adminviewstuinfo">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="panel with-nav-tabs">
                <div class="panel-heading">
                  <h4><i class="glyphicon glyphicon-th-large gly-spin"></i> ${tableval}
                 
                    <span class="pull-right">
                    <button type="button" class="btn btn-danger"  onclick="location.href='load-adminviewcommoninfo?selectedparam=${tablekey}'">
                    <span class="glyphicon glyphicon-edit"></span> EDIT</button></span>
              
                     <span class="pull-right" style="padding-right:5px;">
                    <button type="button" class="btn btn-primary" onclick="location.href='load-adminviewcommoninfo?selectedparam=${tablekey}'">
                    <span class="glyphicon glyphicon-step-backward"></span> Back to List</button></span>
                  </h4>
                  <jsp:useBean id="now" class="java.util.Date" />
                  <fmt:formatDate var="year" value="${now}" pattern="dd/MMM/yyyy" />
                
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
                          <strong>Sorry!</strong> ${emsg}
                        </div>
                      </c:if>
                      
	                   <c:forEach items="${alistdata}" var="listdata"  varStatus="loop">
	                    	<div class="form-body">
                             <div class="row user-infos cyruxx">
                              <div class="col-xs-12 col-sm-12">
                				<div class="panel panel-primary">
                    				<div class="panel-heading">
                        			<span><i class="glyphicon glyphicon-th-large gly-spin"></i> Link information:	 </span>
                        			<span style="float:right; padding-top:15px;">
                         			<c:choose>
                                 		<c:when test="${listdata.isactive==true}"> 
                                   		<span class="label label-success arrowed"> Enabled </span> 
                                 		</c:when>
                                 		<c:otherwise> 
                                   			<span class="label label-danger arrowed"> Disabled </span> 
                                 		</c:otherwise>
                               		</c:choose>
                        	
                      				 </span>
                    				</div>
                    <div class="panel-body">
                    <form:hidden path="rowid" value="${listdata.rowid}"/>
	               <form:hidden path="tablekey" value="${tablekey}"/>
                        <div class="row">
                            <div class="col-sm-3 col-sm-3">
                               <!--  <img class="img-circle" src="F:\\Prakash\Softwares\tomcat9\GlobalWebsiteFiles\global_popular_jobsites_page\13.jpg"  alt="User Pic"> -->
                            </div>
                           
                           <c:choose>
                           <c:when test="${tablekey == 'global_popular_jobsites_page' or 
                            tablekey == 'global_centralgov_jobs' or 
                            tablekey == 'global_it_jobs' or 
                            tablekey == 'global_nonit_jobs' or
                            tablekey == 'global_trainingandplace_jobs' or
                            tablekey == 'global_freejobtraining_jobs' or
                            tablekey == 'global_admit_cards' or
                            tablekey == 'global_results'
                            }">
                            <div class=" col-sm-9 col-sm-9">
                            <div class="row">
                               <div class="col-sm-3">Link Name: </div>
                               <div class="col-sm-9">${listdata.linkname}</div>
                             </div>
                             <div class="row">
                               <div class="col-sm-3">Site URL: </div>
                               <div class="col-sm-9"><a href="${listdata.linkaddress}" target="_blank">${listdata.linkaddress}</a></div>
                              </div>
                              <%-- <div class="row">
                               <div class="col-sm-3">Email: </div>
                               <div class="col-sm-9">${listdata.emailid}</div>
                              </div> --%>
                               <div class="row">
                               <div class="col-sm-3">Added By: </div>
                               <div class="col-sm-9">${listdata.addedby}</div>
                              </div>
                              <div class="row">
                               <div class="col-sm-3">Description: </div>
                               <div class="col-sm-9">${listdata.comments}</div>
                              </div>
                             
                            </div>
                           </c:when>
                           <c:otherwise> 
                            <div class=" col-sm-9 col-sm-9">
                            <c:if test="${tablekey == 'global_abroad_jobs'}">
                             <div class="row">
                               <div class="col-sm-3">Country: </div>
                               <div class="col-sm-9">${listdata.countryname}</div>
                             </div>
                             <div class="row">
                               <div class="col-sm-3">State: </div>
                               <div class="col-sm-9">${listdata.countrystate}</div>
                             </div>
                             </c:if>
                              <c:if test="${tablekey == 'global_statewisegovt_jobs'}">
                             <div class="row">
                               <div class="col-sm-3">State: </div>
                               <div class="col-sm-9">${listdata.statename}</div>
                             </div> 
                             </c:if>
                            <div class="row">
                               <div class="col-sm-3">Link Name: </div>
                               <div class="col-sm-9">${listdata.linkname}</div>
                             </div>
                             <div class="row">
                               <div class="col-sm-3">Site URL: </div>
                               <div class="col-sm-9">${listdata.linkaddress}</div>
                              </div>
                              <div class="row">
                               <div class="col-sm-3">Email: </div>
                               <div class="col-sm-9">${listdata.emailid}</div>
                              </div>
                              <div class="row">
                               <div class="col-sm-3">Added By: </div>
                               <div class="col-sm-9">${listdata.addedby}</div>
                              </div>
                              <div class="row">
                               <div class="col-sm-3">Description: </div>
                               <div class="col-sm-9">${listdata.comments}</div>
                              </div>
                             
                            </div>
                            </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="panel-footer">
                       
                    </div>
                </div>
            </div>
        </div>
                          </div>
	                    </c:forEach>
					
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--Confirmation Model   -->
              </div>
            </div>
            </form:form>
          </div>
    </section>
    <%@include file="/jsp/admin/adminBodyScriptLinks.jsp" %>
     
  </body>
</html>