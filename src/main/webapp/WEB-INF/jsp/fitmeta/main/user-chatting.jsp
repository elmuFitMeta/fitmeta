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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Fit-Meta</title>
    <link href="${projectPath}/css/chatting.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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

<body>

  <!-- Bar Start -->
  <% if(user_tp.equals("2")) { %>
  	<jsp:include page="../common/pt-menu.jsp" />
  <% } else { %>
    <jsp:include page="../common/user-menu.jsp" />
  <% } %>
  <!-- Bar End -->



  <div class="wr">
    <div class="wrapper">
      <section class="users">
        <header>
          <div class="content">
            <img src="/fit-meta/images/img/profile.png" alt="">
            <div class="details">
              <span id="nm"></span>
            </div>
          </div>
        </header>
        <div class="search">
          <span class="text">Select an user to start chat</span>
          <input type="text" placeholder="Enter name to search...">
          <button><i class="fas fa-search"></i></button>
        </div>
        <div class="users-list">

        </div>
      </section>
    </div> 
  </div>

  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
  <script src="${projectPath}/js/common.js?1.1"></script>
  <script src="${projectPath}/js/fitMetaDAO.js?1.1"></script>
  <script src="${projectPath}/js/dev.mrgelo.js?1.1"></script>
  <script src="${projectPath}/js/dev.mrgelo.temp.js?1.1"></script>
  <script src="${projectPath}/js/main/user-chatting.js?1.1"></script>
</body>
</html>