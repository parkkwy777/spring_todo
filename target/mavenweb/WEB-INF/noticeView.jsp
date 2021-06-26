<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/4.5.2/css/bootstrap.css"/>
<script src="/webjars/jquery/3.3.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<title>Insert title here</title>
</head>
<body>
<div class="container" style="border solid;">
	<h1>게시판</h1>
	<form id="noticeFrm" method="get" action="">
		<table class="table table-bordered table-hover text-center">
			<colgroup>
				<col width='10%' />
				<col width='60%' />
				<col width='10%' />
				<col width='10%' />
			</colgroup>
			<thead>
				<tr>
					<th scope='col' class='noline'>번호</th>
					<th scope='col'>제목</th>
					<th scope='col'>등록자</th>
					<th scope='col'>등록일</th>
				</tr>
				<c:if test="${lists ne null}">
				<c:forEach var="list" items="${lists}">
					<tr>
						<td>${list.no}</td>
						<td>${list.title}</td>
						<td>${list.writer}</td>
						<td>${list.dday}</td>
					</tr>
				</c:forEach>
				</c:if>
				</thead>
		</table>
		</form>
		<!-- 페이징 처리 -->
		<form id="pagingFrm" method="get" action="/notice">
			<input type="hidden" name="curPage" value="">
			<c:if test="${paging ne null}">
				<ul class="pagination justify-content-center" style="margin:0 auto;">
				<li class="page-item"><a class="page-link" href="/notice?curPage=1">처음으로</a></li>
					<li class="page-item"><a class="page-link" href="/notice?curPage=${paging.statBlock eq 1 ? 1: paging.statBlock-paging.blockSize}">이전</a></li>
					<c:forEach var="cnt" begin="${paging.statBlock}" end="${paging.endBlock}">
						<li class="page-item ${paging.curPage==cnt ? 'active': ''}"><a class="page-link check" href="/notice?curPage=${cnt}">${cnt}</a></li>
					</c:forEach>
					<c:if test="${paging.curPage!=paging.totalBlock }"><li class="page-item"><a class="page-link" href="/notice?curPage=${(paging.block*paging.blockSize)+1 > paging.totalBlock ? paging.totalBlock : (paging.block*paging.blockSize)+1}">다음</a></li></c:if>
					<c:if test="${paging.curPage!=paging.totalBlock }"><li class="page-item"><a class="page-link" href="/notice?curPage=${paging.totalBlock}">끝</a></li></c:if>
				</ul>
			</c:if>
		</form>
</div>
</body>
	<script>
		$(document).ready(function(){
			
			
		});
	</script>
</html>
