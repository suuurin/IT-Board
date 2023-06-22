<%@page import="cs.dit.BoardDto"%>
<%@page import="cs.dit.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");

    String regdate = request.getParameter("regdate");
    BoardDao dao = new BoardDao();
    BoardDto dto = dao.getOne(regdate);
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
                <!-- Header code -->
            </div>
            <main class="main-body">
                <form class="write-form" action="boardPro.jsp" method="post">
                    <input type="hidden" name="regdate" value="<%= dto.getRegDate() %>">
                    <div class="select-setting">
                        <!-- Category selection code -->
                    </div>
                    <label class="write-title">
                        <span class="sr-only">Title</span>
                        <c:choose>
                            <c:when test="${empty param.title && not empty dto}">
                                <input type="text" class="form-control" name="title" value="${dto.subject}">
                            </c:when>
                            <c:otherwise>
                                <input type="text" class="form-control" name="title" placeholder="Title">
                            </c:otherwise>
                        </c:choose>
                    </label>
                    <label class="write-text">
                        <span class="sr-only">Content</span>
                        <c:choose>
                            <c:when test="${empty param.text && not empty dto}">
                                <textarea class="form-control" name="text" rows="10"><%= dto.getContent() %></textarea>
                            </c:when>
                            <c:otherwise>
                                <textarea class="form-control" name="text" rows="10"
                                    placeholder="Please write here..."></textarea>
                            </c:otherwise>
                        </c:choose>
                    </label>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </main>
        </div>
    </div>
</body>

</html>