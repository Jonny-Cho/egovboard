<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"     uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <table id="tableTarget" class="table">
        <thead>
            <tr>
                <th>번호</th>
                <th>작성자</th>
                <th>제목</th>
            </tr>
        </thead>
    </table>
    
    <a class="btn btn-default" href="/write?page=${pageMaker.pageCriteria.page}&perPageNum=${pageMaker.pageCriteria.perPageNum}" role="button">글쓰기</a>

	<nav aria-label="Page navigation" id="paging">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li>
					<a href="/list?page=${pageMaker.startPage - 1}&perPageNum=${pageMaker.pageCriteria.perPageNum}" aria-label="Previous">
					  <span aria-hidden="true">&laquo;</span>
					</a>
				</li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li <c:out value="${pageMaker.pageCriteria.page == idx ? 'class = active' : ''}"/> >
					<a href="/list?page=${idx}&perPageNum=${pageMaker.pageCriteria.perPageNum}">${idx}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li>
					<a href="/list?page=${pageMaker.endPage + 1}&perPageNum=${pageMaker.pageCriteria.perPageNum}" aria-label="Next">
					  <span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		</ul>
	</nav>
	
</div>
