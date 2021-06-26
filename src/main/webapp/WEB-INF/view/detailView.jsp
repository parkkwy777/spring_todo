<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/4.5.2/css/bootstrap.css"/>
<script src="/webjars/jquery/3.3.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<title>Insert title here</title>

<style type="text/css">
        #wrap {
            margin: 0 auto 0 auto;
        }
    
        #detailBoard{
            text-align :center;
        }
        
        .title{
            height : 16;
            font-family :'돋움';
            font-size : 12;
            text-align :center;
        }
    </style>
</head>

<body>

	<form action="">
		<div class="container">
			<div id="wrap">
				<div id="board">
					<h2>게시글 조회</h2>
					<table id="detailBoard" width="100%" border="3"
						bordercolor="lightgray">
						<tr>
							<td class="title">작성일</td>
							<td><fmt:formatDate value="${detail.dday}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td class="title">작성자</td>
							<td colspan="3">${detail.writer}</td>
						</tr>
						<tr>
							<td class="title">제 목</td>
							<td colspan="3">${detail.title}</td>
						</tr>

						<tr align="center" valign="middle">
							<td colspan="5"><input type="button" value="수정"> <input
								type="button" value="삭제"> <input type="button"
								value="목록" onclick=""></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
</body>
	<script>
		$(document).ready(function() {

		});
	</script>
</html>