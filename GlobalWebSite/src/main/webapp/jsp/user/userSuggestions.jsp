<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <title>Global Website</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="${pageContext.request.contextPath}/theme/userhome/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="${pageContext.request.contextPath}/theme/userhome/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/theme/userhome/lib/animate/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/theme/userhome/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/theme/userhome/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/theme/userhome/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="${pageContext.request.contextPath}/theme/userhome/css/style.css" rel="stylesheet">

</head>
<body>
<%@include file="userHeader.jsp" %>
<section id="intro">
    
  </section><!-- #intro -->
<section id="skills">
<main id="main">
<div class="container">

    <div class="row">
	  <div class="col-lg-1"> </div>
      <div class="col-lg-9 col-lg-offset-2">
        
        <form:form id="contact-form" method="post" action="" role="form" commandName="usersuggestion">

        <div class="messages"></div>

        <div class="controls">

          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="form_name">First Name *</label>
                <input id="form_name" type="text" name="name" class="form-control" placeholder="Please enter your firstname *" required="required" data-error="Firstname is required.">
                <div class="help-block with-errors"></div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="form_lastname">Last Name *</label>
                <input id="form_lastname" type="text" name="surname" class="form-control" placeholder="Please enter your lastname *" required="required" data-error="Lastname is required.">
                <div class="help-block with-errors"></div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="form_email">Email *</label>
                <input id="form_email" type="email" name="email" class="form-control" placeholder="Please enter your email *" required="required" data-error="Valid email is required.">
                <div class="help-block with-errors"></div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="form_phone">Phone</label>
                <input id="form_phone" type="tel" name="phone" class="form-control" placeholder="Please enter your phone">
                <div class="help-block with-errors"></div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="form-group">
                <label for="form_message">Message *</label>
                <textarea id="form_message" name="message" class="form-control" placeholder="Message for me *" rows="4" required data-error="Please,leave us a message."></textarea>
                <div class="help-block with-errors"></div>
              </div>
            </div>
            <div class="col-md-12">
              <input type="submit" class="btn btn-success btn-send pull-right" value="Send message">
            </div>
          </div>
         
        </div>

        </form:form>

      </div>

    </div>

  </div>
  </main>
  </section>
 <%@include file="userFooter.jsp" %>

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <!-- Uncomment below i you want to use a preloader -->
  <!-- <div id="preloader"></div> -->

  <!-- JavaScript Libraries -->
  <script src="${pageContext.request.contextPath}/theme/userhome/lib/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/theme/userhome/lib/jquery/jquery-migrate.min.js"></script>
  <script src="${pageContext.request.contextPath}/theme/userhome/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/theme/userhome/lib/easing/easing.min.js"></script>
  <script src="${pageContext.request.contextPath}/theme/userhome/lib/superfish/hoverIntent.js"></script>
  <script src="${pageContext.request.contextPath}/theme/userhome/lib/superfish/superfish.min.js"></script>
  <script src="${pageContext.request.contextPath}/theme/userhome/lib/wow/wow.min.js"></script>
  <script src="${pageContext.request.contextPath}/theme/userhome/lib/waypoints/waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/theme/userhome/lib/counterup/counterup.min.js"></script>
  <script src="${pageContext.request.contextPath}/theme/userhome/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/theme/userhome/lib/isotope/isotope.pkgd.min.js"></script>
  <script src="${pageContext.request.contextPath}/theme/userhome/lib/lightbox/js/lightbox.min.js"></script>
  <script src="${pageContext.request.contextPath}/theme/userhome/lib/touchSwipe/jquery.touchSwipe.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="${pageContext.request.contextPath}/theme/userhome/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="${pageContext.request.contextPath}/theme/userhome/js/main.js"></script>
</body>
</html>