<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<%@ include file="../common/head.jsp" %>


<script type="text/javascript">
	<% String pt_id = request.getParameter("pt_id"); %>
	<% String news_uid = request.getParameter("news_id"); %>	
	var ptId = <%=pt_id%>;
	var newsId = <%=news_uid%>;
    const ptNm = sessionStorage.getItem('pt-nm');
</script>

    <body>
        <!-- Bar Start -->
		<jsp:include page="../common/userMenu.jsp" />
        <!-- Bar End -->

        <script>
			$('#_news').addClass("active");
		</script>


        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>ニュースページ</h2>
                    </div>
                    <div class="col-12">
                        <a href="">詳細ページ</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Single Post Start-->
        <div class="single">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div id="single-news" class="single-content wow fadeInUp">
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="sidebar">
                            <div class="sidebar-widget wow fadeInUp">
                                <h2 class="widget-title">最近のニュース</h2>
                                <div class="recent-post" id="news-list">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Post End-->   


<!-- Footer Start -->
<jsp:include page="../common/footer.jsp" />
<script src="${projectPath}/js/top-training/u-singleNews.js?1.1"></script>
<!-- Footer End -->
