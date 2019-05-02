<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(function(){
	
	var page = '${boardVo.getPage()}';
	var perPageNum = '${boardVo.getPerPageNum()}';
	var keyword = '${boardVo.getKeyword()}';
	var startPage = 1;
	var endPage = 10;
	var prev = false;
	var next = true;
	var displayPageNum = 10;
	var searchOption = '${boardVo.getSearchOption()}';
	var startDate = '${boardVo.getStartDate()}';
	var endDate = '${boardVo.getEndDate()}';
	
	function getContents(){
		
		$.ajax({
	        url: '/board',
	        type: 'GET',
	        data: 'page='+page+'&perPageNum='+perPageNum+'&searchOption='+searchOption+'&keyword='+keyword+'&startDate='+startDate+'&endDate='+endDate,
	        contentType: 'application/x-www-form-urlencoded; charset=utf8',
	        dataType: 'json'
	    })
	    .done(function(board){
	        var tbodyTarget = $('#tbodyTarget');
	        tbodyTarget.empty();
	        
	        for(var i=0, dataLen=board.data.length; i<dataLen; i++){
	            // tr만들기
	            var newTr = document.createElement('tr');
	            newTr.className = 'trTarget';
	            
	            // td만들고 bid넣기 * 3
	            var tdBid = document.createElement('td');
	            tdBid.id = 'bid';
	            var tdBusername = document.createElement('td');
	            var tdBtitle = document.createElement('td');
	            var tdCreatedate = document.createElement('td');
	            
	            tdBid.textContent = board.data[i].bid;
	            tdBusername.textContent = board.data[i].busername;
	            tdBtitle.textContent = board.data[i].btitle;
	            tdCreatedate.textContent = board.data[i].createdate.split('.')[0].replace('T', ' ');
	            
	            // tr에 td넣기
	            newTr.append(tdBid, tdBusername, tdBtitle, tdCreatedate);
	            // tbody에 tr넣기
	            tbodyTarget.append(newTr);
	        }
	        // table에 tbody넣기
	        moveToContent();
	    })
	    .fail(function(){
	        alert('failed');
	    }); // ajax end
	}
    
    function moveToContent (){
        $('#tbodyTarget').delegate("tr", "click", function(){
        	var bid = $(this).find('#bid').text();
        	location.href = '/list/' + bid + '?page=' + page + '&perPageNum=' + perPageNum + '&searchOption=' + searchOption + '&keyword=' + keyword + '&startDate=' + startDate + '&endDate=' + endDate;
        });
    }
    
    function getPagination(){
		
		$.ajax({
    		url: '/countTotalBoard',
    		method: 'GET',
    		data: 'searchOption='+searchOption+'&keyword='+keyword+'&startDate='+startDate+'&endDate='+endDate,
    		contentType: 'application/x-www-form-urlencoded; charset=utf8',
    		dataType: 'text'
    	})
    	.done(function(totalCount){
    		
    		endPage = Math.ceil((page / displayPageNum)) * displayPageNum;
    		
    		var tempEndPage = Math.ceil(totalCount / perPageNum);
    		
    		if(endPage > tempEndPage){
    			endPage = tempEndPage;
    		}
    		
    		startPage = endPage - displayPageNum + 1;
    		if(startPage <= 0){
    			startPage = 1;
    		}
    		
    		if(endPage % displayPageNum !== 0){
    			startPage = endPage - (endPage % displayPageNum) + 1; 
    		}
    		
    		prev = startPage == 1 ? false : true;
    		next = endPage * perPageNum >= totalCount ? false : true;
    		
     		var ulTarget = $('.pagination');
    		
    		ulTarget.empty();
			
    		var str = "";
    		
    		// 이전버튼
    		if(prev){
    			str += "<li id='prev'><a><span aria-hidden='true'>&laquo;</span></a></li>"
    		}
    		
    		// 숫자버튼
    		for(var i=startPage; i<=endPage; i++){
    			if(page == i){
	    			str += "<li class='active'><a class='num'>"+i+"</a></li>";
    			} else {
	    			str += "<li><a class='num'>"+i+"</a></li>";
    			}
    		}
    		
    		// 다음버튼
    		if(next){
    			str += "<li id='next'><a><span aria-hidden='true'>&raquo;</span></a></li>"
    		}
   			
    		ulTarget.append(str);
    		
    		movePage();
    		printNextPage();
    		printPrevPage();
    	})
    	.fail(function(){
    		alert('failed');
    	});
    }
    
    $('#btnSearch').click(function(e){
    	e.preventDefault();
    	
    	page = 1;

    	setFormData();
    	getContents();
    	getPagination();
    });
    
    function movePage(){
	    $('.pagination a.num').click(function(){
	    	page = $(this).text();
	    	
	    	setFormData();
	    	getContents();
	    	getPagination();
	    });
    }
    
    function printNextPage(){
    	$('#next').click(function(){
	    	page = endPage + 1;
	    	
	    	setFormData();
	    	getContents();
	    	getPagination();
    	})
    }
    
    function printPrevPage(){
    	$('#prev').click(function(){
	    	page = startPage - 1;
	    	
	    	setFormData();
	    	getContents();
	    	getPagination();
    	})
    }
    
    function setFormData(){
    	searchOption = $('#searchOption').val();
    	
    	$('#startDate').val() === '' ? startDate = new Date('2019-01-01').yyyymmdd() : startDate = $('#startDate').val();
    	$('#endDate').val() === '' ? endDate = new Date().yyyymmdd() : endDate = $('#endDate').val();

    	keyword = $('#keyword').val();
    }

    // datepicker
     $('.datepicker-here').datepicker({
    	language: 'en',
    	clearButton: true,
    	todayButton: new Date(),
    	autoClose: true,
    	maxDate: new Date()
    })
    
    $('#startDate').datepicker({
    	onHide: function(dp, animationCompleted){
    		if (!animationCompleted){
    			if($('#startDate').val() !== ''){
	    			startDate = $('#startDate').val()
	    			setEndDate(startDate);
    			}
    		}
    	}
    })
    
    function setEndDate(startDate){
		$('#endDate').datepicker({
			minDate: new Date(startDate)
	    })
    }

    $('#endDate').datepicker({
    	onHide: function(dp, animationCompleted){
    		if (!animationCompleted){
    			if($('#endDate').val() !== ''){
	    			endDate = $('#endDate').val()
	    			setStartDate(endDate);
    			}
    		}
    	}
    })
    
    function setStartDate(endDate){
    	$('#startDate').datepicker({
    		maxDate: new Date(endDate)
    	})
    }
    
	Date.prototype.yyyymmdd = function() {
		var mm = this.getMonth() + 1; // getMonth() is zero-based
		var dd = this.getDate();
		
		return [this.getFullYear(),
		        (mm>9 ? '' : '0') + mm,
		        (dd>9 ? '' : '0') + dd
		       ].join('-');
	};
    
    // default values
    '${boardVo.getSearchOption()}'=== '' ? $('#searchOption').val('all') : $('#searchOption').val('${boardVo.getSearchOption()}');
    $('#keyword').val('${boardVo.getKeyword()}');
    $('#startDate').val('${boardVo.getStartDate()}');
    $('#endDate').val('${boardVo.getEndDate()}');

    $('#btnWrite').click(function(){
    	location.href = '/write?page=' + page + '&perPageNum=' + perPageNum + '&searchOption=' + searchOption + '&keyword=' + keyword + '&startDate=' + startDate + '&endDate=' + endDate;
    });
    
    setFormData();
	getContents();
    getPagination();
});
</script>
