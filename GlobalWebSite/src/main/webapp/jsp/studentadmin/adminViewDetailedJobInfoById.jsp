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
                    <button type="submit" class="btn btn-danger">
                    <span class="glyphicon glyphicon-edit"></span> EDIT</button></span>
                    
                   
                     <span class="pull-right" style="padding-right:5px;">
                    <button type="button" class="btn btn-primary" onclick="location.href='load-adminviewcommoninfo?selectedparam=${tablekey}'">
                    <span class="glyphicon glyphicon-step-backward"></span> Back to List</button></span>
                  
                  <jsp:useBean id="now" class="java.util.Date" />
                  <fmt:formatDate var="year" value="${now}" pattern="dd/MMM/yyyy" />
                   </h4>
                </div>
                  <div class="panel-body">
                  <form:hidden path="rowid" value="${listdata.rowid}"/>
	               <form:hidden path="tablekey" value="${tablekey}"/>
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
                              <!-- <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1"> -->
                              <div class="col-xs-12 col-sm-12">
                				<div class="panel panel-primary">
                    				<div class="panel-heading">
                        			<span><i class="glyphicon glyphicon-th-large gly-spin"></i> Job information:	 </span>
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
                        <div class="row">
                      
                            <div class=" col-sm-12">
                            <div class="row">
                               <div class="col-sm-3"><label>Job Title:</label> </div>
                               <div class="col-sm-9">${listdata.jobtitle}</div>
                             </div>
                            
                              <div class="row">
                               <div class="col-sm-3"><label>Industry:</label> </div>
                               <div class="col-sm-9">${listdata.industry}</div>
                              </div>
                               <div class="row">
                               <div class="col-sm-3"><label>Company:</label> </div>
                               <div class="col-sm-9">${listdata.company}</div>
                              </div>
                              <div class="row">
                               <div class="col-sm-3"><label>Experience:</label> </div>
                               <div class="col-sm-3">${listdata.experience}</div>
                               <div class="col-sm-3"><label>Qualification:</label> </div>
                               <div class="col-sm-3">${listdata.qualification}</div>
                              </div>
                             
                              <div class="row">
                               <div class="col-sm-3"><label>Role:</label> </div>
                               <div class="col-sm-3">${listdata.rolecategory}</div>
                               <div class="col-sm-3"><label>Salary:</label> </div>
                               <div class="col-sm-3">${listdata.salary}</div>
                              </div>
                              <div class="row">
                               <div class="col-sm-3"><label>Contact No.:</label> </div>
                               <div class="col-sm-3">${listdata.contactnum}</div>
                               <div class="col-sm-3"><label>Email#:</label> </div>
                               <div class="col-sm-3">${listdata.emailid}</div>
                              </div>
                              <div class="row">
                                <div class="col-sm-3"><label>Location: </label> </div>
                               <div class="col-sm-3">${listdata.location}</div>
                               <div class="col-sm-3"><label>No.of Positions:</label> </div>
                               <div class="col-sm-3">${listdata.noofpossitions}</div>
                              </div>
                               <div class="row">
                               <div class="col-sm-3"><label>Job Type:</label> </div>
                               <div class="col-sm-3">${listdata.jobtype}</div>
                               <div class="col-sm-3"><label>Added By:</label> </div>
                               <div class="col-sm-3">${listdata.addedby}</div>
                              </div>
                              <div class="row">
                               <div class="col-sm-3"><label>Job Responsibilites:</label> </div>
                               <div class="col-sm-9">${listdata.jobresponsibilities}</div>
                              </div>
                              <div class="row">
                               <div class="col-sm-3"><label>Skill Requirement:</label> </div>
                               <div class="col-sm-9">${listdata.skillreq}</div>
                              </div>
                              <div class="row">
                               <div class="col-sm-3"><label>Other Info:</label> </div>
                               <div class="col-sm-9">${listdata.otherinfo}</div>
                              </div>
                             
                            </div>
                         
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