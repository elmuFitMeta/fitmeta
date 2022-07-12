<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<%@ include file="../common/head.jsp" %>

  <link href="${projectPath}/css/cont.css" rel="stylesheet">

  <body>
    <jsp:include page="../common/ptMenu.jsp" />

    <script>
			$('#_myPage').addClass("active");
		</script>

    <!-- Page Header Start -->
    <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2>環境設定</h2>
                </div>
            </div>
        </div> 
    </div>
    <!-- Page Header End -->

    <div id="" class="set">
      <div id="container" class="container">
        <div id="contents">
          <div class="wfix">
            <div class="tit_comm">
              <h3 class="tit">環境設定</h3>
            </div>
            <div class="wrap_set">
              <div class="menu_set">
                <ul class="list">
                  <li class="on"><a href="javascript:;">会員情報の修正</a></li>
                  <li><a href="javascript:;">SNS情報の変更</a></li>
                  <li><a href="javascript:;">メールアドレス変更</a></li>
                  <li><a href="javascript:;">パスワード変更</a></li>
                  <li><a href="javascript:;">アカウント情報の削除</a></li>
                </ul>
              </div>
              <div class="wrap_cont">
                <div class="hd">
                  <strong class="tit">パーソナルトレーナーの情報</strong>
                </div>
                <div class="cont">
                  <div class="inner">
                    <fieldset>
                      <div class="inner">
                        <div class="thumb"><img id="my-photo" src="" alt="" style="height:100px"></div>
                        <div class="ovf">
                          <input type="hidden"/>
                          <input type="file" name="file[]" id="my_photo_file" style="display:block;" /> 
                          <a href="javascript:document.getElementById('my_photo_file').click();" class="btn_bold">画像変更</a>
                        </div>
                      </div>
                      <dl>
                        <dt>氏名</dt>
                        <dd>
                          <input type="text" id="nm" class="inp" disabled>
                        </dd>
                      </dl>
                      <dl>
                        <dt>メールアド レス</dt>
                        <dd><input type="text" id="mail" class="inp" disabled></dd>
                      </dl>
                      <div style="margin-top:20px; margin-bottom:20px;">
                        <dl>
                          <dt>電話番号</dt>
                          <dd><input type="tel" id="mobile" class="inp" placeholder="電話番号"></dd>
                        </dl>
                        <dl>
                          <dt>住所</dt>
                          <dd><input type="text" id="address" class="inp" placeholder="住所"></dd>
                        </dl>
                      </div>
                      <dl>
                        <dt>トレーナー紹介</dt>
                        <dd><textarea class="inp" id="intro" placeholder="トレーナー紹介"></textarea></dd>
                      </dl>
                      <button type="button" class="btn_bold" id="userInfoBtn">変更事項保存</button>
                    </fieldset>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

<!-- Footer Start -->
<jsp:include page="../common/footer.jsp" />
<script src="${projectPath}/js/pt/ptCommon.js?1.1"></script>
<script src="${projectPath}/js/pt/ptAbout.js?1.1"></script>
<!-- Footer End -->

