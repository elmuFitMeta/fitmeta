<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<%@ include file="../common/head.jsp" %>

<style>

	input[type=checkbox] {
	    display: none;
	}
	.checkbox02 {
	    box-sizing: border-box;
	    cursor: pointer;
	    display: inline-block;
	    padding: 5px 30px;
	    position: relative;
	    width: auto;
	}
	
	.checkbox02::before {
	    background: #fff;
	    border: 1px solid #ccc;
	    border-radius: 3px;
	    content: '';
	    display: block;
	    height: 16px;
	    left: 5px;
	    margin-top: -8px;
	    position: absolute;
	    top: 50%;
	    width: 16px;
	}
	
	.checkbox02::after {
	    border-right: 6px solid #343a40;
	    border-bottom: 3px solid #343a40;
	    content: '';
	    display: block;
	    height: 20px;
	    left: 7px;
	    margin-top: -16px;
	    opacity: 0;
	    position: absolute;
	    top: 50%;
	    transform: rotate(45deg);
	    width: 9px;
	}
	
	input[type=checkbox]:checked + .checkbox02::before {
	    border-color: #666;
	}
	input[type=checkbox]:checked + .checkbox02::after {
	    opacity: 1;
	}
</style>

    <body>
        <!-- Bar Start -->
		<jsp:include page="../common/ptMenu.jsp" />
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
        
        
        <!-- Price Register Form Start -->
        <div class="contact">
            <div class="container">
                <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                    <p>Get In Touch</p>
                    <h2>プランのアップロード</h2>
                </div>
                <div class="row">
                    <div class="col-12 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="contact-form">
                            <div id="success"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Price Register Form End -->


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
                                        <li>Special Class</li>
                                        <li>Free Tutorials</li>
                                        <li>Group Training</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="price-footer">
                                <div class="price-action">
                                    <a class="btn" href="">Join Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="price-item featured-item">
                            <div class="price-header">
                                <div class="price-status">
                                    <span>Popular</span>
                                </div>
                                <div class="price-title">
                                    <h2>Standard</h2>
                                </div>
                                <div class="price-prices">
                                    <h2><small>$</small>99<span>/ mo</span></h2>
                                </div>
                            </div>
                            <div class="price-body">
                                <div class="price-description">
                                    <ul>
                                        <li>Personal Trainer</li>
                                        <li>Special Class</li>
                                        <li>Free Tutorials</li>
                                        <li>Group Training</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="price-footer">
                                <div class="price-action">
                                    <a class="btn" href="">Join Now</a>
                                </div>
                            </div>
                        </div>
                    </div> -->
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
<script src="${projectPath}/js/pt/ptCommon.js?1.1"></script>
<script src="${projectPath}/js/pt/ptPlan.js?1.1"></script>
<!-- Footer End -->
