<%@ 
	page language="java" 
	contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"
%>

<% 
	String user_id		= (String)session.getAttribute("user_id");
	String gUser_id   	= (String)session.getAttribute("gUser_id");
	String user_tp 		= (String)session.getAttribute("user_tp"); 
	String user_name 	= (String)session.getAttribute("user_name");
	String user_mail 	= (String)session.getAttribute("user_mail");
	String user_mobile 	= (String)session.getAttribute("user_mobile");
	String token_id 	= (String)session.getAttribute("token_id");
%>

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

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />
<c:set var="cssFile" value="${projectPath}/css/${param.prefixCssName}.css?8" />

<!DOCTYPE html>
<html lang="ja"> 
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>FitMeta</title>

		<link rel="stylesheet" type="text/css" href="${projectPath}/css/common.css?4"/>
		<link rel="stylesheet" type="text/css" href="${cssFile}" />

		<script type="text/javascript">
			var contextPath = '${projectPath}';
		</script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="${projectPath}/js/common.js?1"></script>
		<script src="${projectPath}/js/slick.min.js"></script>
		<script src="${projectPath}/js/fitMetaDAO.js?1.1"></script>
		<script src="${projectPath}/js/dev.mrgelo.js?1.1"></script>
		<script src="${projectPath}/js/dev.mrgelo.temp.js?1.1"></script>
		<script type="text/javascript">

		</script>

	</head>
