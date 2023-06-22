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
ArrayList<BoardDto> dtos = boardDao.tboardList();

if (request.getMethod().equalsIgnoreCase("post")) {
    String search = request.getParameter("search");
		
    dtos = boardDao.searchTboard(search);
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="CSS/detail.css">
    <title>IT Board</title>
</head>

<body>
    <div id="root">
        <div class="page-body">
            <div class="top-body">
                <div class="top-section">
                    <div class="left-section"><button class="top-btn" onclick="location.href='main.jsp'">IT Board</button>
                    </div>
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
                            </button></section>
                    </div>
                </div>
            </div>
            <main class="main-body">
                <div class="main-head">
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
                    <div class="search-div">
                        <form class="search-section" action="tboard.jsp" method="post">
                            <input placeholder="어떤 프로젝트를 찾으시나요?" class="search-input" name="search">
                            <button type="submit" class="top-btn">
                                <img src="image/search.svg">
                            </button>
                        </form>
                    </div>
                    <div class="row my-2 startsort">
                        <div class="d-flex flex-row justify-content-start startsort1">
                            <a href="#none" class="sort-btn">인기순</a>
                            <span class="btn-separator">·</span>
                            <a href="#none" class="sort-btn">최신순</a>
                           <div class="d-flex justify-content-end startsort2">
                            	<a class="btn text-white board-write-btn" href="write.jsp">글쓰기</a>
                        	</div>
                        </div>
                    </div>
                </div>
                <div class="main-body-gap">
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
            </main>
        </div>
    </div>
</body>
<script>
    function changeBtnColor() {
        const buttons = document.querySelectorAll(".navbar-item");
        const pathName = window.location.pathname.split('/').reverse()[0]

        buttons.forEach((btn) => {
            //*************navbar if문 조건*************//
            if (pathName == "sboard.jsp" && btn.id == 'share') {
                btn.style.backgroundColor = "rgb(235, 239, 242)";
                btn.ariaDisabled = true;
            } else if (pathName == "tboard.jsp" && btn.id == 'tip') {
                btn.style.backgroundColor = "rgb(235, 239, 242)";
                btn.ariaDisabled = true;
            } else if (pathName == "qboard.jsp" && btn.id == 'question') {
                btn.style.backgroundColor = "rgb(235, 239, 242)";
                btn.ariaDisabled = true;
            }
        })
    }

    changeBtnColor();
</script>

</html>