<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />



<!-- Top Bar Start -->
<div class="top-bar d-none d-md-block">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8">
                <div class="top-bar-left">
                    <div class="text">
                        <i class="far fa-clock"></i>
                        <h2>8:00 - 9:00</h2>
                        <p>Mon - Fri</p>
                    </div>
                    <div class="text">
                        <i class="fa fa-phone-alt"></i>
                        <h2>+123 456 7890</h2>
                        <p>For Appointment</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="top-bar-right">
                    <div class="social">
                        <a href=""><i class="fab fa-twitter"></i></a>
                        <a href=""><i class="fab fa-facebook-f"></i></a>
                        <a href=""><i class="fab fa-linkedin-in"></i></a>
                        <a href=""><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Top Bar End -->



        <!-- Nav Bar Start -->
<div class="navbar navbar-expand-lg bg-dark navbar-dark">
    <div class="container-fluid">
        <a href="/fit-meta/index.do" class="navbar-brand">f<span>it</span>meta</a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
            <div class="navbar-nav ml-auto">
                <a href="index.do" id="_home" class="nav-item nav-link">ホーム</a>
                <a href="about.do" id="_myPage" class="nav-item nav-link">マイページ</a>
                <a href="service.do" id="_service" class="nav-item nav-link">サービス</a>
                <a href="price.do" id="_price" class="nav-item nav-link">プライス</a>
                <a href="class.do" id="_class" class="nav-item nav-link">クラス</a>
                <a href="contents.do" id="_contents" class="nav-item nav-link">コンテンツ</a>
                <a href="news.do" id="_news" class="nav-item nav-link">ニュース</a>
                <a href="register.do" id="_register" class="nav-item nav-link">Register</a>
              	<a class="nav-item nav-link" href="/fit-meta/main/user-chatting.do">
                    <i class="fa fa-envelope-o">
                        <span id="_msg-cnt" class="badge badge-danger"></span>
                    </i>
               	</a>
            </div>
        </div>
    </div>
</div>
<!-- Nav Bar End -->




