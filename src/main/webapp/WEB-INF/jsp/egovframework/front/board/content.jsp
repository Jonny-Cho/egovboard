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

    <a class="btn btn-default" href="/write" role="button">새 글쓰기</a>
    <a class="btn btn-default" href="/update/${bid}" role="button">수정/삭제하기</a>
    <a class="btn btn-default" href="/list" role="button">게시판 목록</a>
</div>