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
new MemberDao().updateMember(dto);
%>

<script type="text/javascript">
	alert("회원정보가 수정되었습니다.");
	location.href="main.jsp";
</script>