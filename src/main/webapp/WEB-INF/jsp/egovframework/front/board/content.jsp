<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<table id="tableTarget" class="table">
        <tr>
            <td id="bid">
                ${bid}
            </td>
        </tr>
        <tr>
            <td id="busername"></td>
        </tr>
        <tr>
            <td id="btitle"></td>
        </tr>
        <tr>
            <td id="bcontent"></td>
        </tr>
    </table>
    
   	<form id="hiddenForm" method="POST">
		<input type="hidden" id="hiddenPage" name="page"/>
		<input type="hidden" id="hiddenPerPageNum" name="perPageNum"/>
		<input type="hidden" id="hiddenSearchOption" name="searchOption"/>
		<input type="hidden" id="hiddenKeyword" name="keyword"/>
		<input type="hidden" id="hiddenStartDate" name="startDate"/>
		<input type="hidden" id="hiddenEndDate" name="endDate"/>
	</form>

    <a id="btnUpdate" class="btn btn-default" role="button">수정/삭제하기</a>
    <a id="btnList" class="btn btn-default" role="button">게시판 목록</a>
</div>