
        <%if((session.isNew()||request.getSession(false) == null)||(null==session.getAttribute("username"))){
		 response.sendRedirect("adminlogout");	
	     System.out.print("****************session out**********************");
	}else{
		 
		 System.out.print("****************session not time out**********************");
		 System.out.print("**************************************"+ session.getAttribute("username"));
	}
	
       
	
	%>
<!-- Font CSS (Via CDN) -->
  <link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'>

  <!-- FullCalendar Plugin CSS -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/theme/vendor/plugins/fullcalendar/fullcalendar.min.css">

  <!-- Theme CSS -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/theme/assets/skin/default_skin/css/theme.css">

  <!-- Admin Forms CSS -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/theme/assets/admin-tools/admin-forms/css/admin-forms.min.css">

  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/theme/assets/img/favicon.ico">
  
  <!-- Single search drop-down  -->
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/theme/vendor/plugins/select2/css/core.css">
   
   <!-- Date Range Picker  -->
<%--   <link href="${pageContext.request.contextPath}/theme/vendor/plugins/daterange/daterangepicker.css" rel="stylesheet" type="text/css" />
 --%>   
  <style>
  .gly-spin {
  -webkit-animation: spin 2s infinite linear;
  -moz-animation: spin 2s infinite linear;
  -o-animation: spin 2s infinite linear;
  animation: spin 2s infinite linear;
}
@-moz-keyframes spin {
  0% {
    -moz-transform: rotate(0deg);
  }
  100% {
    -moz-transform: rotate(359deg);
  }
}
@-webkit-keyframes spin {
  0% {
    -webkit-transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(359deg);
  }
}
@-o-keyframes spin {
  0% {
    -o-transform: rotate(0deg);
  }
  100% {
    -o-transform: rotate(359deg);
  }
}
@keyframes spin {
  0% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(359deg);
    transform: rotate(359deg);
  }
}
.gly-rotate-90 {
  filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=1);
  -webkit-transform: rotate(90deg);
  -moz-transform: rotate(90deg);
  -ms-transform: rotate(90deg);
  -o-transform: rotate(90deg);
  transform: rotate(90deg);
}
.gly-rotate-180 {
  filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=2);
  -webkit-transform: rotate(180deg);
  -moz-transform: rotate(180deg);
  -ms-transform: rotate(180deg);
  -o-transform: rotate(180deg);
  transform: rotate(180deg);
}
.gly-rotate-270 {
  filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
  -webkit-transform: rotate(270deg);
  -moz-transform: rotate(270deg);
  -ms-transform: rotate(270deg);
  -o-transform: rotate(270deg);
  transform: rotate(270deg);
}
.gly-flip-horizontal {
  filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=0, mirror=1);
  -webkit-transform: scale(-1, 1);
  -moz-transform: scale(-1, 1);
  -ms-transform: scale(-1, 1);
  -o-transform: scale(-1, 1);
  transform: scale(-1, 1);
}
.gly-flip-vertical {
  filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=2, mirror=1);
  -webkit-transform: scale(1, -1);
  -moz-transform: scale(1, -1);
  -ms-transform: scale(1, -1);
  -o-transform: scale(1, -1);
  transform: scale(1, -1);
}
  #radioBtn .notActive{
    color: #3276b1;
    background-color: #fff;
    
    /* color: #fff;
    background-color: red; */
}
  </style>
  
    <style type="text/css">
      
         .error{
         color:red;
         display: none;
         }
      </style>
         
    <script type="text/javascript">
    
    
  /* var myAjaxFunction = function(tablevalue){
	    $.ajax({
	            url : "load-adminaddstuinfo",
	            
	            type: "POST",
	            dataType: "json",
	            data: jQuery.param({ tablevalues: tablevalue}) ,
	            success : 
	            
	            function(data) { 
	            	
	            }
	    });
  }  */
    </script>
