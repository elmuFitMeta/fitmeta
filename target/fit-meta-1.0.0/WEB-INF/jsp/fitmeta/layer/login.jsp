<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<head>
  <meta name="google-signin-client_id" content="806717128106-64rk1hq26bp3fajmrlg96cfidgk89dvf.apps.googleusercontent.com">
</head>

<script src="https://apis.google.com/js/platform.js?onload=onLoadCallback" async defer></script>


<div id="login" class="layer type2">
  <div class="hd_layer">
    <strong class="tit">ログイン</strong>
    <button type="button" onclick="closeLayer();" class="close"><i class="ico_comm">close</i></button>
  </div>

  <div class="cont_layer">
    <ul class="tab_comm">
      <li class="on"><a href="javascript:;">一般ユーザー</a></li>
      <li><a href="javascript:;">トレーナーユーザー</a></li>
    </ul>
    <div class="cont_tab">
      <div class="item item1 on">
        <div class="form_layer">  
        </div>
      </div>
      <div class="item item2">
        <div class="form_layer">
        </div>
      </div>
    </div>
	  <label>Googleでサインイン</label>
	  <div style="width:auto;" class="fico_br btn_bold" onclick="targetUser()">
		  <div class="g-signin2" data-width="365" data-height="40" data-theme="dark" data-onsuccess="onSignIn" data-longtitle="true"></div>
	  </div> 
    <script>
      let targetPage = '0';
      function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();
        let cnt = 0;
        mrgelo.data.socialUserInfo = {
          id: profile.getId(),
          name: profile.getName(),
          email: profile.getEmail(),
          imgUrl: profile.getImageUrl()
        }

        if(targetPage == '0') mrgelo.core.ajaxSend('loginCheck', { gUser_id : mrgelo.data.socialUserInfo.id });
        if(targetPage != '0') goTargetPage(targetPage);
      }

      function onLoadCallback() {
        //Googleでサインイン
        $('span[id^="not_signed_"]').html('Googleでサインイン');
      }

      function targetUser() {
        targetPage = $('.item1').hasClass('on') ? '1' : '2';
      }

    </script>
  </div>
  <br>
  <div class="ft_layer">
    <a href="javascript:;"  data-layer="login" class="btn_ft">FitMeta</a>
  </div>
</div>

<script>
  $(document).ready(function(){
    $(".tab_comm li").click(function (e) {
      var thistab = $(this).parents('.tab_comm');
      var thisitem = $(this).parents('.tab_comm').next($('.cont_tab')).children($('.item'));
      var eq = thistab.children('li').index(this);
      thisitem.removeClass('on')
      thisitem.eq(eq).addClass('on')
      thistab.children('li').each(function () {
        if ($(this).hasClass("on")) {
          $(this).removeClass("on");
        }
      });
      $(this).addClass("on");
    });

  })
</script>
