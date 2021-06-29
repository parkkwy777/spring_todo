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
<link rel="stylesheet" href="/static/css/login.css"/>
<script src="/webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="/static/img/manager_logo.png" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form id="loginFrm" method="post" action="/todo/view">
         
      <input type="text" id="login" class="fadeIn second" name="id" placeholder="id">
      <input type="password" id="password" class="fadeIn third" name="pwd" placeholder="password">
      <input type="submit" id="loginBtn" class="fadeIn fourth" value="Log In">
    	  <p>Your login attempt was not successful due to <br/>
            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
    
    </form>
<%-- 	<h1>
	아이디: ${use}
	비밀번호:${loginMember.pwd}
	</h1> --%>
    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="/member/join">가입하기</a>
    </div>

  </div>
</div>
</body>

<script type="text/javascript">

	$(document).ready(function(){
		$("#loginBtn").click(function(){
			if( $("[name=id]").val()==null || $("[name=id]").val()=="" ){
				alert("아이디를 입력하세요");
				$("[name=id]").focus();
	
				return false;
			}
			if( $("[name=pwd]").val()==null || $("[name=pwd]").val()=="" ){
				alert("패스워드를 입력하세요!!");				
				$("[name=pwd]").focus();	
				return false;
			}
			
			$("#loginFrm").submit();
		});
	});
</script>
</html>
