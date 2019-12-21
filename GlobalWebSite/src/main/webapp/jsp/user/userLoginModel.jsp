<div id="loginModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
        		Login
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <span style="color:red; align:center" id="loginerror"></span>
                <span style="color:green; text-align:center" id="loginsuccess"></span>
        	</div>
            <!-- dialog body -->
            <div class="modal-body">
                <div class="row">
                        <div class="col-xs-24">
                        <div class="col-xs-6">
                            <div class="form-group">
                                <input type="email" name="username" id="loginemail" class="form-control" placeholder="Your Email *" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required="required"/>
                            </div>
                         </div>
                         <div class="col-xs-6">
                            <div class="form-group">
                                <input name="password" id="loginpwd" type="password" class="form-control" placeholder="Your Password *" />
                            </div>
                        </div>
                       </div>
                	</div>
            </div>
            <!-- dialog buttons -->
            <div class="modal-footer bg-purple"><button type="button" class="btn btn-primary" onclick="userApplyPostedJob('login');">Login & Apply</button>
           <!-- <button type="button" class="btn btn-primary pull-left" onclick="userApplyPostedJob('regisration');">Register & Apply</button> --></div>
        </div>
    </div>
</div>

<script>


     /*  $("#regModal").modal('hide'); */
      $("#loginModal").modal('hide');
      
    function socialWindow(url) {
        var left = (screen.width - 570) / 2;
        var top = (screen.height - 570) / 2;
        var params = "menubar=no,toolbar=no,status=no,width=570,height=570,top=" + top + ",left=" + left;
        window.open(url,"NewWindow",params);
    }

        var pageUrl = encodeURIComponent(document.URL);
        var tweet = encodeURIComponent(jQuery("meta[property='og:description']").attr("content"));
        
       function facebookFun() {
            url = "https://www.facebook.com/sharer.php?u=" + pageUrl;
            alert(url);
            socialWindow(url);
        }

        function twitterFun() {
            url = "https://twitter.com/intent/tweet?url=" + pageUrl + "&text=" + tweet;
            socialWindow(url);
        }
        function googlePlusFun() {
            url = "https://plus.google.com/share?url=" + pageUrl + "&text=" + tweet;
            socialWindow(url);
        }

        function linkedinFun() {
            url = "https://www.linkedin.com/shareArticle?mini=true&url=" + pageUrl;
            socialWindow(url);
        }
        function mailToFun() {
        	 if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
               
            url = "whatsapp://send?text=" + pageUrl;
            socialWindow(url);
        }else{
            alert('You Are Not On A Mobile Device. Please Use This Button To Share On Mobile');
       }
        }
       /*  var pageTitle = encodeURIComponent(page.title);
        var body_message = $('#content-result').html();
        var email = 'test@mail.com';
        var subject = pageTitle;
        var mailto_link = 'mailto:' + email + '?subject=' + subject + '&body=' + body_message;
        function mailToFun() {
        	socialWindow(mailto_link);
        } */
    </script>