<%@page import="cs.dit.MemberDao"%>
<%@page import="cs.dit.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8"); 

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String nickname = request.getParameter("nickname");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String email = request.getParameter("email");

MemberDto dto = new MemberDto(id, pwd, nickname, name, phone, email);
MemberDao dao = new MemberDao();

dao.insertMember(dto);
%>
<script>
	alert("회원가입이 정상적으로 처리되었습니다.");
	location.href  ="login.jsp";
</script>