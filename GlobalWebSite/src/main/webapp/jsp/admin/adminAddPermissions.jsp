<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta charset="utf-8">
      <title>Delete Student Home Info</title>
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
                             <h4>Select Page to View Data</h4>
                            
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
            <c:forEach items="${listallroles}" var="roleids" varStatus="mainloop">
               <c:if test="${roleids.roleid!=superadminid}">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="heading${mainloop.index}">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${mainloop.index}" aria-expanded="true" aria-controls="collapse${mainloop.index}">
                                ${roleids.rolename}
                            </a>
                        </h4>
                    </div>
                    <!-- <div id="collapseOne" class="panel-collapse collapse in"> -->
                    <div id="collapse${mainloop.index}" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                
                                 <button onclick="location.href='edit-rolepermissions?roleid=${roleids.roleid}'">Edit Permissions</button>
                                 <%--  <c:forEach items="${hmodel.rolepmlist}" var="mainlist" varStatus="loop">
                                  ${mainlist}
                                  </c:forEach> --%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               </c:if>
            </c:forEach>
                
                
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