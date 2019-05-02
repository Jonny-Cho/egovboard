<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
    $(function(){
    	
        $.ajax({
            url: '/board/${bid}',
            type: 'get',
            contentType: 'application/json; charset=utf8',
            dataType: 'json'
        })
        .done(function(board){
        	if(board.data === null || board.data.deletestatus === 'Y'){
				alert('해당 게시글이 없습니다');
				submitHiddenForm('/list');
        	} else {
	            $('#busername').text(board.data.busername);
	            $('#btitle').text(board.data.btitle);
	            $('#bcontent').html(board.data.bcontent);
        	}
        })
        .fail(function(){
            alert('데이터 요청에 실패했습니다');
            submitHiddenForm('/list');
        }); // ajax end
        
        // 수정/삭제하기 버튼
        $('#btnUpdate').click(function(){
        	submitHiddenForm('/update/${bid}');
        });
        
        // 게시판 목록 버튼
        $('#btnList').click(function(){
        	submitHiddenForm('/list');
        });
        
    	function submitHiddenForm(url){
        	$('#hiddenPage').val('${boardVo.getPage()}');
        	$('#hiddenPerPageNum').val('${boardVo.getPerPageNum()}');
        	$('#hiddenSearchOption').val('${boardVo.getSearchOption()}');
        	$('#hiddenKeyword').val('${boardVo.getKeyword()}');
        	$('#hiddenStartDate').val('${boardVo.getStartDate()}');
        	$('#hiddenEndDate').val('${boardVo.getEndDate()}');
        	$('#hiddenForm').attr('action', url).submit();
        }
    });
</script>
