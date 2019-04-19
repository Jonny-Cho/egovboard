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

	<a id="btnUpdate" class="btn btn-default">수정하기</a>
	<a class="btn btn-default" href="/list/${bid}" role="button">취소</a>
	<a id="btnDelete" class="btn btn-default">삭제하기</a>
</div>