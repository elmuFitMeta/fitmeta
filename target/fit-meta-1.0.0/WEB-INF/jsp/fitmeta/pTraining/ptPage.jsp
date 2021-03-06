
<%@ 
page language="java"
contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"
%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${projectPath}/css/calendar_main.css"/>
<script src="${projectPath}/js/calendar_main.js"></script>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../common/head.jsp">
	<jsp:param value="cont" name="prefixCssName" />
</jsp:include>

<link rel="stylesheet" href="${projectPath}/css/admin.css?1">
<script src="${projectPath}/js/ptMyPage.js?1.1"></script>

<div class="calendar"></div>
  <script>
  	const request = new XMLHttpRequest();
  	var gId = "s10151023044@gmail.com"
  	request.open('GET', 'https://script.google.com/macros/s/AKfycbywS-GEG-m-ljbRhhRuKrYnV5w_x6smcO27KVgqA71Xq3-avvxiDdRMSLaMTJkbiTKs/exec?googleId='+ gId);
  	request.responseType = 'json';
  	request.onload = function () {
    let data = this.response;
    console.log(data);
    (function() {
        'use strict';

        const calendarEl = document.querySelector('.calendar');
        const calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
            },
            initialDate: formatDate(new Date),
            navLinks: true,
            businessHours: true, 
            editable: true,
            locale: 'ja',
            events: data
        });

        calendar.render();
    }());
  };
  	request.send();

  	function formatDate(dt) {
  		  var y = dt.getFullYear();
  		  var m = ('00' + (dt.getMonth()+1)).slice(-2);
  		  var d = ('00' + dt.getDate()).slice(-2);
  		  return (y + '-' + m + '-' + d);
  		}
</script>


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
                  <span style="width: 90px;">?????????????????????</span>
                  <div class="layer_profile">
                    <div class="inner">
                      <div class="left">
                        <strong>??????</strong>
                        <p id="intro"></p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="infos">
                <dl>
                  <dt style="margin-left: 30px;">??????</dt>
                  <dd style="margin-left: 74px;">&nbsp;</dd>
                </dl>
                <dl>
                  <dt style="width: 80px; margin-left: 30px;">????????????a?????????</dt>
                  <dd style="margin-left: 50px;">&nbsp;</dd>
                </dl>
                <dl>
                  <dt style="margin-left: 30px;">????????????</dt>
                  <dd style="margin-left: 77px;">&nbsp;</dd>
                </dl>
                <dl>
                  <dt style="margin-left: 30px;">???????????????</dt>
                  <dd style="margin-left: 77px;">&nbsp;</dd>
                </dl>
              </div>
            </div>
          </div>
          <div class="wfix">
          <ul class="tab_comm">
			<li class="item1_tab on"><a href="javascript:;">???????????????<span>&nbsp;</span></a></li>
			<li class="item2_tab"><a href="javascript:;">????????????????????????????????????<span></span></a></li>
			<li class="item3_tab"><a href="javascript:;">?????????<span></span></a></li>
			<li class="item4_tab"><a href="javascript:;">??????????????????????????????<span></span></a></li>
			<li class="item5_tab"><a href="javascript:;">??????<span></span></a></li>
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
                            <h3 class="tit">????????????????????????????????????</h3>
                        </div>
                        <div class="wrap_set">
                            <div class="wrap_cont">
                                <div class="hd">
                                    <strong class="tit">????????????????????????</strong>
                                </div>
                                <div class="cont">
                                    <div class="inner">
                                          <fieldset>
                                              <div id="kiup" margin-top:20px; margin-bottom:20px;">
                                                  <dl>
                                                      <dt>????????????????????????</dt>
                                                      <dd><input type="text" id="conts-name" class="inp"></dd>
                                                  </dl>
                                                  <dl>
                                                      <dt>???????????????????????????</dt>
                                                      <dd><input type="text" id="conts-link" class="inp"></dd>
                                                  </dl>
                                                  <!--<dl>
                                                      <dt>?????????????????????</dt>
                                                      <dd><input type="text" name="compy_num" class="inp"></dd>
                                                  </dl>
                                                  <dl>
                                                      <dt>??????????????????</dt>
                                                      <dd><input type="text" name="tel_num" class="inp"></dd>
                                                  </dl>-->
                                              </div>
                                              <!--<div style="margin-top:20px; margin-bottom:20px;">
                                                  <dl>
                                                      <dt>????????????</dt>
                                                      <dd><input type="text" name="phone_num" class="inp"></dd>
                                                  </dl>
                                              </div>
                                              <dl>
                                                  <dt>?????? ??????</dt>
                                                  <dd><textarea class="inp" name="my_intro" placeholder="?????? ??????"></textarea></dd>
                                              </dl>-->
                                              <button class="btn_bold" id="saveContsBtn">????????????????????????</button>
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
          <h1>?????????????????????????????????????????????</h1>
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
                            <h3 class="tit">??????????????????????????????</h3>
                        </div>
                        <div class="wrap_set">
                            <div class="wrap_cont">
                                <div class="hd">
                                    <strong class="tit">??????????????????</strong>
                                </div>
                                <div class="cont">
                                    <div class="inner">
                                          <fieldset>
                                              <div id="plan" margin-top:20px; margin-bottom:20px;">
                                                  <dl>
                                                    <dt>??????????????????</dt>
                                                    <dd><input type="text" id="plan-tp" class="inp"></dd>
                                                  </dl>
                                                  <dl>
                                                    <dt>??????????????????</dt>
                                                    <dd><input type="text" id="plan-tm" class="inp"></dd>
                                                  </dl>
                                                  <dl>
                                                    <dt>??????</dt>
                                                    <dd><input type="text" id="plan-pr" class="inp"></dd>
                                                  </dl>
                                                  <dl>
                                                    <dt>??????????????????????????????</dt>
                                                    <dd><input type="text" id="tr-servs" class="inp tr-servs"></dd>
                                                  </dl>
                                                  <dl>
                                                    <dt>??????????????????????????????</dt>
                                                    <dd><input type="text" class="inp tr-servs"></dd>
                                                  </dl>
                                                  <dl>
                                                    <dt>??????????????????????????????</dt>
                                                    <dd><input type="text" class="inp tr-servs"></dd>
                                                  </dl>
                                                  <dl>
                                                    <dt>??????????????????????????????</dt>
                                                    <dd><input type="text" class="inp tr-servs"></dd>
                                                  </dl>
                                                  <dl>
                                                    <dt>??????????????????????????????</dt>
                                                    <dd><input type="text" class="inp tr-servs"></dd>
                                                  </dl>
                                              </div>
                                              <button class="btn_bold" id="savePlanBtn">??????????????????</button>
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