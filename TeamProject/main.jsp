<%@page import="java.util.ArrayList"%>
<%@page import="cs.dit.MemberDao"%>
<%@page import="cs.dit.MemberDto"%>
<%@page import="cs.dit.BoardDao"%>
<%@page import="cs.dit.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8"); 

String id =(String)session.getAttribute("userId");
MemberDto memberDto = new MemberDto();
MemberDao memberDao = new MemberDao();
BoardDao boardDao = new BoardDao();

memberDto = memberDao.getOne(id);
ArrayList<BoardDto> dtos = boardDao.mainList();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IT Board</title>
    <link rel="stylesheet" type="text/css" href="CSS/detail.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>

<body>
    <div id="root">
        <div class="page-body">
            <div class="top-body">
                <div class="top-section">
                    <div class="left-section"><button class="top-btn" onclick="location.href='main.jsp'">IT Board</button></div>
                    <div class="right-section">
                    	<%if(id!=null){%>
	                    	<p  class="helloid"><a href="member.jsp"><%=memberDto.getNickname()%> 님, 안녕하세요.</a></p>
	                    	<div class="user-profile">
	                            <section class="infoSection">
	                                <div class="userInfo">
	                                    <a href="mypage.jsp">
	                                    <img src="image/profile.svg">
	                                    </a>
	                                </div>
	                            </section>
	                        </div>
											<%}else{ %>
											<%} %>
                        <section class="login-section">
                        	<%if(id==null){%>
	                        	<button class="login-btn" onclick="location.href='login.jsp'">
	                          <p size="16" color="#FFFFFF" class="login-btn-text">LOG IN</p>
													<%}else{ %>	
	                        	<button class="login-btn" onclick="location.href='logout.jsp'">
	                          <p size="16" color="#FFFFFF" class="login-btn-text">LOG OUT</p>
													<%} %>
                          	</button>
                          </section>
                    </div>
                </div>
            </div>
            <main class="main-body">
                <div class="main-body-gap">
                    <!-- style.css 사용 -->
                    <div class="navibar d-flex flex-row justify-content-around">
                        <a href="sboard.jsp" class="navbar-item" id="share">
                            <span>공유 게시판</span>
                        </a>
                        <a href="tboard.jsp" class="navbar-item" id="tip">
                            <span>팁 게시판</span>
                        </a>
                        <a href="qboard.jsp" class="navbar-item" id="question">
                            <span>질문 게시판</span>
                        </a>
                    </div>
                    <div class="banner">
                        <div class="bannerText">
                            <p size="32" color="#212121" class="banner-title">프로젝트 공유 웹페이지</p>
                            <p size="22" color="#212121" class="banner-subtitle">자랑하고 싶은 나의 프로젝트를 올리고 다른 사람과 공유해요!</p>
                        </div>
                        <button class="uploadButton" onclick="location.href='write.jsp'">
                            <p size="18" color="#FFFFFF" class="upload-btn-txt">올리러 가기</p>
                        </button>
                    </div>
                <div class="main-recommend-section">
                    <div class="recommend-title">
                        <p class="recommend-text"><b>최근 게시물</b></p>
                    </div>
                    <div class="cardList">
                        <% for(BoardDto boardDto : dtos) { %>
                        <div class="cardList-item">
                            <a href="page.jsp?regdate=<%=boardDto.getRegDate()%>">
                                <img class="thumbnail" src="#none">
                                <div class="contentsContainer">
                                    <div class="titleBox">
                                        <p size="22" color="#212121" class="card-title-txt"><%=boardDto.getSubject()%></p>
                                    </div>
                                    <section class="infoSection">
                                        <div class="userInfo">
                                            <img src="image/profile.svg">
                                            <p size="16" color="#4D4D4D" class="info-txt"><%=boardDto.getWriter()%></p>
                                        </div>
                                    </section>
                                </div>
                            </a>
                        </div>
                        <% } %>
                    </div>
                </div>
                    <div class="footer">
                        <p class="team">기력이 다한 개발자</p>
                    </div>
                </div>
        </div>
    </div>
    </main>
    </div>
    </div>
</body>

</html>