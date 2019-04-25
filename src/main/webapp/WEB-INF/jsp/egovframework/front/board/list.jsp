<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
	
	<form id="formTarget" class="form-horizontal">
		<div class="form-group col-sm-9">
			<input type="text" class="form-control" id="keyword">
		</div>
		<div class="form-group col-sm-3">
			<input id="btnSearch" type="submit" value="검색" class="form-control">
		</div>
	</form>
	
    <table class="table">
        <thead>
            <tr>
                <th width="20%">번호</th>
                <th width="40%">작성자</th>
                <th width="40%">제목</th>
                <!-- <th>생성일</th> -->
            </tr>
        </thead>
        <tbody id="tbodyTarget">
        </tbody>
    </table>
    
    <a class="btn btn-default" href="/write" role="button">글쓰기</a>
	
	<nav aria-label="Page navigation" id="paging">
		<ul class="pagination">
		</ul>
	</nav>
	
</div>
