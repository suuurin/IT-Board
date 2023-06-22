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
    <div id="root">
        <div class="page-body">
            <div class="top-body">
                <div class="top-section">
                    <div class="left-section">
                        <button class="top-btn" onclick="location.href='main.jsp'">IT Board</button>
                    </div>
                    <div class="right-section">
                        <p  class="helloid"><a href="member.jsp"><%=dto.getNickname()%> 님, 안녕하세요.</a></p>
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
                    <form class="write-form">
                        <div class="select-setting">
                            <div>
                                <div class="category-container">
                                </div>
                            </div>
                        </div>
                        <label class="write-title">
                        <input placeholder="제목을 써주세요" class="w-tit-input" name="subject">
                    </label>
                    <div class="write-content">
                        <textarea id="post-content" class="form-control w-content-textarea" placeholder="내용을 작성해주세요"
                            name="content" maxlength="1024" style="height:310px;"></textarea>
                    </div>
                    <div class="file-insert">
                        <input type="file" multiple>
                        <div class="file-list"></div>
                    </div>
                    <div class="write-foot">
                        <div class="write-select">
                            <input type="button" class="cancel-btn" onclick="location.href='main.jsp'" value="취소하기">
                            <button type="submit" class="post-btn">올리기</button>
                        </div>
                    </div>
                </form>
                </main>
            </div>
        </div>
    </div>
</body>

</html>