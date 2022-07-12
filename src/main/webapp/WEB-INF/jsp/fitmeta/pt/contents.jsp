<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<%@ include file="../common/head.jsp" %>

    <body>
        <!-- Bar Start -->
		<jsp:include page="../common/ptMenu.jsp" />
        <!-- Bar End -->

		<script>
			$('#_contents').addClass("active");
		</script>

        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>キックボクシングコンテンツ</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">キックボクシングコンテンツ</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        
        
        <!-- Contents Form Start -->
        <div class="contact">
            <div class="container">
                <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                    <p>Get In Touch</p>
                    <h2>コンテンツのアップロード</h2>
                </div>
                <div class="row">
                    <div class="col-12 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="contact-form">
                            <div id="success"></div>
                                <div class="control-group">
                                    <input type="text" class="form-control" id="conts-name" placeholder="コンテンツの名前" />
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="control-group">
                                    <input type="text" class="form-control" id="conts-link" placeholder="コンテンツのリンク" />
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div>
                                    <button class="btn" type="button" id="saveContsBtn">コンテンツを保存</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contents Form End -->


        <!-- Contents Start -->
        <div class="price">
            <div class="container">
                <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                    <p>Kickboxing Contents</p>
                    <h2>キックボクシングの凄さ コンテンツ</h2>
                </div>
                <!--<div class="row">
                    <div class="col-12">
                        <ul id="portfolio-filter">
                            <li data-filter="*" class="filter-active">All Pose</li>
                            <li data-filter=".first">Pilates Yoga</li>
                            <li data-filter=".second">Vinyasa yoga</li>
                            <li data-filter=".third">Hatha Yoga</li>
                        </ul>
                    </div>
                </div>-->
                <div class="row"  id="contsList">
                    <!--<div class="col-lg-4 col-md-6 col-sm-12 portfolio-item first wow fadeInUp" data-wow-delay="0.1s">
                        <div class="portfolio-wrap">
                            <a href="<c:url value='/images/img/img/portfolio-1.jpg'/>" data-lightbox="portfolio">
                                <img src="<c:url value='/images/img/img/portfolio-1.jpg'/>" alt="Portfolio Image">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12 portfolio-item second wow fadeInUp" data-wow-delay="0.3s">
                        <div class="portfolio-wrap">
                            <a href="<c:url value='/images/img/img/portfolio-2.jpg'/>" data-lightbox="portfolio">
                                <img src="<c:url value='/images/img/img/portfolio-2.jpg'/>" alt="Portfolio Image">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12 portfolio-item third wow fadeInUp" data-wow-delay="0.5s">
                        <div class="portfolio-wrap">
                            <a href="<c:url value='/images/img/img/portfolio-3.jpg'/>" data-lightbox="portfolio">
                                <img src="<c:url value='/images/img/img/portfolio-3.jpg'/>" alt="Portfolio Image">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12 portfolio-item first wow fadeInUp" data-wow-delay="0.7s">
                        <div class="portfolio-wrap">
                            <a href="<c:url value='/images/img/img/portfolio-4.jpg'/>" data-lightbox="portfolio">
                                <img src="<c:url value='/images/img/img/portfolio-4.jpg'/>" alt="Portfolio Image">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12 portfolio-item second wow fadeInUp" data-wow-delay="0.9s">
                        <div class="portfolio-wrap">
                            <a href="<c:url value='/images/img/img/portfolio-5.jpg'/>" data-lightbox="portfolio">
                                <img src="<c:url value='/images/img/img/portfolio-5.jpg'/>" alt="Portfolio Image">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12 portfolio-item third wow fadeInUp" data-wow-delay="1.1s">
                        <div class="portfolio-wrap">
                            <a href="<c:url value='/images/img/img/portfolio-6.jpg'/>" data-lightbox="portfolio">
                                <img src="<c:url value='/images/img/img/portfolio-6.jpg'/>" alt="Portfolio Image">
                            </a>
                        </div>
                    </div>-->
                </div>
            </div>
        </div>
        <!-- Contents End -->


        <!-- Discount Start -->
        <div class="discount wow zoomIn" data-wow-delay="0.1s" style="margin-bottom: 90px;">
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


        <!-- Pop Up Video Start -->
        <div class="popup-image">
            <span>&times;</span>
            <iframe id="3dviewer" width="97%" height="97%"></iframe>
        </div>

<jsp:include page="../common/footer.jsp"/>
<script src="${projectPath}/js/pt/ptCommon.js?1.1"></script>
<script src="${projectPath}/js/pt/ptContents.js?1.1"></script>
<!-- Footer End -->
