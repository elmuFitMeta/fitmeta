<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<%@ include file="../common/head.jsp" %>

<script type="text/javascript">
	const ptId = sessionStorage.getItem('pt-id');
    const ptNm = sessionStorage.getItem('pt-nm');
</script>

    <body>
        <!-- Bar Start -->
		<jsp:include page="../common/userMenu.jsp" />
        <!-- Bar End -->

        <script>
			$('#_price').addClass("active");
		</script>

        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>価格</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Price</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Price Start -->
        <div class="price">
            <div class="container">
                <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                    <p>Kickboxing Package</p>
                    <h2>キックボクシングの料金プラン</h2>
                </div>
                <div class="row" id="plan-list">
                </div>
            </div>
        </div>
        <!-- Price End -->
        
        
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
        <div class="popup-desc">
            <span>&times;</span>
            
            <div class="tt_custom_sm">
                <iframe id="_link" src="" width="97%" height="97%"></iframe> <br>
                <h2 id="class-title" style="text-align:center;"></h2> <br>
                <h4 id="class-desc"></h4>
            </div>
        </div>


<!-- Footer Start -->
<jsp:include page="../common/footer.jsp" />
<script src="${projectPath}/js/top-training/u-price.js?1.1"></script>
<!-- Footer End -->
