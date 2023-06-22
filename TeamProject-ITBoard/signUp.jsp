<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String userId =(String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/signUp.css">
    <link rel="stylesheet" href="CSS/detail.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<title>IT Board</title>
</head>
<body>
	<c:if test="${not empty userId}">
	    <script type="text/javascript">
				alert("이미 로그인 된 상태입니다.");
				history.back();
			</script>
	</c:if>
  <div id="root">
    <div class="page-body">
        <div class="top-body">
            <div class="top-section">
                <div class="left-section"><button class="top-btn" onclick="location.href='main.jsp'">IT Board</button></div>
                <div class="right-section">
                    <section class="login-section"><button class="login-btn" onclick="location.href='login.jsp'">
                            <p size="16" color="#FFFFFF" class="login-btn-text">LOG IN</p>
                        </button></section>
                </div>
            </div>
        </div>
        <main class="main-body">
          <h1 class="signup-title">회원가입</h1>
          <p>자랑하고 싶은 <b>프로젝트를 올려볼까요?</b></p>
          <form class="signup-form" action="signUpPro.jsp" method="post">
            <label for="id">아이디</label>
            <input type="text" name="id"  id="id" required>

            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" required>

            <label for="nickname">닉네임</label>
            <input type="text" id="nickname" name="nickname" required>

            <label for="username">이름</label>
            <input type="text" id="name" name="name" required>

            <label for="phone">전화번호</label>
            <input type="tel" id="phone" name="phone" placeholder="123-4567-8910" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>

            <label for="email">이메일</label>
            <input type="email" id="email" name="email" required>

            <input type="submit" class="sign" value="SIGN UP">
          </form>
        </main>
    </div>
  </div>
</body>
</html>