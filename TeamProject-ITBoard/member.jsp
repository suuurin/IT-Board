<%@page import="cs.dit.MemberDao"%>
<%@page import="cs.dit.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");

String id =(String)session.getAttribute("userId");
MemberDto dto = new MemberDto();
MemberDao dao = new MemberDao();

dto = dao.getOne(id);

String userId = dto.getId();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="CSS/signUp.css">
    <link rel="stylesheet" type="text/css" href="CSS/detail.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>IT Board</title>
</head>

<body>
	<c:if test="${empty userId}">
	    <script type="text/javascript">
				alert("로그인 후 이용하실 수 있습니다.");
				location.href  = "login.jsp";
			</script>
	</c:if>
    <div id="root">
        <div class="page-body">
            <div class="top-body">
                <div class="top-section">
                    <div class="left-section">
                        <button class="top-btn" onclick="location.href='main.jsp'">IT Board</button>
                    </div>
                    <div class="right-section">
                        <p class="helloid"><%=dto.getNickname()%> 님, 안녕하세요.</p>
                        <div class="user-profile">
                            <section class="infoSection">
                                <div class="userInfo">
                                    <a href="mypage.jsp">
                                        <img src="image/profile.svg">
                                    </a>
                                </div>
                            </section>
                        </div>
                        <section class="login-section">
                            <button class="login-btn" onclick="location.href='logout.jsp'">
                                <p size="16" color="#FFFFFF" class="login-btn-text">LOG OUT</p>
                            </button>
                        </section>
                    </div>
                </div>
            </div>
            <main class="main-body2">
                <h1 class="signup-title">회원정보 수정</h1>
    
                <form class="signup-form" action="memberPro.jsp" method="post">
    
                    <label for="id">아이디</label>
                    <input type="text" id="id" name="id" value="<%=dto.getId()%>" readonly>
    
                    <label for="pwd">비밀번호</label>
                    <input type="password" id="pwd" name="pwd" value="<%=dto.getPwd()%>">
    
                    <label for="nickname">닉네임</label>
                    <input type="text" id="nickname" name="nickname" value="<%=dto.getNickname()%>">
    
                    <label for="username">이름</label>
                    <input type="text" id="name" name="name" value="<%=dto.getName()%>">
    
                    <label for="phone">전화번호</label>
                    <input type="tel" id="phone" name="phone" value="<%=dto.getPhone()%>">
    
                    <label for="email">이메일</label>
                    <input type="email" id="email" name="email" value="<%=dto.getEmail()%>">
    
                    <input type="submit" class="modify" value="수정">
                    <hr>
                    <input type="button" class="withdrawal-btn" value="회원 탈퇴" onclick="location.href='deleteMemberPro.jsp?id=<%=id%>'">
                </form>
            </main>
        </div>
    </div>
</body>

</html>