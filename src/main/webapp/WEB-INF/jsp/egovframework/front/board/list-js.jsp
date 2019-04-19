<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(function(){
    var tb = $("#tableTarget");
    $.ajax({
        url: '/board',
        type: 'get',
        contentType: 'application/json; charset=utf8',
        dataType: 'json'
    })
    .done(function(board){
        var newTbody = document.createElement('tbody');
        newTbody.id = 'tbodyTarget';

        for(var i=0, dataLen=board.data.length; i<dataLen; i++){
            // tr만들기
            var newTr = document.createElement('tr');
            newTr.className = 'trTarget';
            
            // td만들고 bid넣기 * 3
            var tdBid = document.createElement('td');
            tdBid.id = 'bid';
            var tdBusername = document.createElement('td');
            var tdBtitle = document.createElement('td');
            
            tdBid.textContent = board.data[i].bid;
            tdBusername.textContent = board.data[i].busername;
            tdBtitle.textContent = board.data[i].btitle;
            
            // tr에 td넣기
            newTr.append(tdBid, tdBusername, tdBtitle);
            // tbody에 tr넣기
            newTbody.append(newTr);
        }
        // table에 tbody넣기
        tb.append(newTbody);
        
        moveToContent();
    })
    .fail(function(){
        alert('failed');
    }); // ajax end
    
    function moveToContent (){
        $('#tbodyTarget').delegate("tr", "click", function(){
        	var bid = $(this).find('#bid').text();
        	location.href = '/list/' + bid;
        });
    }
});
</script>
