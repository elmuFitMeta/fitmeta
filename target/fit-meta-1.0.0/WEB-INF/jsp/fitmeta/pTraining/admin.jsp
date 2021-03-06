
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../common/head.jsp">
	<jsp:param value="cont" name="prefixCssName" />
</jsp:include>

<link rel="stylesheet" href="${projectPath}/css/admin.css?1">
<script src="${projectPath}/js/pTadmin.js?1.1"></script>


  <body>
    <div id="wrap" class="my">
      <div id="container">
        <jsp:include page="../common/menu.jsp" />
        <div id="contents">
          <div class="wfix">
            <div class="hd_member">
              <div class="thumb" style="height:100px"><img class="img_my_mphoto" onerror="this.onerror=null; this.src='/fit-meta/images/img/profile.png'"></div>
              <div class="labs">
                <div class="btn_gray">
                  <span style="width: 90px;">トレーナー紹介</span>
                  <div class="layer_profile">
                    <div class="inner">
                      <div class="left">
                        <strong>紹介</strong>
                        <p id="intro"></p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="infos">
                <dl>
                  <dt style="margin-left: 30px;">名前</dt>
                  <dd style="margin-left: 74px;">&nbsp;</dd>
                </dl>
                <dl>
                  <dt style="width: 80px; margin-left: 30px;">メールアド レス</dt>
                  <dd style="margin-left: 50px;">&nbsp;</dd>
                </dl>
                <dl>
                  <dt style="margin-left: 30px;">移動電話</dt>
                  <dd style="margin-left: 77px;">&nbsp;</dd>
                </dl>
                <dl>
                  <dt style="margin-left: 30px;">ジムの住所</dt>
                  <dd style="margin-left: 77px;">&nbsp;</dd>
                </dl>
              </div>
            </div>
          </div>
          <div class="wfix">
            <ul class="tab_comm">
              <li class="item1_tab on"><a href="javascript:;">コンテンツ<span>&nbsp;</span></a></li>
              <li class="item2_tab"><a href="javascript:;">コンテンツのアップロード<span></span></a></li>
              <li class="item3_tab"><a href="javascript:;">プラン<span></span></a></li>
              <li class="item4_tab"><a href="javascript:;">プランのアップロード<span></span></a></li>
              <li class="item5_tab"><a href="javascript:;">質問<span></span></a></li>
            </ul>
		        <div class="cont_tab">
              <div class="item item1 on">       
              <div id="container" class="hd">
                <strong class="tit"></strong>
              </div>
              <div class="wrap_list">
                <ul class="list_thumb">
                </ul>
              </div>
      
              </div>
              <div class="item item2">
                <div id="wrap" class="set">
                    <div id="container" class="userinfo">
                        <div id="contents">
                            <div class="wfix">
                                <div class="tit_comm">
                                    <h3 class="tit">コンテンツのアップロード</h3>
                                </div>
                                <div class="wrap_set">
                                    <div class="wrap_cont">
                                        <div class="hd">
                                            <strong class="tit">コンテンツの情報</strong>
                                        </div>
                                        <div class="cont">
                                            <div class="inner">
                                                  <fieldset>
                                                      <div id="kiup" margin-top:20px; margin-bottom:20px;">
                                                          <dl>
                                                              <dt>コンテンツの名前</dt>
                                                              <dd><input type="text" id="conts-name" class="inp"></dd>
                                                          </dl>
                                                          <dl>
                                                              <dt>コンテンツのリンク</dt>
                                                              <dd><input type="text" id="conts-link" class="inp"></dd>
                                                          </dl>
                                                      </div>
                                                      <button class="btn_bold" id="saveContsBtn">コンテンツを保存</button>
                                                  </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
              <div class="item item3">
                <section class="pricing_table">
                  <h1>パーソナルトレーニングのプラン</h1>
                  <div class="pricing_card">
                  </div>
              </section>
              </div>
              <div class="item item4">
                <div id="wrap" class="set">
                    <div id="container" class="userinfo">
                        <div id="contents">
                            <div class="wfix">
                                <div class="tit_comm">
                                    <h3 class="tit">プランのアップロード</h3>
                                </div>
                                <div class="wrap_set">
                                    <div class="wrap_cont">
                                        <div class="hd">
                                            <strong class="tit">プランの情報</strong>
                                        </div>
                                        <div class="cont">
                                            <div class="inner">
                                                  <fieldset>
                                                      <div id="plan" margin-top:20px; margin-bottom:20px;">
                                                          <dl>
                                                            <dt>プランの種類</dt>
                                                            <dd><input type="text" id="plan-tp" class="inp"></dd>
                                                          </dl>
                                                          <dl>
                                                            <dt>期間（ヶ月）</dt>
                                                            <dd><input type="text" id="plan-tm" class="inp"></dd>
                                                          </dl>
                                                          <dl>
                                                            <dt>価格</dt>
                                                            <dd><input type="text" id="plan-pr" class="inp"></dd>
                                                          </dl>
                                                          <dl>
                                                            <dt>トレーナーのサービス</dt>
                                                            <dd><input type="text" id="tr-servs" class="inp tr-servs"></dd>
                                                          </dl>
                                                          <dl>
                                                            <dt>トレーナーのサービス</dt>
                                                            <dd><input type="text" class="inp tr-servs"></dd>
                                                          </dl>
                                                          <dl>
                                                            <dt>トレーナーのサービス</dt>
                                                            <dd><input type="text" class="inp tr-servs"></dd>
                                                          </dl>
                                                          <dl>
                                                            <dt>トレーナーのサービス</dt>
                                                            <dd><input type="text" class="inp tr-servs"></dd>
                                                          </dl>
                                                          <dl>
                                                            <dt>トレーナーのサービス</dt>
                                                            <dd><input type="text" class="inp tr-servs"></dd>
                                                          </dl>
                                                      </div>
                                                      <button class="btn_bold" id="savePlanBtn">プランを保存</button>
                                                  </fieldset>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
              <div class="item item5">
      <div class="wrap_list">
        <ul class="list_thumb">
        </ul>
      </div>
              </div>
		        </div>
		      </div>
		    </div>


        <div class="popup-image">
          <span>&times;</span>
          <iframe id="3dviewer" width="80%" height="80%"></iframe>
        </div>
        <jsp:include page="../common/footer.jsp" />
      </div>
    </div>
  </body>
</html>