<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<%@ include file="../common/head.jsp" %>



    <body>
        <!-- Bar Start -->
		<jsp:include page="../common/ptMenu.jsp" />
        <!-- Bar End -->

		<script>
			$('#_class').addClass("active");
		</script>

        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>クラス</h2>
                    </div>
                    <div class="col-12">
                        <a href="">Home</a>
                        <a href="">Class</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        
        
                <!-- Register Form For Class Start -->
        <div class="contact">
            <div class="container">
                <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                    <p>Get In Touch</p>
                    <h2>クラスのアップロード</h2>
                </div>
                <div class="row">
                    <div class="wrap_upload col-12 wow fadeInUp" data-wow-delay="0.1s">
                        <div id="file_3d" class="fileupload_area item item1 contact-form">
                            <div class="cont_upload">
                                <div class="area_drag">
                                    <div class="filebox1">
                                        <label for="ex_file">写真を追加</label>
                                        <input id="ex_file" type="file" enctype="multipart/form-data" multiple="">
                                    </div>
                                    <p>
                                        	アップロードするファイルを選択するか、直接ドラッグしてください。<br />
                                        	ファイルフォーマットは png, jpg, jpeg, gif, bmpが可能です。<br />
                                    </p>
                                </div>
                                <ul class="list_file"></ul>
                            </div>
                        </div>
                   </div>
                    <div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="contact-form">
                            <div id="success"></div>
                            <form name="sentMessage" id="contactForm" novalidate="novalidate">
                                <div class="control-group">
                                    <input type="text" class="form-control" id="class-nm" placeholder="クラス名" />
                                    <p class="help-block text-danger"></p> 
                                </div>
                                <div class="control-group">
                                    <input type="text" class="form-control" id="class-tp" placeholder="クラスのタイプ" />
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="control-group">
                                    <input type="text" class="form-control" id="video-link" placeholder="クラスの動画リンク" />
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="control-group">
                                    <textarea class="form-control" id="class-intro" placeholder="授業紹介" ></textarea>
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div>
                                    <button class="btn" type="button" id="saveClassBtn">クラスを保存</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Register Form For Class End -->


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
                            <!--<li data-filter="*" class="filter-active">All Classes</li>
                            <li data-filter=".filter-5">Body Balance</li>
                            <li data-filter=".filter-2">Hatha Yoga</li>
                            <li data-filter=".filter-3">Children Yoga</li>
                            <li data-filter=".filter-4">Yoga Dance</li>-->
                        </ul>
                    </div>
                </div>
                <div class="row class-container" id="class-list">
                    <!--<div class="col-lg-4 col-md-6 col-sm-12 class-item filter-5 wow fadeInUp" data-wow-delay="0.0s">
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
                                <h2>Pilates Yoga</h2>
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
<script src="${projectPath}/js/pt/ptClass.js?1.1"></script>
<!-- Footer End -->
