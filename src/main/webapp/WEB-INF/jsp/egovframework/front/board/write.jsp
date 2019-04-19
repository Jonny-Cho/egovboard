<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<div class="form-group">
		<label for="bUsername">작성자</label>
		<input type="text" class="form-control" id="bUsername" name="bUsername"/>
	</div>
	<div class="form-group">
		<label for="bTitle">글 제목</label>
		<input type="text" class="form-control" id="bTitle" name="bTitle" />
	</div>
	<div class="form-group">
		<label for="bContent">글 내용</label>
		<textarea name="bContent" id="bContent" class="form-control"></textarea>
	</div>

	<a id="btnPost" class="btn btn-default">글쓰기</a>
	<a class="btn btn-default" href="/list" role="button">취소</a>
</div>