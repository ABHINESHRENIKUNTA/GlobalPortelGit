<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>Edit Dashboard</title>
  <meta name="keywords" content="GlobalWebsite" />
  <meta name="description" content="GlobalWebsite">
  <meta name="author" content="GlobalWebsite">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@include file="adminHeaderLinks.jsp" %>
<style type="text/css">
.errorClass{
	color:red;
}

</style>
</head>
<body class="dashboard-page">
<%@include file="adminThemeChange.jsp" %>
<%@include file="adminTopMenu.jsp" %>
<%@include file="adminLeftMenu.jsp" %>

<!-- Start: Content-Wrapper -->
<section id="content_wrapper">
<div class="col-md-12">
            <div class="bs-component">
              <div class="panel">
                 <div class="panel-heading">
                  <ul class="nav panel-tabs-border panel-tabs panel-tabs-left">
                    <li class="active">
                      <a href="addScrollLink">Add</a>
                    </li>
                    <li>
                      <a href="editScrollLink">Edit</a>
                    </li>
                    <li>
                      <a href="deleteScrollLink" >Delete</a>
                    </li>
                  </ul>
                </div> 
                <div class="panel-body">
                 
            
            <div class="admin-form">

              <div class="panel heading-border">
                <div class="panel-body bg-light">
                  <form:form method="post" action="addLink" modelAttribute="addLink">
                    <div class="section-divider mb40" id="spy1">
                      <span>Add New Site</span>
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
                    <!-- .section-divider -->

                    <!-- Basic Inputs -->
                    <div class="row">
                      <div class="col-md-8">
                        <div class="section">
                          <label class="field">
                            <form:input path="linkname"  type="text" name="from" id="from" class="gui-input" placeholder="Please Enter Link Name" />
                            <form:errors path="linkname" cssClass="errorClass"/>
                          </label>
                        </div>
                      </div>
                      <!-- <div class="col-md-4">
                        <div class="section">
                          <label class="field">
                            <input type="text" name="from" id="from" class="gui-input" placeholder="Disabled no icon" disabled>
                          </label>
                        </div>
                      </div> -->
                    </div>

                    <!-- Input Icons -->
                    <div class="row">
                      <div class="col-md-4">
                        <div class="section">
                          <label class="field prepend-icon">
                            <form:input path="linkaddress" type="url" name="LinkAddress" id="firstname" class="gui-input" placeholder="Please Enter Site Url" />
                            <form:errors path="linkaddress" cssClass="errorClass" />
                            <label for="firstname" class="field-icon">
                              <i class="fa fa-user"></i>
                            </label>
                          </label>
                        </div>
                      </div>
                     
                      <div class="col-md-4">
                        <div class="section">
                          <label class="field append-icon">
                            <form:input path="addedby" type="text" name="AddedBy" id="firstname" class="gui-input" placeholder="Enter Link Created Author Name" />
                            <form:errors path="addedby" cssClass="errorClass" />
                            <label for="firstname" class="field-icon">
                              <i class="fa fa-user"></i>
                            </label>
                          </label>
                        </div>
                      </div>
                      <!-- <div class="col-md-4">
                        <div class="section">
                          <label class="field prepend-icon">
                            <input type="text" name="firstname" id="firstname" class="gui-input" placeholder="Disabled with icon" disabled>
                            <label for="firstname" class="field-icon">
                              <i class="fa fa-user"></i>
                            </label>
                          </label>
                        </div>
                      </div> -->
                    </div>

                    <!-- Input Formats -->
                    <div class="row">
                      <div class="col-md-4">
                        <div class="section">
                          <label class="field prepend-icon">
                            <form:input path="addeddate" type="date" name="addedDate" placeholder="createdDate" id="website" class="gui-input"/>
                            <form:errors path="addeddate" cssClass="errorClass" />
                          </label>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="section">
                          <label class="field prepend-icon">
                            <form:input path="emailid" type="email" name="email" id="email" class="gui-input" placeholder="Email input"/>
                            <form:errors path="emailid" cssClass="errorClass"/>
                            <label for="email" class="field-icon">
                              <i class="fa fa-envelope"></i>
                            </label>
                          </label>
                        </div>
                      </div>
                      <%-- <div class="col-md-4">
                        <div class="section">
                          <label class="field prepend-icon">
                            <form:input path="Mobileno" type="tel" name="mobile" id="mobile" class="gui-input" placeholder="Telephone input"/>
                            <form:errors path="Mobileno"/>
                            <label for="mobile" class="field-icon">
                              <i class="fa fa-phone-square"></i>
                            </label>
                          </label>
                        </div>
                      </div> --%>
                      <!-- <div class="col-md-4">
                        <div class="section">
                          <label class="field prepend-icon">
                            <input type="search" name="s" id="s" class="gui-input" placeholder="Disabled Search input" disabled>
                            <label for="s" class="field-icon">
                              <i class="fa fa-search"></i>
                            </label>
                          </label>
                        </div>
                      </div> -->
                    </div>

                    <!-- Multi Selects -->
<!--                     <div class="row">
                      <div class="col-md-4">
                        <div class="section">
                          <label class="field select">
                            <select id="country" name="country">
                              <option value="">Select with single arrow</option>
                              <option value="AL">Albania</option>
                              <option value="DZ">Algeria</option>
                            </select>
                            <i class="arrow"></i>
                          </label>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="section">
                          <label class="field select">
                            <select id="selectID" name="selectID">
                              <option value="">Select with double arrows</option>
                              <option value="1">Option 1</option>
                              <option value="2">Option</option>
                            </select>
                            <i class="arrow double"></i>
                          </label>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="section">
                          <label class="field select">
                            <select id="selectID" name="selectID" disabled>
                              <option value="">Select with double arrows</option>
                              <option value="1">Option 1</option>
                              <option value="2">Option 2</option>
                            </select>
                            <i class="arrow double"></i>
                          </label>
                        </div>
                      </div>
                    </div>
 -->
                    <!-- Text Areas -->
                    <div class="row">
                      <div class="col-md-8">
                        <div class="section">
                          <label class="field prepend-icon">
                            <form:textarea path="comments" class="gui-textarea" id="comment" name="comment" placeholder="Please Enter Comments"/>
 							<form:errors path="comments" cssClass="errorClass"/>                         
                            <label for="comment" class="field-icon">
                              <i class="fa fa-comments"></i>
                            </label>
                            <span class="input-footer">
                              <strong>Hint:</strong>To Know Why Adding Link</span>
                          </label>
                        </div>
                      </div>
 <div>
                      <button type="submit">Submit</button>
                      </div>
                  </form:form>
                </div>
              </div>
            </div>

          </div>
          <!-- <section>
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="section-title">
							<h2>Our Partners</h2>
							<p>Mida sit una namet, cons uectetur adipiscing adon elit.</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="owl-carousel">
							<div class="item">
								<div class="partner-logo"><img src="images/demo/partners-1.png" alt="partners"></div>
							</div>
							<div class="item">
								<div class="partner-logo"><img src="images/demo/partners-2.png" alt="partners"></div>
							</div>
							<div class="item">
								<div class="partner-logo"><img src="images/demo/partners-3.png" alt="partners"></div>
							</div>
							<div class="item">
								<div class="partner-logo"><img src="images/demo/partners-4.png" alt="partners"></div>
							</div>
							<div class="item">
								<div class="partner-logo"><img src="images/demo/partners-5.png" alt="partners"></div>
							</div>
							<div class="item">
								<div class="partner-logo"><img src="images/demo/partners-6.png" alt="partners"></div>
							</div>
							<div class="item">
								<div class="partner-logo"><img src="images/demo/partners-7.png" alt="partners"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section> -->
</section>

<%@include file="adminBodyScriptLinks.jsp" %>
</body>
</html>