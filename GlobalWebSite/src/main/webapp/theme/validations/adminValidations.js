/**
 * 
 */
	  window.onload=function(){
	    	  var sel =  $("#radioBtn a").data('title');
	    	  $("#isactive").val(sel);
	      }
         $(".select2-single").select2();
         var abroad = "global_abroad_jobs";
         
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
             	 var countryiso =  $("#countryiso").val();
             	 var countrystate =  $("#countrystate").val();
         	      
         	      var imgpat = $("#imagepath");
                  var fplg = imgpat[0].files.length;  
                   
         	  		/* if (selpage == "0") {
         	        $("label#tablename_error").show();
         	        $("input#tablename").focus();
         	        return false;
         	      } */
         	      
         	       if(abroad==selpageval){ 
         	  		if (countryiso == "0" || countryiso.trim() == "") {
         	        $("label#countryiso_error").show();
         	        $("input#countryiso").focus();
         	        return false;
         	        }
         	  		if (countrystate.trim() == "" || countryiso.trim() == null) {
         	        $("label#countrystate_error").show();
         	        $("input#countrystate").focus();
         	        return false;
         	        }
         	       }
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
         	  		/* if (emailid == "" || emailid.trim() == "") {
         	        $("label#emailid_error").show();
         	        $("input#emailid").focus();
         	        return false;
         	      } */
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
         
    
      
      
      $(function() {
          $(".info-sbtbtn").click(function() {
              $('.error').hide();
      	      // validate and process form here
      	     var selpageval = $("#tablekey").val();	
      	     //var selpage = $("#tablename").val();
      	     var jobtitle = $("#jobtitle").val();
          	 var industry = $("#industryid").val();
          	 var company = $("#company").val();
          	 var qualification = $("#qualification").val();
          	 var experience =  $("#experience").val();
          	 var noticeperiod =  $("#noticeperiod").val();
          	 var rolecategory =  $("#rolecategory").val();
          	 var salary =  $("#salary").val();
          	 var noofpossitions =  $("#noofpossitions").val();
          	 var jobtype =  $("#jobtype").val();
          	 var emailid =  $("#emailid").val();
          	 var contactnum =  $("#contactnum").val();
          	 var location =  $("#location").val();
          	 var jobresponsibilities =  $("#jobresponsibilities").val();
          	 var skillreq =  $("#skillreq").val();
      	      
      	  	  
      	  	  if (jobtitle == "" || jobtitle.trim() == "") {
      	  		  $("label#jobtitle_error").show();
      	  		  $("input#jobtitle").focus();
      	  		  return false;
      	  	  }
      	  	  if (industry == "0" || industry.trim() == "") {
      	  		  $("label#industry_error").show();
      	  		  $("input#industry").focus();
      	  		  return false;
      	  	  }
      	  	  if (company == "" || company.trim() == "") {
      	  			$("label#company_error").show();
      	  			$("input#company").focus();
      	  			return false;
      	  	  }
      	  	  if (qualification == "" || qualification.trim() == "") {
      	  		  $("label#qualification_error").show();
      	  		  $("input#qualification").focus();
      	  		  return false;
      	  	  }
      	  	  if (experience == "" || experience.trim() == "") {
      	  		  $("label#experience_error").show();
      	  		  $("input#experience").focus();
      	  		  return false;
      	  	  }
      	  	  if (noticeperiod == "" || noticeperiod.trim() == "") {
      	  		  $("label#noticeperiod_error").show();
      	  		  $("input#noticeperiod").focus();
      	  		  return false;
      	  	  }
      	  	  if (rolecategory == "" || rolecategory.trim() == "") {
      	  		  $("label#rolecategory_error").show();
      	  		  $("input#rolecategory").focus();
      	  		  return false;
      	  	  }
      	  	  if (salary == "" || salary.trim() == "") {
      	  		  $("label#salary_error").show();
      	  		  $("input#salary").focus();
      	  		  return false;
      	  	  }
      	  	  if (noofpossitions == "0" || noofpossitions.trim() == "") {
      	  		  $("label#noofpossitions_error").show();
      	  		  $("input#noofpossitions").focus();
      	  		  return false;
      	  	  }
      	  	  if (jobtype == "0" || jobtype.trim() == "") {
      	  		  $("label#jobtype_error").show();
      	  		  $("input#jobtype").focus();
      	  		  return false;
      	  	  }
      	      if (emailid == "" || emailid.trim() == "") {
      	        $("label#emailid_error").show();
      	        $("input#emailid").focus();
      	        return false;
      	      }
      	  	  if (contactnum == "" || contactnum.trim() == "") {
      	  		  $("label#contactnum_error").show();
      	  		  $("input#contactnum").focus();
      	  		  return false;
      	  	  }
      	  	  if (location == "" || location.trim() == "") {
      	  		  $("label#location_error").show();
      	  		  $("input#location").focus();
      	  		  return false;
      	  	  }
      	  	  if (jobresponsibilities == "" || jobresponsibilities.trim() == "") {
     	  		  $("label#jobresponsibilities_error").show();
     	  		  $("input#jobresponsibilities").focus();
     	  		  return false;
     	  	  }
     	  	  if (skillreq == "" || skillreq.trim() == "") {
     	        $("label#skillreq_error").show();
     	        $("input#skillreq").focus();
     	        return false;
     	      }
      	  	
      	  	
          });
        });
    
