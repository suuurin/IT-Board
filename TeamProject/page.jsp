<%@page import="cs.dit.MemberDao"%>
<%@page import="cs.dit.MemberDto"%>
<%@page import="cs.dit.BoardDao"%>
<%@page import="cs.dit.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8"); 

String id =(String)session.getAttribute("userId");
String regdate = request.getParameter("regdate");

MemberDto memberDto = new MemberDto();
MemberDao memberDao = new MemberDao();
BoardDto boardDto = new BoardDto();
BoardDao boardDao = new BoardDao();

memberDto = memberDao.getOne(id);
boardDto = boardDao.getOne(regdate);
%>
<!DOCTYPE html>
<html>
<head>
  <title>게시판 본문</title>
  <link rel="stylesheet" type="text/css" href="CSS/detail.css">
  <link rel="stylesheet" href="CSS/page.css">
  <link rel="stylesheet" href="https://unpkg.com/bulma@0.9.0/css/bulma.min.css">
</head>
<body>
<div class="root">
    <div class="top-body">
        <div class="top-section">
            <div class="left-section"><button class="top-btn" onclick="location.href='main.html'">IT Board</button></div>
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
                           <%} %></button></section>
            </div>
        </div>
    </div>
  <section class="section">
    <div class="container">
      <div class="columns">
        <div class="column is-half is-offset-one-quarter">
            <div class="boarder-main">
                <div class="board-main-title"> 
                    <h1 class="title"><%=boardDto.getSubject()%></h1>
                </div>
                <div class="information">
                    <span class="username"><a href="#none"><%=boardDto.getWriter()%></a></span>
                    <span class="separator">·</span>
                    <span><%=boardDto.getRegDate() %></span>
                   <button style="float: right";>삭제</button>
                    <button onclick="location.href='pageModify.jsp'" style="float: right" ;>수정</button>
                </div>
                <hr>
                <div class="board-main-content">
                	<p class="content"><%=boardDto.getContent()%></p>
                </div>
                <hr>
            </div>
      </div>
    </div>
  </section>
</div>
</body>
</html>