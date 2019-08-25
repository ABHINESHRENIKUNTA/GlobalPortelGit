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
    <title>View Operators</title>
    <meta name="keywords" content="GlobalWebsite" />
    <meta name="description" content="GlobalWebsite">
    <meta name="author" content="GlobalWebsite">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/jsp/admin/adminHeaderLinks.jsp"%>
    <%@include file="/jsp/admin/adminDataTableCssLink.jsp"%>
    <link href="${pageContext.request.contextPath}/theme/vendor/plugins/daterange/daterangepicker.css" rel="stylesheet" type="text/css" />
     <%
    Date date = new Date();
    GregorianCalendar cal = new GregorianCalendar();
	cal.setTime(date);
	Date curdate =cal.getTime();
	 request.setAttribute("currentdate", curdate); 
	cal.add(Calendar.DATE, -30);
    Date newDate = cal.getTime();
    request.setAttribute("previousdate", newDate); 
    %>
  
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
                    View Operators <span class="pull-right">
                    <button type="button" class="btn btn dark bg-system"
                      onclick="location.href='load-addoperatorpage'"><span class="glyphicon glyphicon-plus"></span> Add
                    Operator</button>
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
                                <th>UserName</th>
                                <th>Role</th>
                                <th>Created By</th>
                                <th>Status</th>
                                <th>Actions</th>
                              </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listofOperators}" var="operatorList" varStatus="loop">
                              <c:if test="${operatorList.roleid!=superadminid}">
                                <tr>
                                  <td> ${loop.index} </td>
                                  <td> ${operatorList.username} </td>
                                  <td> ${operatorList.rolename} </td>
                                  <td> ${operatorList.createdby} </td>
                                  <td> ${operatorList.status} </td>
                                  <td>
                                  <div class="col-sm-12">
                                    <form:form action="load-viewoperatorsbyid" commandName="viewoperator">
                                    <div class="col-sm-6">
                                        <form:hidden path="rowid" value="${operatorList.rowid}"/>
	                                    <button class="btn btn-info" title="VIEW">
	                                    <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
	                                    </button>
	                                  </div> 
                                    </form:form>
                                    <form:form action="load-editoperatorsbyid" commandName="viewoperator">
                                    <div class="col-sm-6">
                                        <form:hidden path="rowid" value="${operatorList.rowid}"/>
	                                    <button class="btn btn-warning" title="EDIT">
	                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
	                                    </button>
	                                    </div>
                                    </form:form>
                                    </div>
                                  </td>
                                </tr>
                                </c:if>
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