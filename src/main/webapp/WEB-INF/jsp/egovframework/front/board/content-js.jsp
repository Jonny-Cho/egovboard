<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
    $(function(){
        var tb = $("#tableTarget");
        $.ajax({
            url: '/board/${bid}',
            type: 'get',
            contentType: 'application/json; charset=utf8',
            dataType: 'json'
        })
        .done(function(board){
        	if(board.data === null || board.data.deletestatus === 'Y'){
				alert('해당 게시글이 없습니다');
				location.href = '/list';
        	} else {
	            $('#busername').text(board.data.busername);
	            $('#btitle').text(board.data.btitle);
	            $('#bcontent').html(board.data.bcontent);
        	}
        })
        .fail(function(){
            alert('데이터 요청에 실패했습니다');
            location.href = '/list';
        }); // ajax end
    });
</script>
