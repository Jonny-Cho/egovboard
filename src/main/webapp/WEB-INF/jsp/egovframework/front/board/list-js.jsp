<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(function(){
    
	console.log('${boardVO.getPage()}');
	console.log('${boardVO.getPerPageNum()}');
	console.log('${boardVO.getKeyword()}' === '');
	console.log('${boardVO.getKeyword()}');
	
	$('#keyword').val('${boardVO.getKeyword()}');
	
	var page = '${boardVO.getPage()}';
	var perPageNum = '${boardVO.getPerPageNum()}';
	var keyword = '${boardVO.getKeyword()}';
	var startPage = 1;
	var endPage = 10;
	var prev = false;
	var next = true;
	var displayPageNum = 10;
	
	// functionalization
	function getContents(keyword){
		
		if(keyword === undefined){
			keyword = '';
		}
		
		$.ajax({
	        url: '/board',
	        type: 'GET',
	        data: 'page='+page+'&perPageNum='+perPageNum+'&keyword='+keyword,
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
	            //var tdCreatedate = document.createElement('td');
	            
	            tdBid.textContent = board.data[i].bid;
	            tdBusername.textContent = board.data[i].busername;
	            tdBtitle.textContent = board.data[i].btitle;
	            //tdCreatedate.textContent = board.data[i].createdate;
	            
	            // tr에 td넣기
	            newTr.append(tdBid, tdBusername, tdBtitle);
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
        	location.href = '/list/' + bid + '?page=' + page + '&perPageNum=' + perPageNum + '&keyword=' + keyword;
        });
    }
    
    function getPagination(keyword){
		
		if(keyword === undefined){
			keyword = '';
		}
		
		$.ajax({
    		url: '/countTotalBoard',
    		method: 'GET',
    		data: 'keyword='+keyword,
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
    
    // 검색 -> 데이타 총 갯수 -> 페이지네이션
    getContents(keyword);
    getPagination(keyword);
    
    $('#btnSearch').click(function(e){
    	e.preventDefault();
    	
    	page = 1;
    	keyword = $('#keyword').val();
    	getContents(keyword);
    	getPagination(keyword);
    });
    
    function movePage(){
	    $('.pagination a.num').click(function(){
	    	page = $(this).text();
	    	
	    	keyword = $('#keyword').val();
	    	getContents(keyword);
	    	getPagination(keyword);
	    });
    }
    
    function printNextPage(){
    	$('#next').click(function(){
	    	page = endPage + 1;
	    	
	    	keyword = $('#keyword').val();
	    	getContents(keyword);
	    	getPagination(keyword);
    	})
    }
    
    function printPrevPage(){
    	$('#prev').click(function(){
	    	page = startPage - 1;
	    	
	    	keyword = $('#keyword').val();
	    	getContents(keyword);
	    	getPagination(keyword);
    	})
    }
    
});
</script>
