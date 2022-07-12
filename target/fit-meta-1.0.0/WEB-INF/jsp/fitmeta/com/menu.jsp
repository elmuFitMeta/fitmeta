<%@ 
	page language="java" 
	contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<%
	String user_id		= (String)session.getAttribute("user_id");
%>

<header id="header">
  <div class="wfix">
    <div class="left">
      <h1 class="logo"><a href="${projectPath}/">Fit Meta</a></h1>
      <nav id="gnb">
        <div class="inner">
          <ul class="list_gnb">
            <li class="d1">
              <a href="#" class="ico_aft">トレーニング</a>
              <ul class="list_sub">
                <li><a href="<c:url value='/ptraining/write.do'/>">write</a></li>
                <li><a href="<c:url value='/ptraining/admin.do'/>">admin</a></li>
                <li><a href="<c:url value='/ptraining/ptPage.do'/>">pt-page</a></li>
                <li><a href="<c:url value='/ptraining/index.do'/>">index</a></li>
              </ul>
            </li>
            <li class="d1">
              <a href="#" class="ico_aft">Word</a>
              <ul class="list_sub">
                <li><a href="#">someWord</a></li>
                <li><a href="#">someWord</a></li>
                <li><a href="#">someWord</a></li>
              </ul>
            </li>
            <li class="d1">
              <a href="#" class="ico_aft">someWord</a>
              <ul class="list_sub">
                <li><a href="#">someWord</a></li>
                <li><a href="#">someWord</a></li>
                <li><a href="#">someWord</a></li>
              </ul>
            </li>
          </ul>
        </div>

      </nav>
    </div>
    <div class="right">
      <div id="sch">
        <button type="button" class="tgl_sch"><i class="ico_comm">검색 열기/닫기</i></button>
        <div class="inner">
          <strong class="btn_contsch"><i class="ico_comm">ジム検索</i></strong>
          <input type="text" class="inp inp_contsch sch_word" placeholder="ジム検索">
          <button type="button" class="btn_sch btn_contsch"><i class="ico_comm">검색</i></button>
        </div>
      </div>
      
      <div id="member">
		<!-- 로그인 전 -->
		<a href="javascript:;" onclick="popLayer(this);" data-layer="login" class="ico_bfr link_login">ログイン</a>
		<a href="javascript:;" onclick="popLayer(this);" data-layer="join" class="ico_bfr link_join">サインアップ</a>	
	 </div>
		
		<a href="<c:url value='/gym/write.do'/>" class="upload" onclick="" data-layer="login"><i class="ico_comm"></i>ジム登録</a>		
		<button type="button" class="btn_gnb"><i>메뉴 열기/닫기</i></button>
	</div>
  </div>
</header>
<script>

</script>