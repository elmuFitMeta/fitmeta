<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<jsp:include page="common/head.jsp" />


<script>window.sessionStorage.setItem('pt-id', '0');</script>

<body>
    <!-- Bar Start -->
	<jsp:include page="common/menu.jsp"/>
    <!-- Bar End -->

    <!-- Hero Start -->
    <div class="hero">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-sm-12 col-md-6">
                    <div class="hero-text">
                        <h1>KickBoxing Practice For Good Health</h1>
                        <p>
                            Lorem ipsum dolor sit amet elit. Phasell nec pretum mi. Curabi ornare velit non. Aliqua metus tortor auctor quis sem.
                        </p>
                        <div class="hero-btn">
                            <a class="btn" href="">Join Now</a>
                            <a class="btn" href="">Contact Us</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-6 d-none d-md-block">
                    <div class="hero-image">
                        <img src="<c:url value='/images/img/img/hero.png'/>" alt="Hero Image">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero End -->


    <!-- About Start -->
    <div class="about wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-5 col-md-6">
                    <div class="about-img">
                        <img src="<c:url value='/images/img/img/about.png'/>" alt="Image">
                    </div>
                </div>
                <div class="col-lg-7 col-md-6">
                    <div class="section-header text-left">
                        <p>Learn About Us</p>
                        <h2>Welcome to Personal Training</h2>
                    </div>
                    <div class="about-text">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem.
                        </p>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem. Curabitur non nisl nec nisi scelerisque maximus.
                        </p>
                        <a class="btn" href="">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->



    <!-- Team Start -->
    <div class="team">
        <div class="container">
            <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                <p>Kickboxing Trainer</p>
                <h2>Expert Kickboxing Trainer</h2>
            </div>
            <div class="row" id="pt-list">
                <!--<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.0s">
                    <div class="team-item">
                        <div class="team-img">
                            <img src="<c:url value='/images/img/img/team-1.jpg'/>" alt="Image">
                        </div>
                        <div class="team-text">
                            <h2>Millie Harper</h2>
                            <p>Yoga Teacher</p>
                        </div>
                    </div>
                </div>-->
            </div>
        </div>
    </div>
    <!-- Team End -->



    <!-- Discount Start -->
    <div class="discount wow zoomIn" data-wow-delay="0.1s">
        <div class="container">
            <div class="section-header text-center">
                <p>Awesome Discount</p>
                <h2>Get <span>30%</span> Discount for all Classes</h2>
            </div>
            <div class="container discount-text">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non vulputate. Aliquam metus tortor, auctor id gravida condimentum, viverra quis sem. Curabitur non nisl nec nisi scelerisque maximus. 
                </p>
                <a class="btn">Join Now</a>
            </div>
        </div>
    </div>
    <!-- Discount End -->



    <!-- Class Start -->
    <div class="class">
        <div class="container">
            <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                <p>Our Classes</p>
				<div style="display: flex; justify-content: space-between;">
					<h2>トレーニングクラス</h2>
                	<a href="/fit-meta/main/class-list.do" style="cursor: pointer; margin-right:15%; margin-top: 6px; padding: 10px 20px; font-size: 14px; font-weight: 600; letter-spacing: 1px; color: #F7CAC9; background: #343148; border-radius: 0;">view more</a>
				</div>
            </div>
            <div id="class-list" class="row class-container">
                <!--<div class="col-lg-4 col-md-6 col-sm-12 class-item filter-1 wow fadeInUp" data-wow-delay="0.0s">
                    <div class="class-wrap">
                        <div class="class-img">
                            <img src="<c:url value='/images/img/img/class-1.jpg'/>" alt="Image">
                        </div>
                        <div class="class-text">
                            <div class="class-teacher">
                                <img src="<c:url value='/images/img/img/teacher-1.png'/>" alt="Image">
                                <h3>Elise Moran</h3>
                                <a href="">+</a>
                            </div>
                            <h2>Pilates Kickboxing</h2>
                            <div class="class-meta">
                                <p><i class="far fa-calendar-alt"></i>Sun, Tue, Thu</p>
                                <p><i class="far fa-clock"></i>9:00 - 10:00</p>
                            </div>
                        </div>
                    </div>
                </div>-->
            </div>
        </div>
    </div>
    <!-- Class End -->
    
    
<!-- Footer Start -->
<jsp:include page="common/footer.jsp" />
<script src="${projectPath}/js/main/index.js?1.1"></script>
<!-- Footer End -->

