<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
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
                <!-- <div class="panel-heading">
                  <ul class="nav panel-tabs-border panel-tabs panel-tabs-left">
                    <li class="active">
                      <a disabled>Add</a>
                    </li>
                    <li>
                      <a data-toggle="tab" active>Edit</a>
                    </li>
                    <li>
                      <a disabled>Delete</a>
                    </li>
                  </ul>
                </div> -->
                <div class="panel-body">
                 
            <!-- Begin: Admin Form -->
            <div class="admin-form">

              <div class="panel heading-border">
                <div class="panel-body bg-light">
                  <form:form method="post" action="" id="form-ui" modelAttribute="">
                    <div class="section-divider mb40" id="spy1">
                      <span>Edit Exisiting Site</span>
                    </div>
                    <!-- .section-divider -->

                    <!-- Basic Inputs -->
                    <div class="row">
                      <div class="col-md-8">
                        <div class="section">
                          <label class="field">
                            <input type="text" name="from" id="from" class="gui-input" placeholder="Input no icon">
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
                            <input type="text" name="firstname" id="firstname" class="gui-input" placeholder="Input icon left">
                            <label for="firstname" class="field-icon">
                              <i class="fa fa-user"></i>
                            </label>
                          </label>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="section">
                          <label class="field append-icon">
                            <input type="text" name="firstname" id="firstname" class="gui-input" placeholder="Input icon right">
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
                            <input type="url" name="website" id="website" class="gui-input" placeholder="URL input">
                            <label for="website" class="field-icon">
                              <i class="fa fa-globe"></i>
                            </label>
                          </label>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="section">
                          <label class="field prepend-icon">
                            <input type="email" name="email" id="email" class="gui-input" placeholder="Email input">
                            <label for="email" class="field-icon">
                              <i class="fa fa-envelope"></i>
                            </label>
                          </label>
                        </div>
                      </div>
                      <div class="col-md-4 hidden">
                        <div class="section">
                          <label class="field prepend-icon">
                            <input type="tel" name="mobile" id="mobile" class="gui-input" placeholder="Telephone input">
                            <label for="mobile" class="field-icon">
                              <i class="fa fa-phone-square"></i>
                            </label>
                          </label>
                        </div>
                      </div>
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
                    <div class="row">
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
                      <!-- <div class="col-md-4">
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
                      </div> -->
                    </div>

                    <!-- Text Areas -->
                    <div class="row">
                      <div class="col-md-8">
                        <div class="section">
                          <label class="field prepend-icon">
                            <textarea class="gui-textarea" id="comment" name="comment" placeholder="Text area"></textarea>
                            <label for="comment" class="field-icon">
                              <i class="fa fa-comments"></i>
                            </label>
                            <span class="input-footer">
                              <strong>Hint:</strong>Don't be negative or off topic! just be awesome...</span>
                          </label>
                        </div>
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