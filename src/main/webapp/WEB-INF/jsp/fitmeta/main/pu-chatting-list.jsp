<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../common/panel-head.jsp" />

<body>

    <jsp:include page="../common/panel-menu.jsp" />
       
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
                    <button><i class="fa fa-search"></i></button>
                </div>
                <div class="users-list">
                    <a href="/fit-meta/main/chatting.do?user_id=">
                        <div class="content">
                            <img src="/fit-meta/images/img/profile.png" alt="">
                            <div class="details">
                                <span>Tadjibaev Elmurod</span>
                                <div class="status-dot"><i class="fa fa-circle"></i></div>
                            </div>
                        </div>
                        <div class="status-dot"><span style="font-size: 22px;">2</span></div>
                    </a>
                </div>
            </section>
        </div> 
    </div>
     
    <jsp:include page="../common/panel-foot.jsp" />
</body>
</html>