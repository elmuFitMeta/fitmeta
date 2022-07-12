var ptInfo, ptId;
var userId = window.SESSION_USER_INFO == undefined ? null : window.SESSION_USER_INFO.user_id;
var ptUser = window.SESSION_USER_INFO;

$(document).ready(function() {

  //$('header').css({"background":"none"});

  fStart();
  fSetEvent();

  $(this).on("click","#saveContsBtn", saveContentInfo);
  $(this).on("click","#savePlanBtn", savePlanInfo);

  $('body').on("click", ".pop-view", function(){
    const contsLink = $(this).attr('link');
    $('.popup-image').css('display','block');
    $('#3dviewer').attr('src', contsLink);
  });

  $('.popup-image span').on("click", function(){
    $('.popup-image').css('display','none');
  });

});


function savePlanInfo() {
  var planTp = $('#plan-tp').val().trim();
  var planTmPer = $('#plan-tm').val().trim();
  var planPrice = $('#plan-pr').val().trim();
  var trServs = $('#tr-servs').val().trim();

  if (planTp.length == 0) {
    alert("プランの種類を入力してください。");
    return;
  }

  if (trServs.length == 0) {
    alert("トレーナーのサービスを入力してください。");
    return;
  }


  let servs = '';
  $('#plan .tr-servs').each(function(){
      let tmpSer = $(this).val().trim();
      if (tmpSer != '') {
        servs += tmpSer;
        servs += '#';
      }
  });

  var jsonParam = new Object();
  jsonParam.service_tp = 'plan_info_reg';
  jsonParam.crud_tp = 'c';
  jsonParam.pt_id = ptId;
  jsonParam.plan_tp = planTp;
  jsonParam.plan_tmper = planTmPer;
  jsonParam.plan_price = planPrice;
  jsonParam.plan_service = servs;

  doMultipart(jsonParam);
}

function saveContentInfo() {
  var contsName = $('#conts-name').val().trim();
  var contsLink = $('#conts-link').val().trim();

  if (contsName.length == 0) {
    alert("コンテンツの名前を入力してください。");
    return;
  }

  if (contsLink.length == 0) {
    alert("コンテンツのリンクを入力してください。");
    return;
  }

  var jsonParam = new Object();
  jsonParam.service_tp = 'conts_info_reg';
  jsonParam.crud_tp = 'c';
  jsonParam.pt_id = ptId;
  jsonParam.conts_name = contsName;
  jsonParam.conts_link = contsLink;

  doMultipart(jsonParam);
}


function doMultipart(tmpJson) {
  
  var formData = new FormData();
  formData.append("jsondata", JSON.stringify(tmpJson));

  $.ajax({
    type: 'POST',
    url: "/fit-meta/AjaxFitMetaMultipartController.do",
    processData: false,
    contentType: false,
    data: formData,
    success: function(result) {
      if (result.retcode == "000") {
        alert("저장완료 되었습니다.");
        location.href = "/fit-meta/ptraining/admin.do";
      } else {
        alert(result.retmsg);
      }
    }
  });
}


function fStart() {
  //PT 상세 정보 조회
  if(userId != null) {
    mrgelo.core.ajaxSend('getPtInfo', { user_id: userId});
    if (mrgelo.data.ptInfo.retcode != "000") return;
    ptInfo = mrgelo.data.ptInfo.ptInfo;
    ptId = ptInfo.pt_id;
    setPtInfo();
  }
  
}


function fSetEvent() {

}


function setPtInfo() {

  $('.img_my_mphoto').attr('src', '/fit-meta/downThumbImg.do?pt_id='+ ptInfo.pt_id + '&file=' + ptInfo.file_name);
  $('#intro').text(ptInfo.pt_intro);
  $(".infos").find("dl:eq(0)>dd").text(ptUser.user_name);
  $(".infos").find("dl:eq(1)>dd").text(ptUser.user_mail);
  $(".infos").find("dl:eq(2)>dd").text(ptUser.user_mobile);
  $(".infos").find("dl:eq(3)>dd").text(ptInfo.gym_address);

  mrgelo.temp.contentList();
  $('.item1 .list_thumb').append(htmlText);

  mrgelo.temp.planList(true);
  $('.item3 .pricing_table .pricing_card').append(htmlText);
}


function deleteContent(contsId) {

  let answer = window.confirm("コンテンツを削除しますか？");
  if (!answer) return; 

  var jsonParam = new Object();
  jsonParam.service_tp = 'conts_info_reg';
  jsonParam.crud_tp = 'd';
  jsonParam.pt_id = ptId;
  jsonParam.conts_id = contsId;

  doMultipart(jsonParam);

}

function deletePlan(planId) {
  let answer = window.confirm("プランを削除しますか？");
  if (!answer) return; 

  var jsonParam = new Object();
  jsonParam.service_tp = 'plan_info_reg';
  jsonParam.crud_tp = 'd';
  jsonParam.pt_id = ptId;
  jsonParam.plan_id = planId;

  doMultipart(jsonParam);
}