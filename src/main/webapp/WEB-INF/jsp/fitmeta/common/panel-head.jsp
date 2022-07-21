<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />


<% 
	String user_id		= (String)session.getAttribute("user_id");
	String gUser_id   	= (String)session.getAttribute("gUser_id");
	String user_tp 		= (String)session.getAttribute("user_tp"); 
	String user_name 	= (String)session.getAttribute("user_name");
	String user_mail 	= (String)session.getAttribute("user_mail");
	String user_mobile 	= (String)session.getAttribute("user_mobile");
	String token_id 	= (String)session.getAttribute("token_id");
%>


<!DOCTYPE html>
<html lang="ja"> 
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Fit-Meta</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${projectPath}/css/dashboard/bootstrap.min.css">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${projectPath}/css/dashboard/font-awesome.min.css">
    <!-- meanmenu icon CSS -->
    <link rel="stylesheet" href="${projectPath}/css/dashboard/meanmenu.min.css">
    <!-- educate icon CSS -->
    <link rel="stylesheet" href="${projectPath}/css/dashboard/educate-custon-icon.css">
    <!-- metisMenu CSS -->
    <link rel="stylesheet" href="${projectPath}/css/dashboard/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="${projectPath}/css/dashboard/metisMenu/metisMenu-vertical.css">
    <!-- Full Calendar CSS -->
    <link href="${projectPath}/css/fullcalendar/main.min.css" rel="stylesheet">
    <!-- style CSS -->
    <link rel="stylesheet" href="${projectPath}/css/dashboard/style.css">
    <link href="${projectPath}/css/chatting.css" rel="stylesheet">
    <!-- responsive CSS -->
    <link rel="stylesheet" href="${projectPath}/css/dashboard/responsive.css">
    <script type="text/javascript">
        <% if(user_id != null) { %>
            window.SESSION_USER_INFO = {
                user_id: 		'<%=user_id%>',
                gUser_id: 		'<%=gUser_id%>',
                user_tp: 		'<%=user_tp%>',
                user_name: 		'<%=user_name%>',
                user_mail: 		'<%=user_mail%>',
                user_mobile: 	'<%=user_mobile%>',
                token_id: 		'<%=token_id%>'
            };
        <% } %>
    </script>
</head>