<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<%@ include file="../common/head.jsp" %>


<script type="text/javascript">
	const ptId = sessionStorage.getItem('pt-id');
</script>

    <body>
        <!-- Bar Start -->
		<jsp:include page="../common/userMenu.jsp" />
        <!-- Bar End -->
        
        <script type="text/javascript">
    		$('#_service').addClass("active");
		</script>


        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>サービス</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Service</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Service Start -->
        <div class="service">
            <div class="container">
                <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                    <p>What we do</p>
                    <h2>サービス 健康のために</h2>
                </div>
                <div class="row" id="serv-list">
                </div>
            </div>
        </div>
        <!-- Service End -->


        
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


<!-- Footer Start -->
<jsp:include page="../common/footer.jsp" />
<script src="${projectPath}/js/top-training/u-service.js?1.1"></script>
<!-- Footer End -->
