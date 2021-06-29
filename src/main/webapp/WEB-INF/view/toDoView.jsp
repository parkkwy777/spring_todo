<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/4.5.2/css/bootstrap.css" />
<script src="/webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>todoList</title>

</head>
<body>


	<div class="container">
		<!--<div class="input-group mb-3" style="border: solid;">
			 <input type="text" class="form-control" placeholder="Search">
		<div class="input-group-append">
			<button class="btn btn-success" type="submit">Go</button>
		</div>
		</div>
		 -->
		 
		 	<h1>toDo 🥰<button style="float:right;" type="button" id="logoutBtn" class="btn btn-danger">로그아웃</button></h1>
			
			<form id="noticeFrm" method="get" action="">
				<table class="table table-bordered table-hover text-center">
					<colgroup>
						<col width='10%' />
						<col width='20%' />
						<col width='10%' />
						<col width='10%' />
						<col width='10%' />
						<col width='20%' />
						<col width='12.5%' />
						<col width='7.5%' />
					</colgroup>
					<thead>
						<tr>
							<th scope='col' class='noline'>번호</th>
							<th scope='col'>제목</th>
							<th scope='col'>작성자</th>
							<th scope='col'>날짜</th>
							<th scope='col'>분류</th>
							<th scope='col'>장소</th>
							<th scope='col'>내용</th>
							<th scope='col'>실행여부</th>
							<th scope='col'>삭제</th>
						</tr>
						<c:forEach var="list" items="${lists}" varStatus="i">
						<input type="hidden" class="idx" value="${list.idx}"> 
						<tr>
							
							<td>${paging.totalCnt-((paging.curPage-1)*paging.pageSize)-i.index}</td>
							<td onclick="detailGo(${list.idx});">${list.title}</td>
							<td>${list.writer}</td>
							<td><fmt:formatDate value="${list.dday}" pattern="yyyy-MM-dd"/></td>
							<td><span class="nameLog" >${list.name}</span></td>
							<td><span class="placeLog" style="cursor:pointer;" >${list.place}</span></td>
							<td>${list.content}</td>
							<td><span class="state" style="cursor:pointer;">${list.state == 1 ? 'O' : 'X'}</span></td>
							<td><span class="delete" style="color:red; cursor:pointer;">X</span></td>
						</tr>
						</c:forEach>
						<c:if test="${empty lists}">
							<tr><td colspan="9">데이터가 없습니다.</td></tr>
						</c:if>
					</thead>
				</table>
			</form>
			<!-- 페이징 처리 -->
			<form id="pagingFrm" method="get" action="/todo/view">
				<input type="hidden" name="curPage" value="">
				<c:if test="${paging ne null}">
					<ul class="pagination justify-content-center" style="margin:0 auto;">
					<li class="page-item"><a class="page-link" href="/todo/view?curPage=1">처음으로</a></li>
						<li class="page-item"><a class="page-link" href="/todo/view?curPage=${paging.statBlock eq 1 ? 1: paging.statBlock-paging.blockSize}">이전</a></li>
						<c:forEach var="cnt" begin="${paging.statBlock}" end="${paging.endBlock}">
							<li class="page-item ${paging.curPage==cnt ? 'active': ''}"><a class="page-link check" href="/todo/view?curPage=${cnt}">${cnt}</a></li>
						</c:forEach>
						<c:if test="${paging.curPage!=paging.totalBlock }"><li class="page-item"><a class="page-link" href="/todo/view?curPage=${(paging.block*paging.blockSize)+1 > paging.totalBlock ? paging.totalBlock : (paging.block*paging.blockSize)+1}">다음</a></li></c:if>
						<li class="page-item"><a class="page-link" href="/todo/view?curPage=${paging.totalBlock}">끝</a></li>
					</ul>
				</c:if>
			</form>
			<p>
				<h5>해당 장소에서 완수한 todo counting..(장소 클릭)</h5>
					<span id="logText"></span>
				
			</p>
		<br>
		<h1>---------------------------------------------------------------------</h1>	
		<br> 
		 <form id="inputFrm" method="post" action="">
			<input type="hidden" name="proc" value="insert">
			<div class="input-group mb-3">
			<h1>input</h1>
				<div style="width:100%;">
				제목:<input type="text" name="title" style="width: 50%;" class="form-control"/>
				작성자:<input type="text" name="writer" style="width:50%;" class="form-control"/>
				</div>
				<div style="width:100%; display: inline-block;">
					분류:<br> <select id="part" name="name" style="width: 50%; height: 38px;">
								<c:forEach var="name" items="${partName}">
									<option value="${name.name}">${name.name}</option>
								</c:forEach>
							</select><br>
					장소:<br><select id="place" name="pCode" style="width: 50%; height:38px;">
							</select>
	
				</div>
				<div style="width:100%;">
				내용:<br>
					<div class="input-group-append">
						<input type="text" name="content" style="width: 80%;" class="form-control"/>
						<button class="btn btn-primary" id="inputBtn" type="button">OK</button>
						<button class="btn btn-danger" type="button">Cancel</button>
					</div>
				
				</div>
			</div>
			</form>

	</div>
</body>

<script type="text/javascript">

	$(document).ready(function(){
		var placeLogParam = "${param.placeLog}";
		var error ="${param.error}";
		
		if(!placeLogParam== ""){
			logTxt(placeLogParam);
		}
		
		place(); // 분류에 따른 장소	
		
		$("#part").change(function(){
			$("#place").empty();
			place();
		});
		
		
		var proc="${param.proc}";
		
		var insRs ='${insRs}';	//insert 결과

		if(proc=="insert" && insRs==0){
			alert("input 실패");
		}else if(proc=="insert" && insRs>0){
			$(location).attr("href","/todo/view");
		}
		
		$(document).on("click",".state",function(){
			var i = $(".state").index(this);
			var idx= $(".idx").eq(i).val();
			var state = $(".state").eq(i).text();
			var placeLog = $(".placeLog").eq(i).text();
			
			if(state=="X"){
				state=1;
			}else{
				state=0;
			}
			
			$.ajax({
				type:"post",
				url:"/ajax/state",
				data:{idx:idx, state:state},
				dataType:"json",
				success:function(data){
					if(data==true){
						$(location).attr("href","/todo/view?placeLog="+placeLog);
					}else{
						alert("실패");
					}
				}
			});
		}); 
		
		$(document).on("click",".delete",function(){
			var i = $(".delete").index(this);
			var idx= $(".idx").eq(i).val();
			
			if(!confirm("삭제하시겠습니까?")){
				return false;
			}
			$.ajax({
				type:"post",
				url:"/ajax/delete",
				data:{idx:idx},
				success:function(data){
					if(data==true){
						$(location).attr("href","/todo/view");
					}else{
						alert("실패");
					}
				}
			});
		}); 
		
		
		$(document).on("click",".placeLog",function(){
			var i = $(".placeLog").index(this);
			var placeLog = $(".placeLog").eq(i).text();
			logTxt(placeLog);
		});
		 
		
		$("#inputBtn").click(function(){
			$("#inputFrm").attr("action","/todo/insert");
			$("#inputFrm").submit();
		});
		
		$("#logoutBtn").click(function(){
				$(location).attr("href","/logout")
		});
		
	});

	
function place(){
	
	var name= $("#part").val()==null?0:$("#part").val();    

	$.ajax({
		type:"post",
		url:"/ajax/place",
		data:{name:name},
		success:function(data){
			for(var i in data.place){	
				$("#place").append("<option value="+data.place[i].pCode+">"+data.place[i].place+"</option>");
			}
		}
	});
}

function logTxt(placeLog){
	
	
	$.ajax({
		type:"post",
		url:"/ajax/log",
		data:{proc:"log",place:placeLog},
		success:function(data){
			console.log(data);
			$("#logText").empty();
			$("#logText").append("장소 : "+data.log.place+" / 실행횟수 : "+data.log.count);
		}
	});
}
</script>
</html>