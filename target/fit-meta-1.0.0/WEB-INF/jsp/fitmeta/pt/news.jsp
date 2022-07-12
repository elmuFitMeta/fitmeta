<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<%@ include file="../common/head.jsp" %>

    <body>
        <!-- Bar Start -->
		<jsp:include page="../common/ptMenu.jsp" />
        <!-- Bar End -->

		<script>
			$('#_news').addClass("active");
		</script>

        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>パーソナルトレーナーのニュース</h2>
                    </div>
                    <div class="col-12">
                        <a href="">パーソナルトレーナーのニュース</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->
        
        
        <!-- Register Form For News Start -->
        <div class="contact">
            <div class="container">
                <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                    <p>Get In Touch</p>
                    <h2>ニュースのアップロード</h2>
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
                                    <input type="text" class="form-control" id="news-title" placeholder="ニュース名" />
                                    <p class="help-block text-danger"></p> 
                                </div>
                                <div class="control-group">
                                    <textarea class="form-control" id="news-info" placeholder="ニュース情報" ></textarea>
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div>
                                    <button class="btn" type="button" id="saveNewsBtn">ニュースを保存</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Register Form For News End -->


        <!-- Blog Start -->
        <div class="blog">
            <div class="container">
                <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                    <p>From News</p>
                    <h2>最新ニュース記事</h2>
                </div>
                <div class="row blog-page" id="news-list">
                    <!--<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.0s">
                        <div class="blog-item">
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
                        </div>
                    </div>-->
                </div>
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
<script src="${projectPath}/js/pt/ptCommon.js?1.1"></script>
<script src="${projectPath}/js/pt/ptNews.js?1.1"></script>
<!-- Footer End -->