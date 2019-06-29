 <!-- BEGIN: PAGE SCRIPTS -->
  <style>
  /* demo page styles */
  body { min-height: 2300px; }
  
  .content-header b,
  .admin-form .panel.heading-border:before,
  .admin-form .panel .heading-border:before {
    transition: all 0.7s ease;
  }
  /* responsive demo styles */
  @media (max-width: 800px) {
    .admin-form .panel-body { padding: 18px 12px; }
    .option-group .option {	display: block; }
    .option-group .option + .option {	margin-top: 8px; }
  }
  </style>
  <!-- jQuery -->

 <!-- jQuery -->
  <script src="${pageContext.request.contextPath}/theme/vendor/jquery/jquery-1.11.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/theme/vendor/jquery/jquery_ui/jquery-ui.min.js"></script>

  <!-- Time/Date Plugin Dependencies -->
  <script src="${pageContext.request.contextPath}/theme/vendor/plugins/globalize/globalize.min.js"></script>
  <script src="${pageContext.request.contextPath}/theme/vendor/plugins/moment/moment.min.js"></script>

  <!-- BS Dual Listbox Plugin -->
  <script src="${pageContext.request.contextPath}/theme/vendor/plugins/duallistbox/jquery.bootstrap-duallistbox.min.js"></script>

  <!-- Bootstrap Maxlength plugin -->
  <script src="${pageContext.request.contextPath}/theme/vendor/plugins/maxlength/bootstrap-maxlength.min.js"></script>

  <!-- Select2 Plugin Plugin -->
  <script src="${pageContext.request.contextPath}/theme/vendor/plugins/select2/select2.min.js"></script>

  <!-- Typeahead Plugin -->
  <script src="${pageContext.request.contextPath}/theme/vendor/plugins/typeahead/typeahead.bundle.min.js"></script>

  <!-- TagManager Plugin -->
  <script src="${pageContext.request.contextPath}/theme/vendor/plugins/tagmanager/tagmanager.js"></script>

  <!-- DateRange Plugin -->
  <script src="${pageContext.request.contextPath}/theme/vendor/plugins/daterange/daterangepicker.min.js"></script>

  <!-- DateTime Plugin -->
  <script src="${pageContext.request.contextPath}/theme/vendor/plugins/datepicker/js/bootstrap-datetimepicker.min.js"></script>

  <!-- BS Colorpicker Plugin -->
  <script src="${pageContext.request.contextPath}/theme/vendor/plugins/colorpicker/js/bootstrap-colorpicker.min.js"></script>

  <!-- MaskedInput Plugin -->
  <script src="${pageContext.request.contextPath}/theme/vendor/plugins/jquerymask/jquery.maskedinput.min.js"></script>

  <!-- Theme Javascript -->
  <script src="${pageContext.request.contextPath}/theme/assets/js/utility/utility.js"></script>
  <script src="${pageContext.request.contextPath}/theme/assets/js/demo/demo.js"></script>
  <script src="${pageContext.request.contextPath}/theme/assets/js/main.js"></script>

 <script type="text/javascript" src="${pageContext.request.contextPath}/theme/vendor/plugins/datepicker/js/bootstrap-datetimepicker.min.js"></script>
 
  <script type="text/javascript">
  jQuery(document).ready(function() {

    "use strict";

    // Init Theme Core    
    Core.init();
    // Init Demo JS  
    Demo.init();


    // Form Switcher
    $('#form-switcher > button').on('click', function() {
      var btnData = $(this).data('form-layout');
      var btnActive = $('#form-elements-pane .admin-form.active');

      // Remove any existing animations and then fade current form out
      btnActive.removeClass('slideInUp').addClass('animated fadeOutRight animated-shorter');
      // When above exit animation ends remove leftover classes and animate the new form in
      btnActive.one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
        btnActive.removeClass('active fadeOutRight animated-shorter');
        $('#' + btnData).addClass('active animated slideInUp animated-shorter')
      });
    });

    // Cache several DOM elements
    var pageHeader = $('.content-header').find('b');
    var adminForm = $('.admin-form');
    var options = adminForm.find('.option');
    var switches = adminForm.find('.switch');
    var buttons = adminForm.find('.button');
    var Panel = adminForm.find('.panel');

    // Form Skin Switcher
    $('#skin-switcher a').on('click', function() {
      var btnData = $(this).data('form-skin');

      $('#skin-switcher a').removeClass('item-active');
      $(this).addClass('item-active')

      adminForm.each(function(i, e) {
        var skins = 'theme-primary theme-info theme-success theme-warning theme-danger theme-alert theme-system theme-dark';
        var panelSkins = 'panel-primary panel-info panel-success panel-warning panel-danger panel-alert panel-system panel-dark';
        $(e).removeClass(skins).addClass('theme-' + btnData);
        Panel.removeClass(panelSkins).addClass('panel-' + btnData);
        pageHeader.removeClass().addClass('text-' + btnData);
      });

      $(options).each(function(i, e) {
        if ($(e).hasClass('block')) {
          $(e).removeClass().addClass('block mt15 option option-' + btnData);
        } else {
          $(e).removeClass().addClass('option option-' + btnData);
        }
      });
      $(switches).each(function(i, ele) {
        if ($(ele).hasClass('switch-round')) {
          if ($(ele).hasClass('block')) {
            $(ele).removeClass().addClass('block mt15 switch switch-round switch-' + btnData);
          } else {
            $(ele).removeClass().addClass('switch switch-round switch-' + btnData);
          }
        } else {
          if ($(ele).hasClass('block')) {
            $(ele).removeClass().addClass('block mt15 switch switch-' + btnData);
          } else {
            $(ele).removeClass().addClass('switch switch-' + btnData);
          }
        }

      });
      buttons.removeClass().addClass('button btn-' + btnData);
    });

    setTimeout(function() {
      adminForm.addClass('theme-primary');
      Panel.addClass('panel-primary');
      pageHeader.addClass('text-primary');

      $(options).each(function(i, e) {
        if ($(e).hasClass('block')) {
          $(e).removeClass().addClass('block mt15 option option-primary');
        } else {
          $(e).removeClass().addClass('option option-primary');
        }
      });
      $(switches).each(function(i, ele) {

        if ($(ele).hasClass('switch-round')) {
          if ($(ele).hasClass('block')) {
            $(ele).removeClass().addClass('block mt15 switch switch-round switch-primary');
          } else {
            $(ele).removeClass().addClass('switch switch-round switch-primary');
          }
        } else {
          if ($(ele).hasClass('block')) {
            $(ele).removeClass().addClass('block mt15 switch switch-primary');
          } else {
            $(ele).removeClass().addClass('switch switch-primary');
          }
        }
      });
      buttons.removeClass().addClass('button btn-primary');
    }, 800);

  });
  </script>
   <script>
  $('#radioBtn a').on('click', function(){
	    var sel = $(this).data('title');
	    var tog = $(this).data('toggle');
	    $('#'+tog).prop('value', sel);
	    $('a[data-toggle="'+tog+'"]').not('[data-title="'+sel+'"]').removeClass('active').addClass('notActive');
	    $('a[data-toggle="'+tog+'"][data-title="'+sel+'"]').removeClass('notActive').addClass('active');
	    $("#isactive").val(sel);
	})
  </script>
  <!-- END: PAGE SCRIPTS -->