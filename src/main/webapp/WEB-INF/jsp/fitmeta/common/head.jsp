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
        <title>FitMeta</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Website Template" name="keywords">
        <meta content="Website Template" name="description">


        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="${projectPath}/css/lib/animate/animate.min.css" rel="stylesheet">
        <link href="${projectPath}/css/lib/flaticon/font/flaticon.css" rel="stylesheet"> 
        <link href="${projectPath}/css/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="${projectPath}/css/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="${projectPath}/css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        
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
    
    
    