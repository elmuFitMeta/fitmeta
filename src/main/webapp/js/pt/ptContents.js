
$(document).ready(function() {

    fStart();

    $(this).on("click","#saveContsBtn", saveContentInfo);

    $('body').on("click", ".pop-view", function(){
        const contsLink = $(this).attr('link');
        $('.popup-image').css('display','block');
        $('#3dviewer').attr('src', contsLink);
    });

    $('.popup-image span').on("click", function(){
        $('.popup-image').css('display','none');
    });
});


function fStart() {

    if(userId != null) {
        mrgelo.core.ajaxSend('getPtContentsInfo', { user_id: userId, user_tp: 'pt'});
        if (mrgelo.data.ptInfo.retcode != "000") return;
        ptInfo = mrgelo.data.ptInfo.ptInfo;
        ptId = ptInfo.pt_id;
        setPtContentsInfo();
    }
}


function setPtContentsInfo() {

    mrgelo.temp.contentList(true);
    $('#contsList').append(htmlText);
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