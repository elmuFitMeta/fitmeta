<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />
<% String pt_id = request.getParameter("pt_id"); %>

<jsp:include page="../common/head.jsp" />


<script type="text/javascript">
	var ptId = <%=pt_id%>;
    
    if(ptId != null) {
    	window.sessionStorage.removeItem('pt-id');
    	window.sessionStorage.setItem('pt-id', ptId);
   	}
    
    ptId = sessionStorage.getItem('pt-id');
</script>


<body>
    <!-- Bar Start -->
	<jsp:include page="../common/userMenu.jsp"/>
    <!-- Bar End -->
    
  	<script>
		$('#_home').addClass("active");
	</script>
	
	<!-- Hero Start -->
    <div class="hero">
    </div>
    <!-- Hero End -->


    <!-- About Start -->
    <div class="about wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div id="pt-info" class="row align-items-center">
                <!--<div class="col-lg-5 col-md-6">
                    <div class="about-img">
                        <img src="" alt="Image">
                    </div>
                </div>
                <div class="col-lg-7 col-md-6">
                    <div class="section-header text-left">
                        <p></p>
                        <h2></h2>
                    </div>
                    <div class="about-text">
                        <p></p>
                        <a class="btn" href="">Learn More</a>
                    </div>
                </div> -->
            </div>
        </div>
    </div>
    <!-- About End -->


    <!-- Class Start -->
    <div class="class">
        <div class="container">
            <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                <p>Our Classes</p>
                <h2>パーソナルトレーナー・クラス</h2>
            </div>
            <div class="row">
                <div class="col-12">
                    <ul id="class-filter">
                        <!--<li data-filter="*" class="filter-active">All Classes</li>-->
                    </ul>
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


    <!-- Contents Start -->
    <div class="price">
        <div class="container">
            <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                <p>Kickboxing Contents</p>
                <h2>キックボクシングの凄さ コンテンツ</h2>
            </div>
            <div class="row"  id="conts-list">
            </div>
        </div>
    </div>
    <!-- Contents End -->
    
    
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
    
    
    <!-- Price Start -->
    <div class="price">
        <div class="container">
            <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                <p>Kickboxing Package</p>
                <h2>キックボクシングの料金プラン</h2>
            </div>
            <div class="row" id="plan-list">
                <!--<div class="col-md-4 wow fadeInUp" data-wow-delay="0.0s">
                    <div class="price-item">
                        <div class="price-header">
                            <div class="price-title">
                                <h2>Basic</h2>
                            </div>
                            <div class="price-prices">
                                <h2><small>$</small>49<span>/ mo</span></h2>
                            </div>
                        </div>
                        <div class="price-body">
                            <div class="price-description">
                                <ul>
                                    <li>Personal Trainer</li>
                                </ul>
                            </div>
                        </div>
                        <div class="price-footer">
                            <div class="price-action">
                                <a class="btn" href="">Join Now</a>
                            </div>
                        </div>
                    </div>
                </div>-->
            </div>
        </div>
    </div>
    <!-- Price End -->


    <!-- Service Start -->
    <div class="service">
        <div class="container">
            <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                <p>What we do</p>
                <h2>サービス 健康のために</h2>
            </div>
            <div class="row" id="serv-list">
                <!--<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.0s">
                    <div class="service-item">
                        <div class="service-icon">
                            <i class="flaticon-workout"></i>
                        </div>
                        <h3>Heal emotions</h3>
                        <p>
                            Lorem ipsum dolor sit amet elit. Phasellus nec pretium mi. Curabitur facilisis ornare velit non
                        </p>
                    </div>
                </div>-->
            </div>
        </div>
    </div>
    <!-- Service End -->
    
    
    <!-- Testimonial Start -->
    <div class="testimonial wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="section-header text-center">
                <p>Testimonial</p>
                <h2>Our Client Say!</h2>
            </div>
            <div class="owl-carousel testimonials-carousel">
                <div class="testimonial-item">
                    <div class="testimonial-img">
                        <img src="<c:url value='/images/img/img/testimonial-1.jpg'/>" alt="Image">
                    </div>
                    <div class="testimonial-text">
                        <p>
                            Lorem ipsum dolor sit amet consec adipis elit. Etiam accums lacus eget velit tincid, quis suscip justo dictum.
                        </p>
                        <h3>Customer Name</h3>
                        <h4>Profession</h4>
                    </div>
                </div>
                <div class="testimonial-item">
                    <div class="testimonial-img">
                        <img src="<c:url value='/images/img/img/testimonial-2.jpg'/>" alt="Image">
                    </div>
                    <div class="testimonial-text">
                        <p>
                            Lorem ipsum dolor sit amet consec adipis elit. Etiam accums lacus eget velit tincid, quis suscip justo dictum.
                        </p>
                        <h3>Customer Name</h3>
                        <h4>Profession</h4>
                    </div>
                </div>
                <div class="testimonial-item">
                    <div class="testimonial-img">
                        <img src="<c:url value='/images/img/img/testimonial-3.jpg'/>" alt="Image">
                    </div>
                    <div class="testimonial-text">
                        <p>
                            Lorem ipsum dolor sit amet consec adipis elit. Etiam accums lacus eget velit tincid, quis suscip justo dictum.
                        </p>
                        <h3>Customer Name</h3>
                        <h4>Profession</h4>
                    </div>
                </div>
                <div class="testimonial-item">
                    <div class="testimonial-img">
                        <img src="<c:url value='/images/img/img/testimonial-4.jpg'/>" alt="Image">
                    </div>
                    <div class="testimonial-text">
                        <p>
                            Lorem ipsum dolor sit amet consec adipis elit. Etiam accums lacus eget velit tincid, quis suscip justo dictum.
                        </p>
                        <h3>Customer Name</h3>
                        <h4>Profession</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->


    <!-- Blog Start -->
    <div class="blog">
        <div class="container">
            <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                <p>From News</p>
                <h2>最新ニュース記事</h2>
            </div>
            <div id="news-list" class="owl-carousel blog-carousel wow fadeInUp" data-wow-delay="0.1s">
                <!--<div class="blog-item">
                    <div class="blog-img">
                        <img src="<c:url value='/images/img/img/blog-1.jpg'/>" alt="Blog">
                    </div>
                    <div class="blog-text">
                        <h2>Lorem ipsum dolor</h2>
                        <div class="blog-meta">
                            <p><i class="far fa-list-alt"></i>Body Fitness</p>
                            <p><i class="far fa-calendar-alt"></i>01-Jan-2045</p>
                            <p><i class="far fa-comments"></i>5</p>
                        </div>
                        <p>
                            Lorem ipsum dolor sit amet elit. Neca pretim miura bitur facili ornare velit non vulpte liqum metus tortor
                        </p>
                        <a class="btn" href="">Read More <i class="fa fa-angle-right"></i></a>
                    </div>
                </div>-->
            </div>
        </div>
    </div>
    <!-- Blog End -->


    <!-- Pop Up Video Start -->
    <div class="popup-desc">
        <span>&times;</span>       
        <div class="tt_custom_sm">
            <h2 id="class-title" style="text-align:center;"></h2> <br>
            <h4 id="class-desc"></h4>
        </div>
    </div>

    <!-- Pop Up Video Start -->
    <div class="popup-image">
        <span>&times;</span>
        <iframe id="3dviewer" width="97%" height="97%"></iframe>
    </div>
    
    
<!-- Footer Start -->
<jsp:include page="../common/footer.jsp" />
<script src="${projectPath}/js/top-training/u-index.js?1.1"></script>
<!-- Footer End -->

