<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//session scope에 "id"라는 키값으로 저장된 값을 삭제한다.
session.removeAttribute("userId");
//특정페이지로 요청을 다시 하라는 리다이렉트로 응답
String refresh = request.getContextPath();
response.sendRedirect(refresh+"/TeamProject/main.jsp");
%>