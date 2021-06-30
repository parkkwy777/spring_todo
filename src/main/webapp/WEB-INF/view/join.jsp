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
<!-- font awesome -->
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<title>todo 회원가입</title>
<body>
        <article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <h3>회원가입</h3>
                </div>
            </div>
            <div class="col-sm-6 col-md-offset-3">
                <form role="form" method="post" id="frmJoin">
                	<div class="form-group">
                        <label for="inputId">아이디</label>
                        <input type="text" class="form-control"  maxlength="20"	name="id" id="inputId" placeholder="이름을 입력해 주세요">
                    </div>
                   <div class="form-group">
                        <label for="inputPassword">비밀번호</label>
                        <input type="password" class="form-control" maxlength="20" name ="pwd" id="inputPassword" placeholder="비밀번호를 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputPasswordCheck">비밀번호 확인</label>
                        <input type="password" class="form-control" maxlength="20" id="inputPasswordCheck" placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
                    </div>
                
                    <div class="form-group">
                        <label for="inputName">성명</label>
                        <input type="text" class="form-control" maxlength="20"  name="name" id="inputName" placeholder="이름을 입력해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="InputEmail">이메일 주소</label>
                        <input type="email" class="form-control" maxlength="50" name="email" id="InputEmail" placeholder="이메일 주소를 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputMobile">휴대폰 번호</label>
                        <input type="tel" class="form-control" name="phone" id="inputMobile" placeholder="휴대폰번호를 입력해 주세요 (-제외)">
                    </div>

                    <div class="form-group">
                    <label>약관 동의</label>
                    <div data-toggle="buttons">
                    <label class="btn btn-primary active">
                    <span class="fa fa-check"></span>
                    <input id="agree" type="checkbox" autocomplete="off" checked>
                    </label>
                    <a href="#">이용약관</a>에 동의합니다.
                    </div>
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" id="submitBtn" class="btn btn-primary">
                            회원가입<i class="fa fa-check spaceLeft"></i>
                        </button>
                        <button type="submit" class="btn btn-warning">
                            가입취소<i class="fa fa-times spaceLeft"></i>
                        </button>
                    </div>
                    
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                </form>
            </div>

        </article>
    </body>
<script type="text/javascript">

	$(document).ready(function(){
		var joinRs ="${joinRs}";
		var joinRsInt = parseInt(joinRs);
		
		console.log(joinRsInt);
		
		if(joinRs=="0" && joinRsInt==0){
			alert("가입 실패");
		}else if(joinRs!="0"&& joinRsInt>0){
			alert("가입되었습니다");
			$(location).attr("href","/member/login");
		}
		
		
		$(document).on("click","#submitBtn",function(){
		
			
			
			
		});
		
		
		$("[name=phone]").on("keyup", function() {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
		 });
		
		
	});
</script>
</html>