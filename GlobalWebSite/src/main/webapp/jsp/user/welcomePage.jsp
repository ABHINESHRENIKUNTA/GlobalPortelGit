<!DOCTYPE html>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Global Website</title>
 <%@include file="userHomePageHeaderLinks.jsp" %>

</head>

<body>

 <%@include file="userHeader.jsp" %>

  <!--==========================
    Intro Section
  ============================-->
  <section id="intro">
    <div class="intro-container">
      <div id="introCarousel" class="carousel  slide carousel-fade" data-ride="carousel">
	
        <ol class="carousel-indicators"></ol>
		<form:form action="redirectURL" method="GET">
        <div class="carousel-inner" role="listbox">
		<c:forEach items="${admdata}" var="admdata" varStatus="loop">
		${loop.index}
		<c:if test="${loop.index==0}">
		
          <div class="carousel-item active">
            <div class="carousel-background"><img src="${pageContext.request.contextPath}/userDashboardImage?userImage=${admdata.filename}" alt=""></div>
            <div class="carousel-container">
              <div class="carousel-content">
                
                <button class="btn-get-started scrollto" name="redirecturl"  value="${admdata.linkname}">Click Here</button>
              </div>
            </div>
          </div>
            
          </c:if>
          <c:if test="${loop.index>0}">
		
          <div class="carousel-item ">
            <div class="carousel-background"><img src="${pageContext.request.contextPath}/userDashboardImage?userImage=${admdata.filename}" alt=""></div>
            <div class="carousel-container">
              <div class="carousel-content">
                <button class="btn-get-started scrollto" name="redirecturl"  value="${admdata.linkname}">Click Here</button>
              </div>
            </div>
          </div>
           
          </c:if>
       
		</c:forEach>
         


        </div>
		</form:form>
        <a class="carousel-control-prev" href="#introCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon ion-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>

        <a class="carousel-control-next" href="#introCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon ion-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>

      </div>
    </div>
  </section><!-- #intro -->

  <main id="main">

 
    <!--==========================
      Clients Section
    ============================-->
    <section id="clients" class="wow fadeInUp">
      <div class="container">

        <header class="section-header">
          <h3>Website Links</h3>
        </header>
        <div class="owl-carousel clients-carousel">
        <c:forEach items="${logosList}" var="logosList" varStatus="loop">
          <img src="${pageContext.request.contextPath}/viewcompanylogs?userImage=${logosList.filename}" alt="">
        </c:forEach>
        </div>

      </div>
    </section><!-- #clients -->

    <!--==========================
      Services Section
    ============================-->
    <section id="services">
      <div class="container">

        <header class="section-header wow fadeInUp">
          <h3>BROWSE JOBS</h3>
          <p> Find the below most of the popular web sites information. </p>
        </header>

        <div class="row">

          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-analytics"></i></div>
            <h4 class="title"><a href="load-jobcategories">Jobs Info</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings. </p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-bookmarks"></i></div>
            <h4 class="title"><a href="view-useradmitcards">Admit Cards</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-paper-outline"></i></div>
            <h4 class="title"><a href="view-userresults">Results</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-people"></i></div>
            <h4 class="title"><a href="comingSoonPage">Educational Info</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-paper"></i></div>
            <h4 class="title"><a href="comingSoonPage">Ticketing Info</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-musical-notes"></i></div>
            <h4 class="title"><a href="comingSoonPage">Entertainment Info</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="icon ion-card"></i></div>
            <h4 class="title"><a href="comingSoonPage">Id Cards Info</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="icon ion-cash"></i></div>
            <h4 class="title"><a href="comingSoonPage">Banks/Payments</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-football"></i></div>
            <h4 class="title"><a href="comingSoonPage">Sports Info</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="icon ion-social-facebook"></i></div>
            <h4 class="title"><a href="comingSoonPage">Socail Networking</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-medkit"></i></div>
            <h4 class="title"><a href="comingSoonPage">Health Info</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="icon ion-bag"></i></div>
            <h4 class="title"><a href="comingSoonPage">Shopping Info</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="icon ion-android-restaurant"></i></div>
            <h4 class="title"><a href="comingSoonPage">Food Info</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-information"></i></div>
            <h4 class="title"><a href="comingSoonPage">Software Related Info</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="ion-ios-people-outline"></i></div>
            <h4 class="title"><a href="comingSoonPage">Marraige Related Info</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="icon ion-android-plane"></i></div>
            <h4 class="title"><a href="comingSoonPage">Tours & Travels</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>
          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
            <div class="icon"><i class="icon ion-android-bus"></i></div>
            <h4 class="title"><a href="comingSoonPage">Packers & Movers</a></h4>
            <p class="description">We will provide you to search through many job boards / career sites and other sources of job postings.</p>
          </div>

        </div>

      </div>
    </section><!-- #services -->

   

  </main>

  <%@include file="userFooter.jsp" %>

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
 
 <%@include file="userHomePageFooterLinks.jsp" %>
</body>
</html>
