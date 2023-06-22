<%@page import="cs.dit.MemberDao"%>
<%@page import="cs.dit.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");

MemberDto dto = new MemberDto(id);
new MemberDao().deleteMember(id);
%>

<script>
	alert("회원탈퇴가 완료되었습니다.");
	location.href  = "logout.jsp";
</script>