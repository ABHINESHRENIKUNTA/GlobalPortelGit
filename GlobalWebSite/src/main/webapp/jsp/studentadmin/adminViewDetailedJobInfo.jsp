<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="panel with-nav-tabs">
                <div class="panel-heading">
                  <h4>${tableval}
                    <span class="pull-right">
                    <button type="button" class="btn btn-primary" onclick="location.href='load-adminviewcommoninfo?selectedparam=${tablekey}'">VIEW / EDIT</button></span>
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
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="padding-top: 15px;">Link information</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-3 col-sm-3 hidden-xs hidden-sm">
                                <img class="img-circle"
                                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
                                     alt="User Pic">
                            </div>
                           
                           
                            <div class=" col-sm-9 col-sm-9 hidden-xs hidden-sm">
                               <div class="col-sm-3">Link Name: </div>
                               <div class="col-sm-9">${listdata.linkname}</div>
                               <div class="col-sm-3">Site URL: </div>
                               <div class="col-sm-9">${listdata.linkaddress}</div>
                               <div class="col-sm-3">Email: </div>
                               <div class="col-sm-9">${listdata.emailid}</div>
                               <div class="col-sm-3">Description: </div>
                               <div class="col-sm-9">jkkj</div>
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
          </div>
    </section>
    <%@include file="/jsp/admin/adminBodyScriptLinks.jsp" %>
   
  </body>
</html>