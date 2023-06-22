<%@page import="java.util.ArrayList"%>
<%@page import="cs.dit.MemberDao"%>
<%@page import="cs.dit.MemberDto"%>
<%@page import="cs.dit.BoardDao"%>
<%@page import="cs.dit.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8"); 

String id =(String)session.getAttribute("userId");
MemberDto memberDto = new MemberDto();
MemberDao memberDao = new MemberDao();
BoardDao boardDao = new BoardDao();

memberDto = memberDao.getOne(id);

String userId = memberDto.getId();
ArrayList<BoardDto> dtos = boardDao.searchMypage(id);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                        <p  class="helloid"><%=memberDto.getNickname()%> 님, 안녕하세요.</p>
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
            <main class="main-body">
                <div>
                    <div class="my-name-div">
                        <h1 class="my-name"><%=memberDto.getNickname()%></h1>
                            <button class="member-btn" onclick="location.href='member.jsp'">회원정보</button>
                    </div>
                </div>
                <div class="board-list1">
                    <hr>
                    <p class="p mx-3" >내 글 목록</p>
                        <div class="board-list">
                            <table class="table">
                                <colgroup>
                                    <col class="size01" data-alias="number">
                                    <col class="size02" data-alias="subject">
                                    <col class="size03" data-alias="writer">
                                    <col class="size04" data-alias="date">
                                </colgroup>
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>글쓴이</th>
                                            <th>등록일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<% int count = 1;
                                    	for(BoardDto boardDto : dtos) { %>
                                        <tr>
                                            <td class="num text-center">
                                                <span><%=count%></span>
                                            </td>
                                            <td class="tit text-center my-td-tit" onClick="location.href='page.jsp?regdate=<%=boardDto.getRegDate()%>'" style="cursor:pointer;">
                                                <span><%=boardDto.getSubject()%></span>
                                            </td>
                                            <td class="user text-center">
                                                <span><%=boardDto.getWriter()%></span>
                                            </td>
                                            <td class="date text-center"><%=boardDto.getRegDate()%></td>
                                        </tr>
                                      <% count += 1; } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </main>
                </div>
        </div>
    </div>
</body>

</html>
