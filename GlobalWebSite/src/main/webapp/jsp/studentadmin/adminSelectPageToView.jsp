<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta charset="utf-8">
      <title>Delete Student Home Info</title>
      <meta name="keywords" content="GlobalWebsite" />
      <meta name="description" content="GlobalWebsite">
      <meta name="author" content="GlobalWebsite">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <%@include file="/jsp/admin/adminHeaderLinks.jsp" %>
   </head>
   <body class="dashboard-page">
      <%@include file="/jsp/admin/adminThemeChange.jsp" %>
      <%@include file="/jsp/admin/adminTopMenu.jsp" %>
      <%@include file="/jsp/admin/adminLeftMenu.jsp" %>
      <!-- Start: Content-Wrapper -->
      <section id="content_wrapper">
         <form:form method="post" action="load-adminviewcommoninfo" modelAttribute="adminselpage" >
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
                                 <div class="col-sm-12">
                                    <div class="form-group">
                                       <label for="tablename">Select Page to View<span class="text-danger">*</span></label>
                                       <label class="error" for="tablename" id="tablename_error">This field is required.</label>
                                       <form:select path="tablename" class="select2-single form-control"  >
                                          <form:option value="0" >Select Page to Add Info </form:option>
                                          <form:options items="${tablelist}" />
                                       </form:select>
                                    </div>
                                 </div>

                              </div>
                              <div class="col-sm-5">
                              </div>
                              <div class="col-sm-7">
                                          <button type="submit" class="btn btn-primary">Select Page</button>
                                       </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </form:form>
      </section>
      <%@include file="/jsp/admin/adminBodyScriptLinks.jsp" %>
      <script type="text/javascript">
         $(".select2-single").select2()
      </script>   
   </body>
</html>