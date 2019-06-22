 <script type="text/javascript" src="${pageContext.request.contextPath}/theme/vendor/plugins/datatables/media/js/jquery.dataTables.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/theme/vendor/plugins/datatables/media/js/dataTables.bootstrap.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	 // Init DataTables
  

    $('#example').dataTable({
      "aoColumnDefs": [{
        'bSortable': true,
        'aTargets': [-1]
      }],
      "oLanguage": {
        "oPaginate": {
          "sPrevious": "",
          "sNext": ""
        }
      },
      "iDisplayLength": 5,
      "aLengthMenu": [
        [5, 10, 25, 50, -1],
        [5, 10, 25, 50, "All"]
      ],
      "sDom": '<"dt-panelmenu clearfix"lfr>t<"dt-panelfooter clearfix"ip>',
      "oTableTools": {
        "sSwfPath": "${pageContext.request.contextPath}/theme/vendor/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"
      }
    });
} );

</script>