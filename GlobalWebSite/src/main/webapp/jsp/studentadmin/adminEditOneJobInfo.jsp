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
    <title>Update Job Info</title>
    <meta name="keywords" content="GlobalWebsite" />
    <meta name="description" content="GlobalWebsite">
    <meta name="author" content="GlobalWebsite">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="/jsp/admin/adminHeaderLinks.jsp" %>
  <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/build/css/intlTelInput.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/theme/build/css/demo.css"> --%>
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
                    <button type="button" class="btn btn-primary" onclick="location.href='load-adminviewcommoninfo?selectedparam=${tablekey}'">
                    <span class="glyphicon glyphicon-backward"></span>  
                    Back To List</button></span>
                  </h4>
                  <jsp:useBean id="now" class="java.util.Date" />
                  <fmt:formatDate var="year" value="${now}" pattern="dd/MMM/yyyy" />
                  <!-- <ul class="nav panel-tabs-border panel-tabs panel-tabs-left">
                    <li class="active">
                       <a href="#">Add</a>
                    </li>
                    <li >
                       <a href="load-adminupdatestuinfo">Edit</a>
                    </li>
                    <li>
                       <a href="load-admindeletestuinfo">Delete</a>
                    </li>
                    </ul> -->
                </div>
                <form:form method="post" id="submitform" action="adminupdatestudenthomeinfo" modelAttribute="adminupdatestuinfo"  enctype="multipart/form-data">
                  <div class="panel-body">
                    <div class="tab-content">
                      <c:if test="${smsg!=null && smsg!=''}">
                        <div class="alert alert-success alert-dismissable">
                          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">�</button>
                          <i class="fa fa-check pr10"></i>
                          <strong>Well done!</strong>${smsg}
                        </div>
                      </c:if>
                      <c:if test="${emsg!=null && emsg!=''}">
                        <div class="alert alert-danger alert-dismissable">
                          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">�</button>
                          <i class="fa fa-remove pr10"></i>
                          <strong>Sorry!</strong> ${emsg}
                        </div>
                      </c:if>
                      <%-- <div class="col-sm-12">
                        <div class="form-group">
                           <label for="tablename">Select Page to Add<span class="text-danger">*</span></label>
                           <label class="error" for="tablename" id="tablename_error">This field is required.</label>
                           <form:select path="tablename" class="select2-single form-control"  >
                              <form:option value="0" >Select Page to Add Info </form:option>
                              <form:options items="${tablelist}" />
                           </form:select>
                        </div>
                        </div> --%>
                      <form:hidden path="tablekey" value="${tablekey}"/>
                      <form:hidden path="tablename" value="${tableval}"/>
                      <form:hidden path="rowid" value="${rowId}"/>
                      <c:choose>
                        <c:when test="${tablekey == 'global_postedbyadmin_jobs' or tablekey == 'global_refpost_jobs' 
                          or tablekey == 'global_jobconsult_jobs' or tablekey == 'global_empposted_jobs'}">
                          <%@include file="adminReferralJobs.jsp" %>
                        </c:when>
                        <c:otherwise>
                          <c:if test="${tablekey == 'global_statewisegovt_jobs'}">
                            <div class="col-sm-12">
                              <div class="form-group">
                                <label for="tablename">Select State<span class="text-danger">*</span></label>
                                <label class="error" for="states" id="states_error">This field is required.</label>
                                <form:select path="stateid" class="select2-single form-control">
                                  <form:option value="0">SELECT STATE</form:option>
                                  <c:forEach items="${stateList}" var="listofstates">
                                    <form:option value="${listofstates.id}">${listofstates.statename}</form:option>
                                  </c:forEach>
                                </form:select>
                              </div>
                            </div>
                          </c:if>
                          <c:if test="${tablekey == 'global_abroad_jobs'}">
                            <div class="col-sm-6">
                              <div class="form-group">
                                <label for="countryiso">Select Country<span class="text-danger">*</span></label>
                                <label class="error" for="country" id="countryiso_error">This field is required.</label>
                                <form:select path="countryiso" class="select2-single form-control">
                                  <form:option value="0">SELECT COUNTRY</form:option>
                                  <c:forEach items="${countryList}" var="listofcountries">
                                    <form:option value="${listofcountries.iso}">${listofcountries.nicename}</form:option>
                                  </c:forEach>
                                </form:select>
                              </div>
                            </div>
                            <div class="col-sm-6">
                              <div class="form-group">
                                <label for="tablename">Enter Country State<span class="text-danger">*</span></label>
                                <label class="error" for="countrystate" id="countrystate_error">This field is required.</label>
                                <form:input type="text" path="countrystate"  placeholder="Enter State Name" class="form-control" maxlength="255"/>
                              </div>
                            </div>
                          </c:if>
                          <div class="col-sm-6">
                            <div class="form-group">
                              <label for="linkname">Link Name<span class="text-danger">*</span></label>
                              <label class="error" for="linkname" id="linkname_error">This field is required.</label>
                              <form:input type="text" path="linkname"  placeholder="Enter Link name" class="form-control" maxlength="255"/>
                            </div>
                          </div>
                          <div class="col-sm-6">
                            <div class="form-group">
                              <label for="siteurl">Site URL<span class="text-danger">*</span></label>
                              <label class="error" for="linkaddress" id="linkaddress_error">This field is required.</label>
                              <form:input type="text" path="linkaddress" placeholder="https://Enter sie URL" class="form-control" maxlength="255"/>
                            </div>
                          </div>
                          <div class="col-sm-6" style="display: none;">
                             <div class="form-group">
                              <label for="uploadimage">Upload Image<span class="text-danger">*</span></label>
                              <label class="error" for="linkaddress" id="imagepath_error">This field is required.</label>
                              <input type="file" name="imagepath" id="imagepath" class="btn btn-success fileupload-add form-control"  accept="image/*" onchange="showMyImage(this)" >
                            </div>
                          </div>
                          <div class="col-sm-6" style="display: none;">
                            <div class="form-group">
                              <label for="emailid">Email#<span class="text-danger"></span></label>
                              <label class="error" for="emailid" id="emailid_error">This field is required.</label>
                              <form:input type="text" path="emailid"  placeholder="Enter email id" class="form-control"/>
                            </div>
                          </div> 
                          <div class="col-sm-12">
                            <div class="form-group">
                              <label for="comments">Comments / Description<span class="text-danger"></span></label>
                              <label class="error" for="comments" id="comments_error">This field is required.</label>
                              <form:textarea path="comments" class="form-control"  placeholder="Please Enter Comments" rows="6"/>
                              <label for="comment" class="field-icon">
                              <i class="fa fa-comments"></i>
                              </label>
                              <span class="input-footer">
                              <strong>Hint:</strong>To Know Why Adding Link</span>
                            </div>
                          </div>
                        </c:otherwise>
                      </c:choose>
                      <div class="form-group">
                        <label for="happy" class="col-sm-5 col-md-5 control-label text-right">Enable / Disable?</label>
                        <div class="col-sm-6 col-md-6">
                          <div class="input-group">
                            <div id="" class="btn-group">
                            <label><form:radiobutton path="isactive" value="true"/>Enabled</label>
                             <label><form:radiobutton path="isactive" value="false"/>Disabled</label>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-12">
                        <div class="col-sm-6" align="left">
                          <button type="reset" class="btn btn-danger">Clear</button>   
                        </div>
                        <div class="col-sm-6" align="right">
                          <c:choose>
                            <c:when test="${tablekey == 'global_postedbyadmin_jobs' or 
                              tablekey == 'global_refpost_jobs' or 
                              tablekey == 'global_jobconsult_jobs' or 
                              tablekey == 'global_empposted_jobs'}">
                              <button type="submit" class="btn btn-success info-sbtbtn" id="jobinfosbtbtn">Update</button>   
                            </c:when>
                            <c:otherwise>
                              <button type="button" class="btn btn-success sbtbtn">Update</button>   
                            </c:otherwise>
                          </c:choose>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!--Confirmation Model   -->
                  <%@include file="adminAddJobInfoModel.jsp" %>
                </form:form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <%@include file="/jsp/admin/adminBodyScriptLinks.jsp" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/theme/validations/adminValidations.js"></script>
    <script type="text/javascript">
      $(document).keypress(
        function(event){
          if (event.which == '13') {
            event.preventDefault();
          }
      });
    
    </script>
     <script src="${pageContext.request.contextPath}/theme/build/js/intlTelInput.js"></script>
  <script>
    var input = document.querySelector("#phone");
    window.intlTelInput(input, {
      // allowDropdown: false,
      // autoHideDialCode: false,
      // autoPlaceholder: "off",
      // dropdownContainer: document.body,
      // excludeCountries: ["us"],
      //formatOnDisplay: false,
       geoIpLookup: function(callback) {
         $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
           var countryCode = (resp && resp.country) ? resp.country : "";
           callback(countryCode);
         });
       },
      // hiddenInput: "full_number",
      // initialCountry: "auto",
      // localizedCountries: { 'de': 'Deutschland' },
      nationalMode: false,
      // onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
      // placeholderNumberType: "MOBILE",
      // preferredCountries: ['cn', 'jp'],
      // separateDialCode: true,
      utilsScript: "${pageContext.request.contextPath}/theme/build/js/utils.js",
    });
  </script>
  </body>
</html>