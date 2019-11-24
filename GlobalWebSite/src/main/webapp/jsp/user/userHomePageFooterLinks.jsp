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

<script>
var currentPage = document.location.pathname.replace(/.+\//i, "")
$("ul.nav-menu li a[href^='"+currentPage+"']").parent().addClass("menu-active");
</script>