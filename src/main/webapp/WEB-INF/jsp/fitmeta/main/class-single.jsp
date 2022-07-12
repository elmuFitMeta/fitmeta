<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<%@ include file="../common/head.jsp" %>

    <body>
        <!-- Bar Start -->
		<jsp:include page="../common/menu.jsp" />
        <!-- Bar End -->


        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Class Detail Page</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Detail Page</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

        <!-- Single Post Start-->
        <div class="single">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="single-content wow fadeInUp">
                            <img id="class-img" src="" />
                            <div id="video-link"></div>
                            <div id="review" style="display: flex;"></div>
                            <h2 id="class-nm"></h2>
                            <p id="class-intro"></p>
                        </div>
                        <div class="single-bio wow fadeInUp">
                            <div class="single-bio-img">
                                <img id="pt-img" src="" />
                            </div>
                            <div class="single-bio-text">
                                <h2>ヘルスケアトレーナー</h2>
                                <h3 id="pt-nm"></h3>
                                <p id="pt-intro"></p>
                            </div>
                        </div>
                        <div class="comment-form wow fadeInUp">
                            <h2>Question Box</h2>
                            <div class="form-group">
                                <label for="name">Name *</label>
                                <input type="text" class="form-control" id="nm" disabled>
                            </div>
                            <div class="form-group">
                                <label for="email">Email *</label>
                                <input type="email" class="form-control" id="email" disabled>
                            </div>
                            <div class="form-group">
                                <label for="website">Question 1</label>
                                <input id="q1" type="text" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="message">Question 2</label>
                                <textarea id="q2" class="form-control"></textarea>
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn" onclick="applyForClass()">申し込む</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Post End-->   


<!-- Footer Start -->
<jsp:include page="../common/footer.jsp" />
<script src="${projectPath}/js/main/class-single.js?1.1"></script>
<!-- Footer End -->
