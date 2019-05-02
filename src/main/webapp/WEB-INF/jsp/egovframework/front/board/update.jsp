<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<div class="form-group">
		<input type="hidden" class="form-control" id="bid" name="bid" value="${bid}"/>
	</div>
	<div class="form-group">
		<label for="bUsername">작성자</label>
		<input type="text" class="form-control" id="bUsername" name="bUsername" readonly/>
	</div>
	<div class="form-group">
		<label for="bTitle">글 제목</label>
		<input type="text" class="form-control" id="bTitle" name="bTitle" />
	</div>
	<div class="form-group">
		<label for="bContent">글 내용</label>
		<textarea name="bContent" id="bContent" class="form-control"></textarea>
	</div>

   	<form id="hiddenForm" method="POST">
		<input type="hidden" id="hiddenPage" name="page"/>
		<input type="hidden" id="hiddenPerPageNum" name="perPageNum"/>
		<input type="hidden" id="hiddenSearchOption" name="searchOption"/>
		<input type="hidden" id="hiddenKeyword" name="keyword"/>
		<input type="hidden" id="hiddenStartDate" name="startDate"/>
		<input type="hidden" id="hiddenEndDate" name="endDate"/>
	</form>

	<a id="btnUpdate" class="btn btn-default">수정하기</a>
	<a id="btnCancel" class="btn btn-default" role="button">취소</a>
	<a id="btnDelete" class="btn btn-default">삭제하기</a>
</div>