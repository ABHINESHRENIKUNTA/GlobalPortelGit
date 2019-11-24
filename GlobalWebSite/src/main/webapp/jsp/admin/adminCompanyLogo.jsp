<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>Admin Add Company Scroll Logos</title>
  <meta name="keywords" content="GlobalWebsite" />
  <meta name="description" content="GlobalWebsite">
  <meta name="author" content="GlobalWebsite">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
<%@include file="adminHeaderLinks.jsp" %>
</head>
<body class="dashboard-page">
<%@include file="adminThemeChange.jsp" %>
<%@include file="adminTopMenu.jsp" %>
<%@include file="adminLeftMenu.jsp" %>

<!-- Start: Content-Wrapper -->
<section id="content_wrapper">
<form:form method="post" action="admininsert-companyLogos" modelAttribute="companyLogos"  enctype="multipart/form-data">
<div class="col-md-12">
           
              <div class="panel">
                <div class="panel-heading">
                  <ul class="nav panel-tabs-border panel-tabs panel-tabs-left">
                    <li class="active">
                      <a href="view-companylogopage" >Add</a>
                    </li>
                    <li>
                      <a href="delete-companylogopage">Delete</a>
                    </li>
                  </ul>
                </div>
                <div class="panel-body">
                  <div class="tab-content pn br-n">
                    <div id="tab2_1" class="tab-pane active">
                      <div class="row">
                        <div class="col-md-12">
                             <div class="admin-form">
                       <div class="admin-form theme-primary">

              <div class="panel heading-border panel-primary">
                <div class="panel-body bg-light">
                  
                    <div class="section-divider mb40" id="spy1">
                      <span>Add Data</span>
                    </div>
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
                    <div class="col-md-6">
                        <div class="section">
                          <label class="field prepend-icon append-button file">
                            <span class="button btn-primary">Choose File</span>
                            <input type="file" class="gui-file" name="file1" id="file1" required="required" onchange="document.getElementById('uploader1').value = this.value;" accept=".jpg,.jpeg,.png">
                            <input type="text" class="gui-input" id="uploader1" placeholder="Please Select A File"/>
                            <label class="field-icon">
                              <i class="fa fa-upload" style="margin-top: 15px;"></i>
                            </label><span style="color: green;"> <b>NOTE:</b> Please upload in the given size: Width: 300px, height: 75px; </span>
                          </label>
                        </div>
                      </div>
                  </div>
                       <div class="col-md-12">
                       <div class="col-md-6">
                        <div class="section">
                          <label class="field prepend-icon">
                            <form:input type="text" path="title" id="title" class="gui-input" required="required" placeholder="Title"/>
                            <label class="field-icon" >
                              <i class="fa fa-edit" style="margin-top: 15px;"></i>
                            </label>
                          </label>
                        </div>
                      </div>
                     </div>
                        <div class="col-md-12">
                       <div class="col-md-6">
                        <div class="section">
                          <label class="field prepend-icon">
                            <form:input type="text" path="linkname" id="firstname" required="required" class="gui-input" placeholder="Link"/>
                            <label class="field-icon" >
                              <i class="fa fa-globe" style="margin-top: 15px;"></i>
                            </label>
                          </label>
                        </div>
                      </div>
                     </div>
                      <div class="col-md-12">
                     <div class="col-xs-2">
	                    <input type="submit" value="Submit" class="btn btn-success btn-gradient btn-alt btn-block item-active">
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
              </div>
            </div>

         
           </form:form>
</section>

<%@include file="adminBodyScriptLinks.jsp" %>
<script type="text/javascript">

var _URL = window.URL || window.webkitURL;

$("#file1").change(function(e) {
    var file, img;
	var maxWidth = 300;
	var maxHeight = 70;

    if ((file = this.files[0])) {
        img = new Image();
        img.onload = function() {
        var selWidth = this.width; 
        var selHeight = this.height;
        if(selWidth>maxWidth || selHeight>maxHeight){
        	alert("Warning! Please upload in the given Height and Width pixels.");
        }
        };
        img.onerror = function() {
            alert( "not a valid file: " + file.type);
        };
        img.src = _URL.createObjectURL(file);


    }

});

</script>
</body>
</html>