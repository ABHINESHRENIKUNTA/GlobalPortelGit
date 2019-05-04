<!DOCTYPE html>
<html lang="en">
<head>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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

  <!-- =======================================================
    Theme Name: BizPage
    Theme URL: https://bootstrapmade.com/bizpage-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
	

</head>

<body>

 <%@include file="userHeader.jsp" %>
 
  <main id="main" style="background-color: black">
    <section id="clients" class="wow fadeInUp"  >
      <div class="container">

        <header class="section-header">
          <h3 style="color:white">User Type</h3>
        </header>
   		  <div class="row" style="background-color: white">

          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
          <a href="studentLogin">
          <img src="${pageContext.request.contextPath}/theme/userhome/img/studentlogin.jpg" alt="">
        	</a>
        	 <h3 style="margin-left: 50px">STUDENT</h3>
          </div>
            <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
            <a href="EmployeLogin">
          <img src="${pageContext.request.contextPath}/theme/userhome/img/employeelogin.jpg" alt="" style="margin-top: 30px;"></a>
          <h3 style="margin-left: 40px">EMPLOYEE</h3>
          </div>
           <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
           <a href="ReferalLogin">
          <img src="${pageContext.request.contextPath}/theme/userhome/img/referallogin.jpg" alt="" style="margin-top: 30px;"></a>
     		<h3 style="margin-left: 45px">REFERAL</h3>
          </div>
          </div>
  	</div>
  	</section>
  </main>

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