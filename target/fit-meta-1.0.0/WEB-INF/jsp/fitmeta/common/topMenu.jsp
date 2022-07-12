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
                <a href="/fit-meta/index.do" class="nav-item nav-link active">Home</a>
                <a href="about.do" class="nav-item nav-link">About</a>
                <a href="service.do" class="nav-item nav-link">Service</a>
                <a href="team.do" class="nav-item nav-link">Trainers</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">News</a>
                    <div class="dropdown-menu">
                        <a href="news.do" class="dropdown-item">News Grid</a>
                        <a href="single.do" class="dropdown-item">News Detail</a>
                    </div>
                </div>
                <a href="contact.do" class="nav-item nav-link">Contact</a>
                <a href="javascript:;" onclick="popLayer(this);" data-layer="login" class="nav-item nav-link">ログイン</a>
            </div>
        </div>
    </div>
</div>
<!-- Nav Bar End -->



