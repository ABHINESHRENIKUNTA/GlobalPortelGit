<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <title>View Organization</title>
    <meta name="keywords" content="GlobalWebsite" />
    <meta name="description" content="GlobalWebsite">
    <meta name="author" content="GlobalWebsite">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/jsp/admin/adminHeaderLinks.jsp"%>
    <%@include file="/jsp/admin/adminDataTableCssLink.jsp"%>
   
  </head>
  <body class="dashboard-page">
    <%@include file="/jsp/admin/adminThemeChange.jsp"%>
    <%@include file="/jsp/admin/adminTopMenu.jsp"%>
    <%@include file="/jsp/admin/adminLeftMenu.jsp"%>
    <!-- Start: Content-Wrapper -->
    <section id="content_wrapper">
      <div class="col-md-12">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
            
              <div class="panel">
                <div class="panel-heading">
                  <h4>
                    View Organizations <span class="pull-right">
                    <form:form action="admineditaddorg" commandName="orginfo">
                    <input type="hidden" name="typeofPage" value="add"/>
                    <button type="submit" class="btn btn dark bg-system"><span class="glyphicon glyphicon-plus"></span> Add
                    Organization</button>
                    
                    </form:form>
                    </span>
                  </h4>
                </div>
                <div class="panel-body">
                  <div class="tab-content">
                    <c:if test="${smsg!=null && smsg!=''}">
                      <div class="alert alert-success alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert"
                          aria-hidden="true">×</button>
                        <i class="fa fa-check pr10"></i> <strong>Well done!</strong>${smsg}
                      </div>
                    </c:if>
                    <c:if test="${emsg!=null && emsg!=''}">
                      <div class="alert alert-danger alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert"
                          aria-hidden="true">×</button>
                        <i class="fa fa-remove pr10"></i> <strong>Oh snap!</strong>
                        ${emsg}
                      </div>
                    </c:if>
              
                    <div class="table-responsive">
                      <table id="example"
                        class="table table-striped table-hover dt-responsive"
                        cellspacing="0" width="100%">
                            <thead>
                              <tr>
                                <th>#</th>
                                <th>Organization</th>
                                <th>Status</th>
                                <th>Actions</th>
                              </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orgList}" var="organizationList" varStatus="loop">
                                <tr>
                                  <td> ${loop.index+1} </td>
                                  <td> ${organizationList.orgname} </td>
                                  <td> 
                                  <c:choose>
                                 		<c:when test="${organizationList.isactive==true}"> 
                                   		<span class="label label-success arrowed"> Enabled </span> 
                                 		</c:when>
                                 		<c:otherwise> 
                                   			<span class="label label-danger arrowed"> Disabled </span> 
                                 		</c:otherwise>
                               		</c:choose> </td>
                                  <td>
                                  <div class="col-sm-12">
                                    <form:form action="admineditaddorg" commandName="orginfo">
                                    <div class="col-sm-6">
                                        <form:hidden path="orgid" value="${organizationList.orgid}"/>
                                        <input type="hidden" name="typeofPage" value="view"/>
	                                    <button class="btn btn-info" title="VIEW">
	                                    <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
	                                    </button>
	                                  </div> 
                                    </form:form>
                                    <form:form action="admineditaddorg" commandName="orginfo">
                                    <div class="col-sm-6">
                                        <form:hidden path="orgid" value="${organizationList.orgid}"/>
                                        <input type="hidden" name="typeofPage" value="edit"/>
	                                    <button class="btn btn-warning" title="EDIT">
	                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
	                                    </button>
	                                    </div>
                                    </form:form>
                                    </div>
                                  </td>
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
    <%@include file="/jsp/admin/adminBodyScriptLinks.jsp"%>
    <%@include file="/jsp/admin/adminDataTableJsLink.jsp"%>
    
     
  </body>
</html>