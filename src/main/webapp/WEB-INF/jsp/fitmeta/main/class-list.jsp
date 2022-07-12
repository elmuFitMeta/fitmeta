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
                        <h2>Classes Page</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Classes Page</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Single Post Start-->
        <div class="single">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="sidebar">
                            <div class="sidebar-widget wow fadeInUp">
                                <div class="search-widget">
                                    <input id="search-class" class="form-control" style="width:50%;" type="text" placeholder="検索語を入力してください" onkeypress="if(event.keyCode==13) {$('#_search').trigger('click'); return false;}">
                                    <button id="_search" style="margin-right:50%;" class="btn" onclick="searchClass()"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <div class="sidebar-widget wow fadeInUp">
                                <h2 class="widget-title">Classes</h2>
                                <div id="class-list" class="recent-post">
                                    <!--<div class="post-item">
                                        <div class="post-img">
                                            <img src="<c:url value='/images/img/img/post-1.jpg'/>" />
                                        </div>
                                        <div class="post-text">
                                            <a href="">Lorem ipsum dolor sit amet consec adipis elit Lorem ipsum dolor sit amet consec adipis elit Lorem ipsum dolor sit amet consec adipis elit</a>
                                            <div class="post-meta">
                                                <p>By<a href="">Admin</a></p>
                                                <p>In<a href="">Design</a></p>
                                            </div>
                                        </div>
                                    </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Post End-->


        <!-- Blog Start -->
        <div class="blog">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                        </ul> 
                    </div>
                </div>
            </div>
        </div>
        <!-- Blog End -->


<!-- Footer Start -->
<jsp:include page="../common/footer.jsp" />
<script src="${projectPath}/js/main/class.js?1.1"></script>
<!-- Footer End -->
