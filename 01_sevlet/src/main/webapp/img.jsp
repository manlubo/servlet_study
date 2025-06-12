<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream" %>
<%@ page language="java" contentType="image/jpeg;" pageEncoding="UTF-8" %>

<%
	String src = "D:\\sae.jpg";
	File file = new File(src);
	FileInputStream fis = new FileInputStream(file);
	byte[] bytes = fis.readAllBytes();
	
	OutputStream os = response.getOutputStream();
	os.write(bytes);
	
	fis.close();
%>