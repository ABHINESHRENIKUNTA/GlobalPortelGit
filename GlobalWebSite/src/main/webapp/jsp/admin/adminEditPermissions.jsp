<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta charset="utf-8">
      <title>Update Permissions</title>
      <meta name="keywords" content="GlobalWebsite" />
      <meta name="description" content="GlobalWebsite">
      <meta name="author" content="GlobalWebsite">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <%@include file="adminHeaderLinks.jsp" %>
      
        <%@include file="accordationCss.jsp" %>    
   </head>
   <body class="dashboard-page">
      <%@include file="adminThemeChange.jsp" %>
      <%@include file="adminTopMenu.jsp" %>
      <%@include file="adminLeftMenu.jsp" %>
      <!-- Start: Content-Wrapper -->
      <section id="content_wrapper">
            <div class="col-md-12">
            
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <div class="panel with-nav-tabs">
                           <div class="panel-heading">
                             <h4>Update Permissions</h4>
                            
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
                  
        <div class="col-md-12">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                              ${rolename}
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                    <form:form action="update-rolepermissions" commandName="editperm">
                    <form:hidden  path="roleid" value="${paramroleid}"/>
                        <div class="panel-body">
                                <c:forEach items="${listroleperm}" var="permissions">
                                <div class="col-md-4">
                                <label class="customcheck"> ${permissions.permname}
						          <input type="checkbox" name="permilist" value="${permissions.permid}" checked="checked">
						          <span class="checkmark"></span>
						        </label>
						        </div>
	               				 
                                </c:forEach>
                                
                                
                                <c:forEach items="${notlistperm}" var="notpermissions">
                               
                                <div class="col-md-4">
                                <label class="customcheck"> ${notpermissions.permname}
						          <input type="checkbox" name="permilist" value="${notpermissions.permid}">
						          <span class="checkmark"></span>
						        </label>
						        </div>
                                </c:forEach>
                                
                               <div class="row"></div>
                                 
                                <div class="col-md-6">
                                 <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="location.href='view-rolepermissions'">Back</button>
                                </div>
                                <div class="col-md-4"></div>
                                <div class="col-md-2">
                                 <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </div>
                          </form:form>
                        </div>
                    </div>
                </div>
        </div>
                              </div>
                          
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
      </section>
      <%@include file="adminBodyScriptLinks.jsp" %>
    
   </body>
</html>