<script type="text/javascript">

var openLoginOrRegistrationModel = function(){
	 var urlValue = "";
	  var sessIsLive = <%=session.getAttribute("useremailid")!=null%>;
	  if(sessIsLive){
		$("#loginModal").modal("toggle");
	  }else{
		/* $("#regModal").modal("toggle"); */
		$("#loginModal").modal("toggle");
	  }
}
var userApplyPostedJob = function(fnType){
 $(".error").hide();
 var hasError = false;
alert(fnType);
 var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
 var loginEmailVal = $("#loginemail").val();
 var loginPwdVal = $("#loginpwd").val();
 var rowid = $("#rowid").val();
 var tablekey = $("#tablekey").val();
 var actionValue = "";
 var datParams="";
 var encodeData="";
 
 
 if(fnType=="login"){
	  actionValue = "login-applyjob?email= "+loginEmailVal+"&password= "+loginPwdVal+"&rowid="+rowid+"&tablekey="+tablekey;
	  encodeData = encodeURI(actionValue);
	  if(loginEmailVal.trim() == '') {
           $("#loginemail").after('<span class="error">Please enter your email address.</span>');
           hasError = true;
       }else if(!emailReg.test(loginEmailVal)) {
           $("#loginemail").after('<span class="error">Enter a valid email address.</span>');
           hasError = true;
       }else if(loginPwdVal.trim()=='' || loginPwdVal.length<4 ){
       	 $("#loginpwd").after('<span class="error">Please enter your valid password.And Minimum length is 4 characters. </span>');
	            hasError = true;
       } 
	  datParams = "email: "+loginEmailVal+","+"password: "+loginPwdVal;
 }

 if(hasError == true) { return false; }
   $.ajax({
           url : ""+encodeData,
           type: "POST",
           dataType: "json",
           async: false,  // <<== THAT makes us wait until the server is done.
           success : function(data) {
           	var errorData=null;
            	var successData=null;
           	const userStr = JSON.stringify(data);
           	JSON.parse(userStr, function replacer(key, value) {
           		  if(key=="errormsg"){
           			  if(value!=null){
           				  errorData = value;	  
           			  }
           		  }
           		});
           	
           	if(null==errorData){
           		successData ="Sucessfully applied.";
           		location.reload(true);
           		document.getElementById("loginerror").innerHTML="";
           		document.getElementById("loginsuccess").innerHTML=successData;
           	}else{

           		document.getElementById("loginerror").innerHTML=errorData;
           	}
           	
           }
   });
}
</script>

<style type="text/css">
.error{
    color: red;
}
  </style>