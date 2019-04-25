<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
    $(function(){
        // 내용 표시
        $.ajax({
            url: '/board/${bid}',
            type: 'GET',
            contentType: 'application/json; charset=utf8',
            dataType: 'json'
        })
        .done(function(board){
            $('#bUsername').val(board.data.busername);
            $('#bTitle').val(board.data.btitle);
            var str = board.data.bcontent;
            var regex = /<br\s*[\/]?>/gi;
            $('#bContent').html(str.replace(regex, "\n"));
        })
        .fail(function(){
            alert('failed');
        }); // ajax end
  
        // 수정 기능
        $("#btnUpdate").click(function(){
    		var busername = $('#bUsername').val();
    		var btitle = $('#bTitle').val();
    		var bcontent = $('#bContent').val();
        	
        	if(busername.trim() === null || btitle.trim() === null || bcontent.trim() === null || busername.trim() === '' || btitle.trim() === '' || bcontent.trim() === ''){
    			alert('모든 값을 입력해주세요');
    		} else {
    			var data = {
   					bid: '${bid}',
	        		busername: busername,
					btitle: btitle,
					bcontent: bcontent.replace(/\n/g, '<br />')
    			}
		        $.ajax({
		        	url : '/board',
		        	method : 'PUT',
		        	data : JSON.stringify(data),
		        	dataType : 'json',
		        	contentType : 'application/json; charset=UTF-8'
		        })
		        .done(function(){
		        	alert('수정이 완료되었습니다');
		        	location.href='/list/${bid}?page=${boardVO.getPage()}&perPageNum=${boardVO.getPerPageNum()}&keyword=${boardVO.getKeyword()}';
		        })
		        .fail(function(){
		        	alert('수정에 실패했습니다');
		        });
    		}
        });
        
        // 삭제 기능
        $('#btnDelete').click(function(){
            $.ajax({
                url: '/board/${bid}',
                method: 'DELETE',
                contentType: 'application/json',
                dataType: 'json'
            })
            .done(function(data){
                alert('삭제되었습니다');
            })
            .fail(function(){
                alert('삭제에 실패했습니다. 게시판 목록으로 이동합니다');
            })
            .always(function(){
                location.href='/list?page=${boardVO.getPage()}&perPageNum=${boardVO.getPerPageNum()}&keyword=${boardVO.getKeyword()}';
            }); // ajax end
		});
        
        // 취소 버튼
        $('#btnCancel').click(function(){
        	location.href = '/list/${bid}?page=${boardVO.getPage()}&perPageNum=${boardVO.getPerPageNum()}&keyword=${boardVO.getKeyword()}';
        });
    });
</script>
