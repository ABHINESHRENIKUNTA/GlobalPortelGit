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
   <body class="dashboard-page">
      <%@include file="/jsp/admin/adminThemeChange.jsp" %>
      <%@include file="/jsp/admin/adminTopMenu.jsp" %>
      <%@include file="/jsp/admin/adminLeftMenu.jsp" %>
      <!-- Start: Content-Wrapper -->
      <section id="content_wrapper">
         <div class="col-md-12">
            <!-- <div class="page-header">
               <h4>Student Home Info</h4>
            </div> -->
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
                        <form:form method="post" id="submitform" action="adminaddstudenthomeinfo" modelAttribute="adminaddstuinfo"  enctype="multipart/form-data">
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
                                 
                                 <c:choose>
                                 <c:when test="${tablekey == 'global_postedbyadmin_jobs' or tablekey == 'global_refpost_jobs' or tablekey == 'global_jobconsult_jobs'}">
                                 <%@include file="adminReferralJobs.jsp" %>
                                 </c:when>
                                    
                                 <c:otherwise>
                                  <c:if test="${tablekey == 'global_statewisegovt_jobs'}">
                                  <div class="col-sm-12">
                                    <div class="form-group">
                                       <label for="tablename">Select State<span class="text-danger">*</span></label>
                                       <label class="error" for="states" id="states_error">This field is required.</label>
                                       <select id="listBox" name="state" class="select2-single form-control"><option value="SELECT STATE">SELECT STATE</option><option value="Andhra Pradesh">Andhra Pradesh</option><option value="Arunachal Pradesh">Arunachal Pradesh</option><option value="Assam">Assam</option><option value="Bihar">Bihar</option><option value="Chhattisgarh">Chhattisgarh</option><option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option><option value="Daman and Diu">Daman and Diu</option><option value="Delhi">Delhi</option><option value="Goa">Goa</option><option value="Gujarat">Gujarat</option><option value="Haryana">Haryana</option><option value="Himachal Pradesh">Himachal Pradesh</option><option value="Jammu and Kashmir">Jammu and Kashmir</option><option value="Jharkhand">Jharkhand</option><option value="Karnataka">Karnataka</option><option value="Kerala">Kerala</option><option value="Madhya Pradesh">Madhya Pradesh</option><option value="Maharashtra">Maharashtra</option><option value="Manipur">Manipur</option><option value="Meghalaya">Meghalaya</option><option value="Mizoram">Mizoram</option><option value="Nagaland">Nagaland</option><option value="Orissa">Orissa</option><option value="Puducherry">Puducherry</option><option value="Punjab">Punjab</option><option value="Rajasthan">Rajasthan</option><option value="Sikkim">Sikkim</option><option value="Tamil Nadu">Tamil Nadu</option><option value="Telangana">Telangana</option><option value="Tripura">Tripura</option><option value="Uttar Pradesh">Uttar Pradesh</option><option value="Uttarakhand">Uttarakhand</option><option value="West Bengal">West Bengal</option></select>
                                    </div>
                                 </div>
                                 </c:if>
                                  <c:if test="${tablekey == 'global_abroad_jobs'}">
                                  <div class="col-sm-12">
                                    <div class="form-group">
                                       <label for="tablename">Select Country<span class="text-danger">*</span></label>
                                       <label class="error" for="country" id="states_error">This field is required.</label>
                                       <select id="countrylistBox" name="countryiso" class="select2-single form-control">
                                          <option value="0">SELECT COUNTRY</option>
                                        <c:forEach items="${countryList}" var="listofcountries">
                                          <option value="${listofcountries.iso}">${listofcountries.nicename}</option>
                                        </c:forEach>
                                       </select>
                                    </div>
                                 </div>
                                 </c:if>
                                 
                                 <div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="linkname">Link Name<span class="text-danger">*</span></label>
                                       <label class="error" for="linkname" id="linkname_error">This field is required.</label>
                                       <form:input type="text" path="linkname"  placeholder="Enter Link name" class="form-control" />
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="siteurl">Site URL<span class="text-danger">*</span></label>
                                       <label class="error" for="linkaddress" id="linkaddress_error">This field is required.</label>
                                       <form:input type="text" path="linkaddress" placeholder="Enter sie URL" class="form-control"/>
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="uploadimage">Upload Image<span class="text-danger">*</span></label>
                                       <label class="error" for="linkaddress" id="imagepath_error">This field is required.</label>
                                       <input type="file" name="imagepath" id="imagepath" class="btn btn-success fileupload-add form-control"  accept="image/*" onchange="showMyImage(this)" >
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="emailid">Email#<span class="text-danger">*</span></label>
                                       <label class="error" for="emailid" id="emailid_error">This field is required.</label>
                                       <form:input type="text" path="emailid"  placeholder="Enter sie URL" class="form-control"/>
                                    </div>
                                 </div>
                                 <div class="col-sm-12">
                                    <div class="form-group">
                                       <label for="comments">Comments / Description<span class="text-danger">*</span></label>
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
						    				<div id="radioBtn" class="btn-group">
						    					<a class="btn btn-primary btn-sm active" data-toggle="isactive" data-title="true">YES</a>
						    					<a class="btn btn-primary btn-sm notActive" data-toggle="isactive" data-title="false">NO</a>
						    				</div>
						    				<form:hidden path="isactive" />
						    			</div>
						    		</div>
						    	</div>
                                 <div class="col-sm-12">
                                    <div class="col-sm-6" align="left">
                                       <button type="reset" class="btn btn-danger">Clear</button>   
                                    </div>
                                    <div class="col-sm-6" align="right">
                                    <c:choose>
                                     <c:when test="${tablekey == 'global_postedbyadmin_jobs' or tablekey == 'global_refpost_jobs' or tablekey == 'global_jobconsult_jobs'}">

                                       <button type="submit" class="btn btn-success">Submit</button>   
                                     </c:when>
                                    <c:otherwise>
                                    
                                       <button type="button" class="btn btn-success sbtbtn">Submit</button>   
                                    </c:otherwise>
                                    </c:choose>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <!-- Modal -->
                           <div class="bs-example">
                              <div id="myModal" class="modal fade" tabindex="-1">
                                 <div class="modal-dialog">
                                    <div class="modal-content">
                                       <div class="modal-header bg-success">
                                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                                          <h5 class="modal-title">Confirmation</h5>
                                       </div>
                                       <div class="modal-body" style="background-color: #c8e6c9">
                                          <!--  <p>Do you want to save changes to this document before closing?</p> -->
                                          <!-- <p class="text-secondary"><small>If you don't save, your changes will be lost.</small></p> -->
                                          <div class="col-sm-12">
                                             <div class="col-sm-3"> <label for="tablename">Selected Page</label> </div>
                                             <div class="col-sm-1"> <label for="tablename">:</label> </div>
                                             <div class="col-sm-8"> <span class="tablenameclass"></span> </div>
                                          </div>
                                          <div class="col-sm-12">
                                             <div class="col-sm-3"> <label for="linkname">Link Name</label> </div>
                                             <div class="col-sm-1"> <label for="linkname">:</label> </div>
                                             <div class="col-sm-8"> <span class="lnameclass"></span> </div>
                                          </div>
                                          <div class="col-sm-12">
                                             <div class="col-sm-3"> <label for="siteurl">Site URL</label> </div>
                                             <div class="col-sm-1"> <label for="siteurl">:</label> </div>
                                             <div class="col-sm-8"> <span class="siteurlclass"></span> </div>
                                          </div>
                                          <div class="col-sm-12">
                                             <div class="col-sm-3"> <label for="emailid">Email#</label> </div>
                                             <div class="col-sm-1"> <label for="emailid">:</label> </div>
                                             <div class="col-sm-8"> <span class="emailidclass"></span> </div>
                                          </div>
                                          <div class="col-sm-12">
                                             <div class="col-sm-3"> <label for="comments">Description</label> </div>
                                             <div class="col-sm-1"> <label for="comments">:</label> </div>
                                             <div class="col-sm-8"> <span class="commentsclass"></span> </div>
                                          </div>
                                          <div class="col-sm-12">
                                             <div class="col-sm-3"> <label for="actorinacts">Active</label> </div>
                                             <div class="col-sm-1"> <label for="actorinacts">:</label> </div>
                                             <div class="col-sm-8"> <span class="actorinactsclass"></span> </div>
                                          </div>
                                          <div class="col-sm-12">
                                             <div class="col-sm-3"> <label for="comments">Preview</label> </div>
                                             <div class="col-sm-1"> <label for="comments">:</label> </div>
                                             <div class="col-sm-8"><img id="thumbnil" style="width:25%;" src="" alt="image"/> </div>
                                          </div>
                                          <div class="row"></div>
                                       </div>
                                       <div class="modal-footer bg-success">
                                          <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                                          <button type="submit" class="btn btn-primary">Submit Data</button>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </form:form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <%@include file="/jsp/admin/adminBodyScriptLinks.jsp" %>
      <script type="text/javascript">
         $(".select2-single").select2();
         
         $(function() {
             $(".sbtbtn").click(function() {
                 $('.error').hide();
         	      // validate and process form here
         	     var selpageval = $("#tablekey").val();
         	     //var selpage = $("#tablename").val();
         	     var lnkname = $("#linkname").val();
             	 var linkurl = $("#linkaddress").val();
             	 var emailid = $("#emailid").val();
             	 var comments = $("#comments").val();
             	 var actorinact =  $("#isactive").val();
         	      
         	      var imgpat = $("#imagepath");
                   var fplg = imgpat[0].files.length;  
                   
         	  		/* if (selpage == "0") {
         	        $("label#tablename_error").show();
         	        $("input#tablename").focus();
         	        return false;
         	      } */
         	  		if (lnkname == "" || lnkname.trim() == "") {
         	        $("label#linkname_error").show();
         	        $("input#linkname").focus();
         	        return false;
         	      }
         	  		if (linkurl == "" || linkurl.trim() == "") {
         	        $("label#linkaddress_error").show();
         	        $("input#linkaddress").focus();
         	        return false;
         	      }
         	  		if (emailid == "" || emailid.trim() == "") {
         	        $("label#emailid_error").show();
         	        $("input#emailid").focus();
         	        return false;
         	      }
         	  		if (fplg == 0) {
         	        $("label#imagepath_error").show();
         	        $("input#emailid").focus();
         	        return false;
         	      }
         	      
         	  		if (comments == "") {
         	        $("label#comments_error").show();
         	        $("input#comments").focus();
         	        return false;
         	      }
         
             	 
             	
             	
             	
             	$("#myModal").modal('show');
             	
             	//  $(".tablenameclass").text($('#tablename option:selected').html()); 
             	  $(".tablenameclass").text(selpageval); 
             	  $(".lnameclass").text(lnkname); 
             	  $(".siteurlclass").text(linkurl); 
             	  $(".emailidclass").text(emailid); 
             	  $(".commentsclass").text(comments); 
             	  $(".actorinactsclass").text(actorinact); 
             });
           });
           
         function showMyImage(fileInput) {
         	var files = fileInput.files;
         	for (var i = 0; i < files.length; i++) { 
         	var file = files[i];
         	var imageType = /image.*/; 
         	if (!file.type.match(imageType)) {
         	continue;
         	} 
         	var img=document.getElementById("thumbnil"); 
         	img.file = file; 
         	var reader = new FileReader();
         	reader.onload = (function(aImg) { 
         	return function(e) { 
         	aImg.src = e.target.result; 
         	}; 
         	})(img);
         	reader.readAsDataURL(file);
         	} 
         	}
         
      </script>
        <script type="text/javascript">
      window.onload=function(){
    	  var sel =  $("#radioBtn a").data('title');
    	  $("#isactive").val(sel);
      }
      
    
      </script>
   </body>
</html>