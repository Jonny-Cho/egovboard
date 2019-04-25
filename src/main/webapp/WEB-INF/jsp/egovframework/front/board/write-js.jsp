<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
$(function(){
	$('#btnPost').click(function(){
		var busername = $('#bUsername').val();
		var btitle = $('#bTitle').val();
		var bcontent = $('#bContent').val();
		
		if(busername.trim() === null || btitle.trim() === null || bcontent.trim() === null || busername.trim() === '' || btitle.trim() === '' || bcontent.trim() === ''){
			alert('모든 값을 입력해주세요');
		} else {
			var data = {
        		busername: busername,
				btitle: btitle,
				bcontent: bcontent.replace(/\n/g, '<br />')
   			}
			$.ajax({
				url : '/board',
				method : 'POST',
				data : JSON.stringify(data),
	 			dataType : 'json',
			 	contentType : 'application/json; charset=UTF-8'
			})
			.done(function(board){
				location.href = '/list';
			})
			.fail(function(){
				alert('failed');
			});
		}
	});
	
    // 취소 버튼
    $('#btnCancel').click(function(){
    	location.href = '/list?page=${boardVO.getPage()}&perPageNum=${boardVO.getPerPageNum()}&keyword=${boardVO.getKeyword()}';
    });
});
</script>
