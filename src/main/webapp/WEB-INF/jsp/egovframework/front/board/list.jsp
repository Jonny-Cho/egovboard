<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
	
	<form id="formTarget" class="form-horizontal">
		<div class="form-group col-sm-3">
			<select class="form-control" id="searchOption">
				<option value="username">작성자</option>
				<option value="title">제목</option>
				<option value="all">작성자 + 제목</option>
			</select>
		</div>
		<div class="form-group col-sm-3">
			<input type="text" class="form-control" id="keyword" placeholder="검색어 입력"/>
		</div>
		<div class="form-group col-sm-3">
			<!-- <label for="searchDate">날짜 검색</label> -->
			<input type="text" 
				class="form-control datepicker-here"
				id="searchDate"
				placeholder="날짜 검색"
				data-range="true"
				data-multiple-dates-separator=" ~ "
				data-language="en"
				data-date-format="yyyy-mm-dd"
				/>
		</div>
		<div class="form-group col-sm-3">
			<input id="btnSearch" type="submit" value="검색" class="form-control" />
		</div>
	</form>
	
    <table class="table">
        <thead>
            <tr>
                <th width="10%">번호</th>
                <th width="30%">작성자</th>
                <th width="30%">제목</th>
                <th width="30%">생성일</th>
            </tr>
        </thead>
        <tbody id="tbodyTarget">
        </tbody>
    </table>
    
    <a id="btnWrite" class="btn btn-default" role="button">글쓰기</a>
	
	<nav aria-label="Page navigation" id="paging">
		<ul class="pagination">
		</ul>
	</nav>
	
</div>
