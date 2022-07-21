<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../common/panel-head.jsp" />
<body>
    <jsp:include page="../common/panel-menu.jsp" />
    
    <div class="wr">
        <div class="wrapper">
            <section class="chat-area">
                <header>
                    <a href="/fit-meta/main/user-chatting.do" class="back-icon"><i class="fa fa-arrow-left"></i></a>
                    <img src="/fit-meta/images/img/profile.png" alt="">
                    <div class="details">
                        <span id="nm"></span>
                    </div>
                </header>
                <div class="chat-box">
                </div>
                <form action="#" class="typing-area">
                    <input type="text" id="msg" name="message" class="input-field" placeholder="Type a message here..." autocomplete="off">
                    <button><i class="fa fa-paper-plane"></i></button>
                </form>
            </section>
        </div>
    </div>
    <jsp:include page="../common/panel-foot.jsp" />
</body>
</html>