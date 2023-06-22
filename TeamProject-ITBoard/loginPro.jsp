<%@page import="java.io.PrintWriter"%>
<%@page import="cs.dit.MemberDto"%>
<%@page import="cs.dit.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8"); 

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

MemberDto dto = new MemberDto(id, pwd);
MemberDao dao = new MemberDao();

int result = dao.loginMember(dto);
if(result == 1){
	PrintWriter script = response.getWriter();
	session.setAttribute("userId",id);
	script.println("<script>");
	script.println("alert('로그인에 성공했습니다.')");
	script.println("location.href = 'main.jsp'");
	script.println("</script>");
}else if(result == 0){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 틀립니다.')");
	script.println("history.back()");//이전페이지로 돌려보냄
	script.println("</script>");
}else if(result == -1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('존재하지 않는 아이디 입니다.')");
	script.println("history.back()");//이전페이지로 돌려보냄
	script.println("</script>");
}else if(result == -2){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('데이터베이스 에러가 발생했습니다.')");
	script.println("history.back()");//이전페이지로 돌려보냄
	script.println("</script>");
}		
%>