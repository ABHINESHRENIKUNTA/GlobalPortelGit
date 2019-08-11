 <script src="${pageContext.request.contextPath}/theme/usernewdesign/pagination/Flexible.Pagination.js" type="text/javascript"></script>
    
    <script>
    $(function() {

        var flexiblePagination = $('#content').flexiblePagination({
            itemsPerPage : 10,
            itemSelector : 'li.content-result:visible',
            pagingControlsContainer : '#pagination',
            showingInfoSelector : '#showingInfo',
            css: {
                btnNumberingClass: 'btn btn-sm btn-default',
                btnFirstClass: 'btn btn-sm btn-default',
                btnLastClass: 'btn btn-sm btn-default',
                btnNextClass: 'btn btn-sm btn-default',
                btnPreviousClass: 'btn btn-sm btn-default',
                btnActiveClass: 'btn btn-sm btn-primary'
            }
        });
        flexiblePagination.getController().onPageClick = function(pageNum, e){
            console.log('You Clicked Page: '+pageNum)
        };

// Direct JS Object method of using the FlexiblePagination
//        var pager = new Flexible.Pagination();
//        pager.itemsPerPage = 1;
//        pager.pagingContainer = '#content';
//        pager.itemSelector = 'div.result:visible';  //That is, Select and paginate only the filtered visible '.result' div.
//        pager.pagingControlsContainer = '#pagingControls';
//        pager.showCurrentPage();
    });

    </script>